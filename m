Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF9F2C43219
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 16:30:17 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.5975.1643041816094128001
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 08:30:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDFF3D6E
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:15 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB0383F793
	for <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 08:30:14 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/4] arm-bsp: remove Corstone 700
Date: Mon, 24 Jan 2022 16:30:09 +0000
Message-Id: <20220124163012.3796553-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 16:30:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2898

Corstone 700 is end-of-life, so remove it from meta-arm master.

It will remain in the stable branches for existing users, but new users
are encouraged to use Corstone 1000 instead.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml                                |    6 -
 ci/corstone700-fvp.yml                        |   10 -
 ci/corstone700-mps3.yml                       |    6 -
 ci/fvps.yml                                   |    1 -
 .../conf/machine/corstone700-fvp.conf         |   12 -
 .../conf/machine/corstone700-mps3.conf        |   17 -
 .../conf/machine/include/corstone700.inc      |   32 -
 meta-arm-bsp/documentation/corstone700.md     |   21 -
 .../boot-firmware/gen-module-race.patch       |   66 -
 .../boot-firmware/boot-firmware_git.bb        |   62 -
 .../external-system/external-system_0.1.0.bb  |   45 -
 .../trusted-firmware-a-corstone700.inc        |   18 -
 .../trusted-firmware-a_2.6.bbappend           |    1 -
 .../0001-arm-Add-corstone700-platform.patch   |  268 --
 ...dd-bootx-command-to-start-XiP-images.patch |  136 -
 ...g-the-XIP-kernel-using-bootx-command.patch |   39 -
 ...4-arm-enabling-the-arch_timer-driver.patch |   61 -
 .../u-boot/u-boot_2020.04.bbappend            |    8 -
 .../bsp/arm-platforms/corstone700-bsp.scc     |    6 -
 .../bsp/arm-platforms/corstone700/base.cfg    |   35 -
 .../arm-platforms/corstone700/eth_lan9115.scc |    4 -
 .../corstone700/eth_lan91c111.scc             |    4 -
 .../bsp/arm-platforms/corstone700/lan9115.cfg |    1 -
 .../arm-platforms/corstone700/lan91c111.cfg   |    1 -
 .../bsp/arm-platforms/corstone700/pnp.cfg     |    4 -
 .../arm-platforms/corstone700/usb_host.cfg    |    8 -
 .../bsp/arm-platforms/corstone700/xip.cfg     |   12 -
 .../arm-platforms/corstone700/xip_cmdline.cfg |    3 -
 .../corstone700/xip_dhcp_cmdline.cfg          |    3 -
 ...-for-a-single-ARMv7-A-based-platform.patch |   97 -
 .../0002-arm-Add-tiny-vexpress-machine.patch  |  101 -
 ...-arm-introduce-corstone700_defconfig.patch |  197 --
 ...ilbox-handling-unit-controller-versi.patch |  322 ---
 ...d-on-rpmsg-char-driver-using-mailbox.patch |  202 --
 ...arm-MHU-driver-and-RPMSG-char-driver.patch |   30 -
 ...ation-of-multiple-arm-rpmsg-channels.patch |  148 --
 ...ombined-receiver-interrupt-when-usin.patch |   59 -
 ...stone700-external-system-harness-dri.patch |  232 --
 ...ize-endpoint-and-mailbox-information.patch |  181 --
 ...ox-channel-ownership-to-rpmsg-endpoi.patch |  107 -
 ...v2-add-new-AMBA-ID-to-support-MHU-v2.patch |   36 -
 ...hu_v2-dynamic-allocation-of-channels.patch |  119 -
 ...t-XIP-physical-address-to-3MB-offset.patch |   42 -
 ...ble-ARM_VIRT-extension-if-XIP_KERNEL.patch |   50 -
 ...onfig-use-DDR-address-instead-of-sha.patch |   34 -
 ...config-enable-configs-for-cramfs-xip.patch |   61 -
 ...0-move-to-regmap-for-register-access.patch | 2297 -----------------
 ...cd-refactor-mempool-config-and-setup.patch |  302 ---
 ...-usb-isp1760-add-support-for-isp1763.patch | 1755 -------------
 .../linux/linux-arm-platforms.inc             |   53 -
 .../corstone700-test-app_1.0.bb               |   21 -
 .../wic/arm-reference-image.corstone700.wks   |   22 -
 .../recipes-devtools/fvp/fvp-corstone700.bb   |    9 -
 53 files changed, 7367 deletions(-)
 delete mode 100644 ci/corstone700-fvp.yml
 delete mode 100644 ci/corstone700-mps3.yml
 delete mode 100644 meta-arm-bsp/conf/machine/corstone700-fvp.conf
 delete mode 100644 meta-arm-bsp/conf/machine/corstone700-mps3.conf
 delete mode 100644 meta-arm-bsp/conf/machine/include/corstone700.inc
 delete mode 100644 meta-arm-bsp/documentation/corstone700.md
 delete mode 100644 meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware/=
gen-module-race.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_=
git.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/external-system/external-sys=
tem_0.1.0.bb
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-corstone700.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corsto=
ne700/0001-arm-Add-corstone700-platform.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corsto=
ne700/0002-boot-add-bootx-command-to-start-XiP-images.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corsto=
ne700/0003-boot-starting-the-XIP-kernel-using-bootx-command.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corsto=
ne700/0004-arm-enabling-the-arch_timer-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappe=
nd
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700-bsp.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/base.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/eth_lan9115.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/eth_lan91c111.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/lan9115.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/lan91c111.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/pnp.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/usb_host.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/xip.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/xip_cmdline.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/corstone700/xip_dhcp_cmdline.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
001-arm-support-for-a-single-ARMv7-A-based-platform.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
002-arm-Add-tiny-vexpress-machine.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
003-arm-introduce-corstone700_defconfig.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
004-add-driver-of-mailbox-handling-unit-controller-versi.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
007-allow-creation-of-multiple-arm-rpmsg-channels.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
008-mailbox-enable-combined-receiver-interrupt-when-usin.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
009-misc-arm-add-corstone700-external-system-harness-dri.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
010-arm-containerize-endpoint-and-mailbox-information.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
011-arm-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
014-defconfig-adjust-XIP-physical-address-to-3MB-offset.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
016-corstone700_defconfig-use-DDR-address-instead-of-sha.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
017-corstone700_defconfig-enable-configs-for-cramfs-xip.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
018-usb-isp1760-move-to-regmap-for-register-access.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
019-usb-isp1760-hcd-refactor-mempool-config-and-setup.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone700/0=
020-usb-isp1760-add-support-for-isp1763.patch
 delete mode 100644 meta-arm-bsp/recipes-test/corstone700-test-app/corsto=
ne700-test-app_1.0.bb
 delete mode 100644 meta-arm-bsp/wic/arm-reference-image.corstone700.wks
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone700.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9a60f672..4a968486 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -109,12 +109,6 @@ metrics:
 corstone500:
   extends: .build
=20
-corstone700-fvp:
-  extends: .build
-
-corstone700-mps3:
-  extends: .build
-
 corstone1000-fvp:
   extends: .build
=20
diff --git a/ci/corstone700-fvp.yml b/ci/corstone700-fvp.yml
deleted file mode 100644
index 3c062f2a..00000000
--- a/ci/corstone700-fvp.yml
+++ /dev/null
@@ -1,10 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-
-machine: corstone700-fvp
-
-local_conf_header:
-  image: |
-    CORE_IMAGE_EXTRA_INSTALL =3D "corstone700-test-app"
diff --git a/ci/corstone700-mps3.yml b/ci/corstone700-mps3.yml
deleted file mode 100644
index 4ce03e8b..00000000
--- a/ci/corstone700-mps3.yml
+++ /dev/null
@@ -1,6 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/corstone700-fvp.yml
-
-machine: corstone700-mps3
diff --git a/ci/fvps.yml b/ci/fvps.yml
index 6ed00122..576faa31 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -16,6 +16,5 @@ target:
   - nativesdk-fvp-n1-edge
   - nativesdk-fvp-sgi575
   - nativesdk-fvp-corstone500
-  - nativesdk-fvp-corstone700
   - nativesdk-fvp-corstone1000
   - nativesdk-fvp-tc0
diff --git a/meta-arm-bsp/conf/machine/corstone700-fvp.conf b/meta-arm-bs=
p/conf/machine/corstone700-fvp.conf
deleted file mode 100644
index 6056b36d..00000000
--- a/meta-arm-bsp/conf/machine/corstone700-fvp.conf
+++ /dev/null
@@ -1,12 +0,0 @@
-#@TYPE: Machine
-#@NAME: corstone700-fvp machine
-#@DESCRIPTION: Machine configuration for Corstone700 FVP
-
-require conf/machine/include/corstone700.inc
-
-# default feature used: eth_lan91c111
-# add the following line to local.conf to disable the feature:
-# MACHINE_FEATURES:remove =3D "eth_lan91c111"
-MACHINE_FEATURES +=3D "eth_lan91c111"
-
-TFA_TARGET_PLATFORM =3D "fvp"
diff --git a/meta-arm-bsp/conf/machine/corstone700-mps3.conf b/meta-arm-b=
sp/conf/machine/corstone700-mps3.conf
deleted file mode 100644
index 916ba0e4..00000000
--- a/meta-arm-bsp/conf/machine/corstone700-mps3.conf
+++ /dev/null
@@ -1,17 +0,0 @@
-#@TYPE: Machine
-#@NAME: corstone700-mps3 machine
-#@DESCRIPTION: Machine configuration for Corstone700 MPS3
-
-require conf/machine/include/corstone700.inc
-
-# default feature used: eth_lan9115
-# add the following line to local.conf to disable the feature:
-# MACHINE_FEATURES:remove =3D "eth_lan9115"
-MACHINE_FEATURES +=3D "eth_lan9115"
-
-# default feature used: usb_host
-# add the following line to local.conf to disable the feature:
-# MACHINE_FEATURES:remove =3D "usb_host"
-MACHINE_FEATURES +=3D "usb_host"
-
-TFA_TARGET_PLATFORM =3D "fpga"
diff --git a/meta-arm-bsp/conf/machine/include/corstone700.inc b/meta-arm=
-bsp/conf/machine/include/corstone700.inc
deleted file mode 100644
index fbb52776..00000000
--- a/meta-arm-bsp/conf/machine/include/corstone700.inc
+++ /dev/null
@@ -1,32 +0,0 @@
-# Common configuration for all Corstone700 machines
-
-require conf/machine/include/arm/armv8a/tune-cortexa32.inc
-
-MACHINEOVERRIDES =3D. "corstone700:"
-
-TFA_PLATFORM =3D "corstone700"
-
-SERIAL_CONSOLES ?=3D "115200;ttyAMA0"
-
-PREFERRED_PROVIDER_virtual/kernel =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "5.6%"
-
-PREFERRED_VERSION_gcc-arm-none-eabi-native ?=3D "9-2020-q2-update"
-
-PREFERRED_PROVIDER_virtual/control-processor-firmware ?=3D "boot-firmwar=
e"
-
-EXTRA_IMAGEDEPENDS +=3D " \
-                      trusted-firmware-a          \
-                      external-system                     \
-                      u-boot                              \
-                      virtual/control-processor-firmware  \
-                      "
-
-WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
-
-WKS_FILE ?=3D "arm-reference-image.corstone700.wks"
-
-VIRTUAL-RUNTIME_dev_manager =3D "busybox-mdev"
-
-UBOOT_MACHINE ?=3D "corstone700_defconfig"
-PREFERRED_VERSION_u-boot ?=3D "2020.04"
diff --git a/meta-arm-bsp/documentation/corstone700.md b/meta-arm-bsp/doc=
umentation/corstone700.md
deleted file mode 100644
index 6a5fe0f5..00000000
--- a/meta-arm-bsp/documentation/corstone700.md
+++ /dev/null
@@ -1,21 +0,0 @@
-# Corstone-700
-
-## Overview
-
-Corstone-700 is a flexible compute architecture combining Cortex-A and C=
ortex-M
-processors and a secure enclave, aimed at building secure IoT SoCs.  The=
re are
-machines for both Corstone-700 for Fixed Virtual Platform (`corstone700-=
fvp`)
-and Corstone-700 for MPS3 FPGA (`corstone700-mps3`).
-
-Further details are available in the [User Guide].
-
-## Building
-
-Corstone-700 is tested in 'tiny' configurations, such as `DISTRO=3D"poky=
-tiny"`.
-
-## Running
-
-For detailed instructions as to how to run the image in a FVP model, or =
on the
-MPS3 board, see the [User Guide].
-
-[User Guide]: https://git.linaro.org/landing-teams/working/arm/arm-refer=
ence-platforms.git/about/docs/corstone-700/user-guide.rst
diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware/gen-mod=
ule-race.patch b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware/gen=
-module-race.patch
deleted file mode 100644
index c93e91a2..00000000
--- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware/gen-module-rac=
e.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 34e1c04534607f5605255f39fb46e26261fc9c4e Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Tue, 8 Sep 2020 11:49:08 +0100
-Subject: [PATCH] tools/gen_module_code: atomically rewrite the generated=
 files
-
-The gen_module rule in rules.mk is marked as .PHONY, so make will
-execute it whenever it is mentioned. This results in gen_module_code
-being executed 64 times for a Juno build.
-
-However in heavily parallel builds there's a good chance that
-gen_module_code is writing a file whilst the compiler is reading it
-because make also doesn't know what files are generated by
-gen_module_code.
-
-The correct fix is to adjust the Makefiles so that the dependencies are
-correct but this isn't trivial, so band-aid the problem by atomically
-writing the generated files.
-
-Change-Id: I82d44f9ea6537a91002e1f80de8861d208571630
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- tools/gen_module_code.py | 19 ++++++++++++++-----
- 1 file changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/tools/gen_module_code.py b/tools/gen_module_code.py
-index 7b3953845..ee099b713 100755
---- a/tools/gen_module_code.py
-+++ b/tools/gen_module_code.py
-@@ -17,6 +17,7 @@
- import argparse
- import os
- import sys
-+import tempfile
-=20
- DEFAULT_PATH =3D 'build/'
-=20
-@@ -53,13 +54,21 @@
-=20
- def generate_file(path, filename, content):
-     full_filename =3D os.path.join(path, filename)
--    with open(full_filename, 'a+') as f:
--        f.seek(0)
--        if f.read() !=3D content:
-+
-+    try:
-+        with open(full_filename) as f:
-+            rewrite =3D f.read() !=3D content
-+    except FileNotFoundError:
-+        rewrite =3D True
-+
-+    if rewrite:
-+        with tempfile.NamedTemporaryFile(prefix=3D"gen-module-code",
-+                                         dir=3Dpath,
-+                                         delete=3DFalse,
-+                                         mode=3D"wt") as f:
-             print("[GEN] {}...".format(full_filename))
--            f.seek(0)
--            f.truncate()
-             f.write(content)
-+        os.replace(f.name, full_filename)
-=20
-=20
- def generate_header(path, modules):
diff --git a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb =
b/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
deleted file mode 100644
index abd4e328..00000000
--- a/meta-arm-bsp/recipes-bsp/boot-firmware/boot-firmware_git.bb
+++ /dev/null
@@ -1,62 +0,0 @@
-SUMMARY =3D "Boot Processor firmware for Corstone700"
-DESCRIPTION =3D "Boot Processor firmware"
-
-LICENSE =3D "BSD-3-Clause & Apache-2.0"
-LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0 \
-                    file://cmsis/LICENSE.txt;md5=3De3fc50a88d0a364313df4=
b21ef20c29e"
-
-SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/boot-firmw=
are.git;protocol=3Dhttps;branch=3Dmaster \
-           file://gen-module-race.patch"
-SRCREV =3D "af7eeb1bb8c5a85a5e5a76d48acc6fe864d715a9"
-PV =3D "2020.02.10+git${SRCPV}"
-
-PROVIDES +=3D "virtual/control-processor-firmware"
-
-DEPENDS =3D "virtual/arm-none-eabi-gcc-native trusted-firmware-a"
-
-inherit deploy
-
-B =3D "${WORKDIR}/build"
-S =3D "${WORKDIR}/git"
-
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-COMPATIBLE_MACHINE =3D "(corstone700-*)"
-SCP_PLATFORM =3D "corstone-700"
-
-LDFLAGS[unexport] =3D "1"
-
-do_configure[noexec] =3D "1"
-
-EXTRA_OEMAKE =3D "PRODUCT=3D'${SCP_PLATFORM}' \
-                BUILD_PATH=3D${B} \
-                CROSS_COMPILE=3D'arm-none-eabi-' \
-                V=3Dy \
-               "
-
-do_compile() {
-    oe_runmake -C ${S}/tools/spitoc CC=3D${BUILD_CC} all
-    oe_runmake -C ${S}
-}
-do_compile[cleandirs] +=3D "${B}"
-
-do_install() {
-    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_ramfw/release/=
bin/firmware.bin ${D}/firmware/se_ramfw.bin
-    install -D -p -m 0644 ${B}/product/${SCP_PLATFORM}/se_romfw/release/=
bin/firmware.bin ${D}/firmware/se_romfw.bin
-    ${S}/tools/spitoc/spitoc \
-        --seram ${D}/firmware/se_ramfw.bin \
-        --offset 1  \
-        --fip ${RECIPE_SYSROOT}/firmware/fip.bin-${TFA_PLATFORM} \
-        --offset  33 \
-        --out ${D}/firmware/spitoc.bin
-}
-
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-# Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP:${PN} =3D "textrel"
-
-do_deploy() {
-    # Copy the images to deploy directory
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
deleted file mode 100644
index 1ab745e8..00000000
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ /dev/null
@@ -1,45 +0,0 @@
-SUMMARY =3D "External system Cortex-M3 Firmware"
-DESCRIPTION =3D "Firmware to be loaded and run in External System Harnes=
s in\
-               support to the main application CPU."
-HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/external-=
system.git"
-DEPENDS =3D "gcc-arm-none-eabi-native"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0"
-
-SRC_URI =3D "gitsm://git.linaro.org/landing-teams/working/arm/external-s=
ystem.git;protocol=3Dhttps;branch=3Dmaster"
-SRCREV =3D "41ef76951c5119729c1ea305406f74776da90866"
-PV .=3D "~git${SRCPV}"
-
-COMPATIBLE_MACHINE =3D "(corstone700-*)"
-
-# PRODUCT is passed to the Makefile to specify the platform to be used
-PRODUCT =3D "corstone-700"
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-
-LDFLAGS[unexport] =3D "1"
-
-do_compile() {
-    oe_runmake -C ${S} V=3Dy \
-        BUILD_PATH=3D${B} \
-        PRODUCT=3D${PRODUCT} \
-        CROSS_COMPILE=3Darm-none-eabi- \
-        all
-}
-
-do_compile[cleandirs] =3D "${B}"
-
-do_install() {
-    install -D -p -m 0644 ${B}/product/${PRODUCT}/firmware/release/bin/f=
irmware.bin ${D}/firmware/es_flashfw.bin
-}
-
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-
-inherit deploy
-
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone700.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a-corstone700.inc
deleted file mode 100644
index d600de99..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone700.inc
+++ /dev/null
@@ -1,18 +0,0 @@
-# Corstone700 machines specific TFA support
-
-COMPATIBLE_MACHINE =3D "(corstone700-*)"
-
-TFA_DEBUG =3D "1"
-TFA_UBOOT =3D "1"
-TFA_BUILD_TARGET =3D "all fip"
-TFA_INSTALL_TARGET =3D "fip.bin"
-
-EXTRA_OEMAKE:append =3D " \
-                        ARCH=3Daarch32 \
-                        TARGET_PLATFORM=3D${TFA_TARGET_PLATFORM} \
-                        AARCH32_SP=3Dsp_min \
-                        ARM_LINUX_KERNEL_AS_BL33=3D0 \
-                        RESET_TO_SP_MIN=3D1 \
-                        ENABLE_PIE=3D1 \
-                        ARM_PRELOADED_DTB_BASE=3D0x80400000 \
-                        "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.6.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.6.bbappend
index 659ba352..f8b2ac1b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.6.=
bbappend
@@ -2,7 +2,6 @@
=20
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE:corstone500 =3D "trusted-firmware-a-corstone500.inc"
-MACHINE_TFA_REQUIRE:corstone700 =3D "trusted-firmware-a-corstone700.inc"
 MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE:fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0=
001-arm-Add-corstone700-platform.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot-2020.04/corstone700/0001-arm-Add-corstone700-platform.patch
deleted file mode 100644
index cdad7a60..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0001-arm=
-Add-corstone700-platform.patch
+++ /dev/null
@@ -1,268 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 4b33e25ebb708faa987c903c1bbc70f6752ad543 Mon Sep 17 00:00:00 2001
-From: Rui Silva <rui.silva@linaro.org>
-Date: Thu, 13 Aug 2020 12:23:47 +0100
-Subject: [PATCH] arm: Add corstone700 platform
-
-Add support to the new Arm corstone700 platform family.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- arch/arm/Kconfig                       |  7 +++
- board/armltd/corstone700/Kconfig       | 12 ++++
- board/armltd/corstone700/Makefile      |  8 +++
- board/armltd/corstone700/corstone700.c | 49 ++++++++++++++++
- configs/corstone700_defconfig          | 37 ++++++++++++
- include/configs/corstone700.h          | 78 ++++++++++++++++++++++++++
- 6 files changed, 191 insertions(+)
- create mode 100644 board/armltd/corstone700/Kconfig
- create mode 100644 board/armltd/corstone700/Makefile
- create mode 100644 board/armltd/corstone700/corstone700.c
- create mode 100644 configs/corstone700_defconfig
- create mode 100644 include/configs/corstone700.h
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index bbb1e2738b..ab2d246e29 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -636,6 +636,12 @@ config ARCH_BCM6858
- 	select OF_CONTROL
- 	imply CMD_DM
-=20
-+config TARGET_CORSTONE700
-+	bool "Support Corstone700"
-+	select CPU_V7A
-+	select SEMIHOSTING
-+	select PL01X_SERIAL
-+
- config TARGET_VEXPRESS_CA15_TC2
- 	bool "Support vexpress_ca15_tc2"
- 	select CPU_V7A
-@@ -1820,6 +1826,7 @@ source "board/Marvell/gplugd/Kconfig"
- source "board/armadeus/apf27/Kconfig"
- source "board/armltd/vexpress/Kconfig"
- source "board/armltd/vexpress64/Kconfig"
-+source "board/armltd/corstone700/Kconfig"
- source "board/cortina/presidio-asic/Kconfig"
- source "board/broadcom/bcm23550_w1d/Kconfig"
- source "board/broadcom/bcm28155_ap/Kconfig"
-diff --git a/board/armltd/corstone700/Kconfig b/board/armltd/corstone700=
/Kconfig
-new file mode 100644
-index 0000000000..ae625d96ad
---- /dev/null
-+++ b/board/armltd/corstone700/Kconfig
-@@ -0,0 +1,12 @@
-+if TARGET_CORSTONE700
-+
-+config SYS_BOARD
-+	default "corstone700"
-+
-+config SYS_VENDOR
-+	default "armltd"
-+
-+config SYS_CONFIG_NAME
-+	default "corstone700"
-+
-+endif
-diff --git a/board/armltd/corstone700/Makefile b/board/armltd/corstone70=
0/Makefile
-new file mode 100644
-index 0000000000..4f38135612
---- /dev/null
-+++ b/board/armltd/corstone700/Makefile
-@@ -0,0 +1,8 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2020 ARM Limited
-+# (C) Copyright 2020 Linaro
-+# Rui Miguel Silva <rui.silva@linaro.org>
-+#
-+
-+obj-y	:=3D corstone700.o
-diff --git a/board/armltd/corstone700/corstone700.c b/board/armltd/corst=
one700/corstone700.c
-new file mode 100644
-index 0000000000..b6f3e660a8
---- /dev/null
-+++ b/board/armltd/corstone700/corstone700.c
-@@ -0,0 +1,49 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2020 ARM Limited
-+ * (C) Copyright 2020 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/platform_data/serial_pl01x.h>
-+#include <malloc.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+static const struct pl01x_serial_platdata serial_platdata =3D {
-+	.base =3D V2M_UART0,
-+	.type =3D TYPE_PL011,
-+	.clock =3D CONFIG_PL011_CLOCK,
-+};
-+
-+U_BOOT_DEVICE(corstone700_serials) =3D {
-+	.name =3D "serial_pl01x",
-+	.platdata =3D &serial_platdata,
-+};
-+
-+int board_init(void)
-+{
-+	return 0;
-+}
-+
-+int dram_init(void)
-+{
-+	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
-+
-+	return 0;
-+}
-+
-+int dram_init_banksize(void)
-+{
-+	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
-+	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
-+
-+	return 0;
-+}
-+
-+void reset_cpu(ulong addr)
-+{
-+}
-+
-diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconf=
ig
-new file mode 100644
-index 0000000000..ee29a1eabf
---- /dev/null
-+++ b/configs/corstone700_defconfig
-@@ -0,0 +1,37 @@
-+CONFIG_ARM=3Dy
-+CONFIG_ARM64_SUPPORT_AARCH32=3Dy
-+CONFIG_TARGET_CORSTONE700=3Dy
-+CONFIG_SYS_TEXT_BASE=3D0x02100000
-+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
-+CONFIG_NR_DRAM_BANKS=3D1
-+CONFIG_IDENT_STRING=3D" corstone700 aarch32"
-+CONFIG_BOOTDELAY=3D3
-+CONFIG_USE_BOOTARGS=3Dy
-+CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9"
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_HUSH_PARSER=3Dy
-+CONFIG_SYS_PROMPT=3D"corstone700# "
-+# CONFIG_CMD_CONSOLE is not set
-+CONFIG_CMD_BOOTZ=3Dy
-+CONFIG_CMD_BOOTM=3Dy
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_EDITENV is not set
-+# CONFIG_CMD_ENV_EXISTS is not set
-+# CONFIG_CMD_ARMFLASH=3Dy
-+# CONFIG_CMD_LOADS is not set
-+# CONFIG_CMD_ITEST is not set
-+# CONFIG_CMD_SETEXPR is not set
-+CONFIG_CMD_DHCP=3Dy
-+# CONFIG_CMD_NFS is not set
-+CONFIG_CMD_MII=3Dy
-+CONFIG_CMD_PING=3Dy
-+CONFIG_CMD_CACHE=3Dy
-+# CONFIG_CMD_MISC is not set
-+CONFIG_CMD_FAT=3Dy
-+CONFIG_DM=3Dy
-+# CONFIG_MMC is not set
-+# CONFIG_MTD_NOR_FLASH=3Dy
-+CONFIG_DM_ETH=3Dy
-+CONFIG_DM_SERIAL=3Dy
-+CONFIG_OF_LIBFDT=3Dy
-diff --git a/include/configs/corstone700.h b/include/configs/corstone700=
.h
-new file mode 100644
-index 0000000000..32238e4057
---- /dev/null
-+++ b/include/configs/corstone700.h
-@@ -0,0 +1,78 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2020 ARM Limited
-+ * (C) Copyright 2020 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ * Configuration for Corstone700. Parts were derived from other ARM
-+ * configurations.
-+ */
-+
-+#ifndef __CORSTONE700_H
-+#define __CORSTONE700_H
-+
-+#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
-+#define CONFIG_SKIP_LOWLEVEL_INIT
-+
-+#define CONFIG_SYS_HZ_CLOCK	320000000
-+#define CONFIG_SYS_HZ		1000
-+
-+#define V2M_SRAM0		0x02000000
-+#define V2M_QSPI		0x08000000
-+
-+#define V2M_DEBUG		0x10000000
-+#define V2M_BASE_PERIPH		0x1A000000
-+
-+#define V2M_BASE		0x80000000
-+
-+#define V2M_PERIPH_OFFSET(x)	(x << 16)
-+
-+#define V2M_SYSID		(V2M_BASE_PERIPH)
-+#define V2M_SYSCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
-+
-+#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
-+#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
-+
-+#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
-+#define V2M_TIMER_BASE0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
-+
-+#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
-+#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
-+
-+#define CONFIG_SYS_MMIO_TIMER
-+
-+#define CONFIG_PL011_CLOCK	32000000
-+
-+/* Physical Memory Map */
-+#define PHYS_SDRAM_1		(V2M_BASE)
-+#define PHYS_SDRAM_2		(V2M_QSPI)
-+
-+/* Top 16MB reserved for secure world use (maybe not needed) */
-+#define DRAM_SEC_SIZE		0x01000000
-+#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
-+
-+#define PHYS_SDRAM_2_SIZE	0x02000000
-+
-+/* Size of malloc() pool */
-+#define CONFIG_SYS_MALLOC_LEN	(CONFIG_ENV_SIZE + (8 << 20))
-+
-+/* Miscellaneous configurable options */
-+#define CONFIG_SYS_LOAD_ADDR	(V2M_BASE + 0x10000000)
-+
-+#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
-+
-+/* Monitor Command Prompt */
-+#define CONFIG_SYS_CBSIZE		512	/* Console I/O Buffer Size */
-+#define CONFIG_SYS_MAXARGS		64	/* max command args */
-+
-+#define CONFIG_EXTRA_ENV_SETTINGS	\
-+				"kernel_name=3DzImage\0"		\
-+				"kernel_addr_r=3D0x80000000\0"	\
-+				"fdt_name=3Ddevtree.dtb\0"	\
-+				"fdt_addr_r=3D0x82000000\0"		\
-+				"fdt_high=3D0xffffffff\0"
-+
-+#define CONFIG_BOOTCOMMAND	"echo Booting Kernel...;" \
-+				"bootz $kernel_addr_r - $fdt_addr_r"
-+
-+#endif
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0=
002-boot-add-bootx-command-to-start-XiP-images.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot-2020.04/corstone700/0002-boot-add-bootx-command-to-s=
tart-XiP-images.patch
deleted file mode 100644
index bc27f66b..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0002-boo=
t-add-bootx-command-to-start-XiP-images.patch
+++ /dev/null
@@ -1,136 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 42d975e5be4435799fb2cf2af48b4dd90aa637f0 Mon Sep 17 00:00:00 2001
-From: Rui Silva <rui.silva@linaro.org>
-Date: Wed, 5 Aug 2020 19:03:30 +0100
-Subject: [PATCH 4/6] boot: add bootx command to start XiP images
-
-Add boot command that will jump to xip kernel entries.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- cmd/Kconfig                   |  8 ++++-
- cmd/Makefile                  |  1 +
- cmd/bootx.c                   | 58 +++++++++++++++++++++++++++++++++++
- configs/corstone700_defconfig |  1 +
- 4 files changed, 67 insertions(+), 1 deletion(-)
- create mode 100644 cmd/bootx.c
-
-diff --git a/cmd/Kconfig b/cmd/Kconfig
-index 6403bc45a5..c974f6b33d 100644
---- a/cmd/Kconfig
-+++ b/cmd/Kconfig
-@@ -285,6 +285,12 @@ config CMD_BOOTZ
- 	help
- 	  Boot the Linux zImage
-=20
-+config CMD_BOOTX
-+	bool "Support booting XiP Kernel Image"
-+	default y
-+	help
-+	  The bootx command is used to boot an XIP kernel.
-+
- config CMD_BOOTI
- 	bool "booti"
- 	depends on ARM64 || RISCV
-@@ -294,7 +300,7 @@ config CMD_BOOTI
-=20
- config BOOTM_LINUX
- 	bool "Support booting Linux OS images"
--	depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI
-+	depends on CMD_BOOTM || CMD_BOOTZ || CMD_BOOTI || CMD_BOOTX
- 	default y
- 	help
- 	  Support booting the Linux kernel directly via a command such as boot=
m
-diff --git a/cmd/Makefile b/cmd/Makefile
-index f1dd513a4b..ce75b6112c 100644
---- a/cmd/Makefile
-+++ b/cmd/Makefile
-@@ -28,6 +28,7 @@ obj-$(CONFIG_CMD_BOOTCOUNT) +=3D bootcount.o
- obj-$(CONFIG_CMD_BOOTEFI) +=3D bootefi.o
- obj-$(CONFIG_CMD_BOOTMENU) +=3D bootmenu.o
- obj-$(CONFIG_CMD_BOOTSTAGE) +=3D bootstage.o
-+obj-$(CONFIG_CMD_BOOTX) +=3D bootx.o
- obj-$(CONFIG_CMD_BOOTZ) +=3D bootz.o
- obj-$(CONFIG_CMD_BOOTI) +=3D booti.o
- obj-$(CONFIG_CMD_BTRFS) +=3D btrfs.o
-diff --git a/cmd/bootx.c b/cmd/bootx.c
-new file mode 100644
-index 0000000000..b6e06eab3f
---- /dev/null
-+++ b/cmd/bootx.c
-@@ -0,0 +1,58 @@
-+/*
-+ * Copyright (C) 2017 Renesas Electronics
-+ * Copyright (C) 2017 Chris Brandt
-+ *
-+ * SPDX-License-Identifier:	GPL-2.0+
-+ */
-+
-+ #include <common.h>
-+
-+/* XIP Kernel boot */
-+int do_bootx(cmd_tbl_t *cmdtp, int flag, int argc, char * const argv[])
-+{
-+	ulong machid =3D 0xFFFFFFFF;	/* Device Tree Boot */
-+	void (*kernel_entry)(int zero, int arch, uint params);
-+	ulong r2;
-+	ulong img_addr;
-+	char *endp;
-+
-+	/* need at least two arguments */
-+	if (argc < 2)
-+		goto usage;
-+
-+	img_addr =3D simple_strtoul(argv[1], &endp, 16);
-+	kernel_entry =3D (void (*)(int, int, uint))img_addr;
-+
-+#ifdef CONFIG_USB_DEVICE
-+	udc_disconnect();
-+#endif
-+	cleanup_before_linux();
-+
-+	r2 =3D simple_strtoul(argv[2], NULL, 16);
-+
-+	/* The kernel expects the following when booting:
-+	 *  r0 - 0
-+	 *  r1 - machine type
-+	 *  r2 - boot data (atags/dt) pointer
-+	 *
-+	 * For more info, refer to:
-+	 *  https://www.kernel.org/doc/Documentation/arm/Booting
-+	 */
-+
-+	printf("Booting Linux...\n");
-+
-+	kernel_entry(0, machid, r2);
-+
-+	return 0;
-+
-+usage:
-+	return CMD_RET_USAGE;
-+}
-+static char bootx_help_text[] =3D
-+	"x_addr dt_addr\n    - boot XIP kernel in Flash\n"
-+	"\t x_addr: Address of XIP kernel in Flash\n"
-+	"\tdt_addr: Address of Device Tree blob image";
-+U_BOOT_CMD(
-+	bootx,	CONFIG_SYS_MAXARGS,	1,	do_bootx,
-+	"boot XIP kernel in Flash", bootx_help_text
-+)
-diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconf=
ig
-index ee29a1eabf..655af3f058 100644
---- a/configs/corstone700_defconfig
-+++ b/configs/corstone700_defconfig
-@@ -14,6 +14,7 @@ CONFIG_HUSH_PARSER=3Dy
- CONFIG_SYS_PROMPT=3D"corstone700# "
- # CONFIG_CMD_CONSOLE is not set
- CONFIG_CMD_BOOTZ=3Dy
-+CONFIG_CMD_BOOTX=3Dy
- CONFIG_CMD_BOOTM=3Dy
- # CONFIG_CMD_XIMG is not set
- # CONFIG_CMD_EDITENV is not set
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0=
003-boot-starting-the-XIP-kernel-using-bootx-command.patch b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0003-boot-starting-the-XIP=
-kernel-using-bootx-command.patch
deleted file mode 100644
index 6b735ae6..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0003-boo=
t-starting-the-XIP-kernel-using-bootx-command.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 9f4e54e2bc619124602584e0ec8e268ac6f6221e Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 5 Aug 2020 19:05:08 +0100
-Subject: [PATCH 5/6] boot: starting the XIP kernel using bootx command
-
-bootx command is used as the default command to
-start the XIP kernel
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- include/configs/corstone700.h | 7 +++----
- 1 file changed, 3 insertions(+), 4 deletions(-)
-
-diff --git a/include/configs/corstone700.h b/include/configs/corstone700=
.h
-index 32238e4057..cb9ca8af8e 100644
---- a/include/configs/corstone700.h
-+++ b/include/configs/corstone700.h
-@@ -67,12 +67,11 @@
-=20
- #define CONFIG_EXTRA_ENV_SETTINGS	\
- 				"kernel_name=3DzImage\0"		\
--				"kernel_addr_r=3D0x80000000\0"	\
-+				"kernel_addr_r=3D0x08300000\0"	\
- 				"fdt_name=3Ddevtree.dtb\0"	\
--				"fdt_addr_r=3D0x82000000\0"		\
-+				"fdt_addr_r=3D0x80400000\0"	\
- 				"fdt_high=3D0xffffffff\0"
-=20
--#define CONFIG_BOOTCOMMAND	"echo Booting Kernel...;" \
--				"bootz $kernel_addr_r - $fdt_addr_r"
-+#define CONFIG_BOOTCOMMAND	"bootx $kernel_addr_r $fdt_addr_r"
-=20
- #endif
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0=
004-arm-enabling-the-arch_timer-driver.patch b/meta-arm-bsp/recipes-bsp/u=
-boot/u-boot-2020.04/corstone700/0004-arm-enabling-the-arch_timer-driver.=
patch
deleted file mode 100644
index 719fa28c..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-2020.04/corstone700/0004-arm=
-enabling-the-arch_timer-driver.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From a008f06b49a96dfd98943696ddc10134947fed91 Mon Sep 17 00:00:00 2001
-From: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Date: Wed, 5 Aug 2020 19:06:16 +0100
-Subject: [PATCH 6/6] arm: enabling the arch_timer driver
-
-This patch disables the use of the mmio_timer driver
-and enables the arch_timer driver.
-
-The mmio_timer tries a direct access to the Armv8-A CNTFRQ generic timer
-frequency register through memory mapping. This can not be done because
-this register is only accessible through memory mapping under a secure
-mode only. u-boot runs in non secure Hypervisor mode. To read the counte=
r
-frequency u-boot should use the mrc instruction to read the CNTFRQ syste=
m
-register.
-
-The arch_timer driver reads the CNTFRQ register using the mrc instructio=
n.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- configs/corstone700_defconfig | 3 +++
- include/configs/corstone700.h | 3 ---
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/configs/corstone700_defconfig b/configs/corstone700_defconf=
ig
-index 655af3f058..58e03db044 100644
---- a/configs/corstone700_defconfig
-+++ b/configs/corstone700_defconfig
-@@ -36,3 +36,6 @@ CONFIG_DM=3Dy
- CONFIG_DM_ETH=3Dy
- CONFIG_DM_SERIAL=3Dy
- CONFIG_OF_LIBFDT=3Dy
-+# CONFIG_SYS_HZ_CLOCK is not set
-+# CONFIG_SYS_MMIO_TIMER is not set
-+CONFIG_SYS_ARCH_TIMER=3Dy
-diff --git a/include/configs/corstone700.h b/include/configs/corstone700=
.h
-index cb9ca8af8e..0fb606f1ed 100644
---- a/include/configs/corstone700.h
-+++ b/include/configs/corstone700.h
-@@ -14,7 +14,6 @@
- #define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
- #define CONFIG_SKIP_LOWLEVEL_INIT
-=20
--#define CONFIG_SYS_HZ_CLOCK	320000000
- #define CONFIG_SYS_HZ		1000
-=20
- #define V2M_SRAM0		0x02000000
-@@ -39,8 +38,6 @@
- #define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(81))
- #define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(82))
-=20
--#define CONFIG_SYS_MMIO_TIMER
--
- #define CONFIG_PL011_CLOCK	32000000
-=20
- /* Physical Memory Map */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
deleted file mode 100644
index 113cde52..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.04.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-#
-# Corstone700 KMACHINE
-#
-FILESEXTRAPATHS:prepend:corstone700 :=3D "${THISDIR}/${BP}/corstone700:"
-SRC_URI:append:corstone700 =3D " file://0001-arm-Add-corstone700-platfor=
m.patch \
-                               file://0002-boot-add-bootx-command-to-sta=
rt-XiP-images.patch \
-                               file://0003-boot-starting-the-XIP-kernel-=
using-bootx-command.patch \
-                               file://0004-arm-enabling-the-arch_timer-d=
river.patch"
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700-bsp.scc b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700-bsp.scc
deleted file mode 100644
index 75460aa2..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700-bsp.scc
+++ /dev/null
@@ -1,6 +0,0 @@
-define KMACHINE corstone700
-define KTYPE standard
-define KARCH arm
-
-kconf hardware corstone700/base.cfg
-kconf hardware corstone700/xip.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/base.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-=
platforms-kmeta/bsp/arm-platforms/corstone700/base.cfg
deleted file mode 100644
index 2164758d..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/base.cfg
+++ /dev/null
@@ -1,35 +0,0 @@
-CONFIG_LOCALVERSION=3D"-yocto-standard"
-# CONFIG_LOCALVERSION_AUTO is not set
-CONFIG_LOG_BUF_SHIFT=3D12
-# CONFIG_UTS_NS is not set
-# CONFIG_PID_NS is not set
-# CONFIG_NET_NS is not set
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_ARM_SINGLE_ARMV7A=3Dy
-CONFIG_ARCH_TINY_VEXPRESS=3Dy
-CONFIG_HAVE_ARM_ARCH_TIMER=3Dy
-CONFIG_THUMB2_KERNEL=3Dy
-CONFIG_ZBOOT_ROM_TEXT=3D0x0
-CONFIG_ZBOOT_ROM_BSS=3D0x0
-CONFIG_VFP=3Dy
-# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-CONFIG_NET=3Dy
-CONFIG_PACKET=3Dy
-CONFIG_UNIX=3Dy
-CONFIG_INET=3Dy
-# CONFIG_IPV6 is not set
-# CONFIG_WIRELESS is not set
-CONFIG_DEVTMPFS=3Dy
-CONFIG_TMPFS=3Dy
-CONFIG_EXTSYS_CTRL=3Dy
-# CONFIG_WLAN is not set
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIAL_AMBA_PL011=3Dy
-CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
-CONFIG_RTC_CLASS=3Dy
-CONFIG_RTC_DRV_PL031=3Dy
-CONFIG_MAILBOX=3Dy
-CONFIG_ARM_MHUv2=3Dy
-CONFIG_RPMSG_CHAR=3Dy
-CONFIG_RPMSG_ARM=3Dy
-# CONFIG_CRYPTO_HW is not set
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/eth_lan9115.scc b/meta-arm-bsp/recipes-kernel/lin=
ux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan9115.scc
deleted file mode 100644
index 94cb13e9..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/eth_lan9115.scc
+++ /dev/null
@@ -1,4 +0,0 @@
-define KFEATURE_DESCRIPTION "Ethernet feature using lan9115"
-
-kconf hardware pnp.cfg
-kconf hardware lan9115.cfg
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/eth_lan91c111.scc b/meta-arm-bsp/recipes-kernel/l=
inux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/eth_lan91c111.scc
deleted file mode 100644
index d77af09a..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/eth_lan91c111.scc
+++ /dev/null
@@ -1,4 +0,0 @@
-define KFEATURE_DESCRIPTION "Ethernet feature using lan91c111"
-
-kconf hardware pnp.cfg
-kconf hardware lan91c111.cfg
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/lan9115.cfg b/meta-arm-bsp/recipes-kernel/linux/a=
rm-platforms-kmeta/bsp/arm-platforms/corstone700/lan9115.cfg
deleted file mode 100644
index cd77ec35..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/lan9115.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_SMSC911X=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/lan91c111.cfg b/meta-arm-bsp/recipes-kernel/linux=
/arm-platforms-kmeta/bsp/arm-platforms/corstone700/lan91c111.cfg
deleted file mode 100644
index c998770e..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/lan91c111.cfg
+++ /dev/null
@@ -1 +0,0 @@
-CONFIG_SMC91X=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/pnp.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/pnp.cfg
deleted file mode 100644
index b9ecd85c..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/pnp.cfg
+++ /dev/null
@@ -1,4 +0,0 @@
-CONFIG_IP_PNP=3Dy
-CONFIG_IP_PNP_DHCP=3Dy
-CONFIG_IP_PNP_BOOTP=3Dy
-CONFIG_NETDEVICES=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/usb_host.cfg b/meta-arm-bsp/recipes-kernel/linux/=
arm-platforms-kmeta/bsp/arm-platforms/corstone700/usb_host.cfg
deleted file mode 100644
index de4752e3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/usb_host.cfg
+++ /dev/null
@@ -1,8 +0,0 @@
-CONFIG_SCSI=3Dy
-CONFIG_BLK_DEV_SD=3Dy
-CONFIG_USB=3Dy
-CONFIG_USB_STORAGE=3Dy
-CONFIG_USB_ISP1760=3Dy
-CONFIG_USB_ISP1760_HOST_ROLE=3Dy
-CONFIG_USB_GADGET=3Dy
-CONFIG_USB_MASS_STORAGE=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/xip.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-p=
latforms-kmeta/bsp/arm-platforms/corstone700/xip.cfg
deleted file mode 100644
index dd367849..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/xip.cfg
+++ /dev/null
@@ -1,12 +0,0 @@
-CONFIG_PHYS_OFFSET=3D0x80000000
-CONFIG_XIP_KERNEL=3Dy
-CONFIG_XIP_PHYS_ADDR=3D0x08300000
-CONFIG_MTD=3Dy
-CONFIG_MTD_RAM=3Dy
-CONFIG_MTD_ROM=3Dy
-CONFIG_MTD_PHYSMAP=3Dy
-CONFIG_MTD_PHYSMAP_COMPAT=3Dy
-CONFIG_MTD_PHYSMAP_START=3D0x08100000
-CONFIG_MTD_PHYSMAP_LEN=3D0x200000
-CONFIG_CRAMFS=3Dy
-CONFIG_CRAMFS_MTD=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/xip_cmdline.cfg b/meta-arm-bsp/recipes-kernel/lin=
ux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip_cmdline.cfg
deleted file mode 100644
index 8280e6e5..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/xip_cmdline.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_CMDLINE=3D"console=3DttyAMA0 root=3Dmtd:physmap-flash.0 ro loglev=
el=3D9"
-# CONFIG_CMDLINE_FROM_BOOTLOADER is not set
-CONFIG_CMDLINE_EXTEND=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/corstone700/xip_dhcp_cmdline.cfg b/meta-arm-bsp/recipes-kerne=
l/linux/arm-platforms-kmeta/bsp/arm-platforms/corstone700/xip_dhcp_cmdlin=
e.cfg
deleted file mode 100644
index 19826628..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/corstone700/xip_dhcp_cmdline.cfg
+++ /dev/null
@@ -1,3 +0,0 @@
-CONFIG_CMDLINE=3D"console=3DttyAMA0 root=3Dmtd:physmap-flash.0 ro ip=3Dd=
hcp loglevel=3D9"
-# CONFIG_CMDLINE_FROM_BOOTLOADER is not set
-CONFIG_CMDLINE_EXTEND=3Dy
\ No newline at end of file
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0001-arm=
-support-for-a-single-ARMv7-A-based-platform.patch b/meta-arm-bsp/recipes=
-kernel/linux/files/corstone700/0001-arm-support-for-a-single-ARMv7-A-bas=
ed-platform.patch
deleted file mode 100644
index f934efc4..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0001-arm-suppor=
t-for-a-single-ARMv7-A-based-platform.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From faac2fbc88b932b79b33b7299116d269d1167a18 Mon Sep 17 00:00:00 2001
-From: Manish Pandey <manish.pandey2@arm.com>
-Date: Mon, 18 Jun 2018 13:00:31 +0100
-Subject: [PATCH 01/20] arm: support for a single ARMv7-A based platform.
-
-The reason for having a single ARMv7A based platform is to bypass
-collection of configs provided/concealed by ARCH_MULTIPLATFORM, for
-example XIP_KERNEL cannot be enabled with ARCH_MULTIPLATFORM.
-
-Having a separate config for single ARMv7-A platform will give the
-freedom to choose only those configs which are required for a given
-ARMv7-A based platform.
-
-Signed-off-by: Manish Pandey <manish.pandey2@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/Kconfig          | 14 ++++++++++++++
- arch/arm/Kconfig.debug    |  3 ++-
- arch/arm/Makefile         |  2 ++
- arch/arm/kernel/devtree.c |  3 ++-
- 4 files changed, 20 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 97864aabc2a6..04db53ed23fc 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -338,6 +338,20 @@ config ARM_SINGLE_ARMV7M
- 	select SPARSE_IRQ
- 	select USE_OF
-=20
-+config ARM_SINGLE_ARMV7A
-+	bool "ARMv7-A single platform"
-+	select ARM_HAS_SG_CHAIN
-+	select AUTO_ZRELADDR
-+	select TIMER_OF
-+	select COMMON_CLK
-+	select CPU_V7
-+	select GENERIC_CLOCKEVENTS
-+	select MIGHT_HAVE_PCI
-+	select MULTI_IRQ_HANDLER
-+	select PCI_DOMAINS if PCI
-+	select SPARSE_IRQ
-+	select USE_OF
-+
- config ARCH_EBSA110
- 	bool "EBSA-110"
- 	select ARCH_USES_GETTIMEOFFSET
-diff --git a/arch/arm/Kconfig.debug b/arch/arm/Kconfig.debug
-index b70d7debf5ca..592f5d7aa412 100644
---- a/arch/arm/Kconfig.debug
-+++ b/arch/arm/Kconfig.debug
-@@ -1878,7 +1878,8 @@ config DEBUG_UNCOMPRESS
- config UNCOMPRESS_INCLUDE
- 	string
- 	default "debug/uncompress.h" if ARCH_MULTIPLATFORM || ARCH_MSM || \
--					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M
-+					PLAT_SAMSUNG || ARM_SINGLE_ARMV7M || \
-+					ARM_SINGLE_ARMV7A
- 	default "mach/uncompress.h"
-=20
- config EARLY_PRINTK
-diff --git a/arch/arm/Makefile b/arch/arm/Makefile
-index 1fc32b611f8a..fa1519959f6a 100644
---- a/arch/arm/Makefile
-+++ b/arch/arm/Makefile
-@@ -267,9 +267,11 @@ platdirs :=3D $(patsubst %,arch/arm/plat-%/,$(sort =
$(plat-y)))
-=20
- ifneq ($(CONFIG_ARCH_MULTIPLATFORM),y)
- ifneq ($(CONFIG_ARM_SINGLE_ARMV7M),y)
-+ifneq ($(CONFIG_ARM_SINGLE_ARMV7A),y)
- KBUILD_CPPFLAGS +=3D $(patsubst %,-I$(srctree)/%include,$(machdirs) $(p=
latdirs))
- endif
- endif
-+endif
-=20
- export	TEXT_OFFSET GZFLAGS MMUEXT
-=20
-diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
-index 39c978698406..88e9f22a6778 100644
---- a/arch/arm/kernel/devtree.c
-+++ b/arch/arm/kernel/devtree.c
-@@ -212,7 +212,8 @@ const struct machine_desc * __init setup_machine_fdt=
(unsigned int dt_phys)
- {
- 	const struct machine_desc *mdesc, *mdesc_best =3D NULL;
-=20
--#if defined(CONFIG_ARCH_MULTIPLATFORM) || defined(CONFIG_ARM_SINGLE_ARM=
V7M)
-+#if defined(CONFIG_ARCH_MULTIPLATFORM) || defined(CONFIG_ARM_SINGLE_ARM=
V7M)\
-+				|| defined(CONFIG_ARM_SINGLE_ARMV7A)
- 	DT_MACHINE_START(GENERIC_DT, "Generic DT based system")
- 		.l2c_aux_val =3D 0x0,
- 		.l2c_aux_mask =3D ~0x0,
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0002-arm=
-Add-tiny-vexpress-machine.patch b/meta-arm-bsp/recipes-kernel/linux/file=
s/corstone700/0002-arm-Add-tiny-vexpress-machine.patch
deleted file mode 100644
index 0da50ad3..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0002-arm-Add-ti=
ny-vexpress-machine.patch
+++ /dev/null
@@ -1,101 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From f984be4e9b113b0c92ae2b618381f0499bf41865 Mon Sep 17 00:00:00 2001
-From: Manish Pandey <manish.pandey2@arm.com>
-Date: Mon, 18 Jun 2018 13:04:31 +0100
-Subject: [PATCH 02/20] arm: Add tiny vexpress machine.
-
-added tiny vexpress machine which is cut down version of
-vexpress machine and intended to be used for IOT devices.
-
-Signed-off-by: Manish Pandey <manish.pandey2@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/Kconfig                  |  2 ++
- arch/arm/mach-tinyexpress/Kconfig | 28 ++++++++++++++++++++++++++++
- drivers/clk/versatile/Kconfig     |  6 +++---
- 3 files changed, 33 insertions(+), 3 deletions(-)
- create mode 100644 arch/arm/mach-tinyexpress/Kconfig
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 04db53ed23fc..ef49bbc9d5e2 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -752,6 +752,8 @@ source "arch/arm/mach-versatile/Kconfig"
- source "arch/arm/mach-vexpress/Kconfig"
- source "arch/arm/plat-versatile/Kconfig"
-=20
-+source "arch/arm/mach-tinyexpress/Kconfig"
-+
- source "arch/arm/mach-vt8500/Kconfig"
-=20
- source "arch/arm/mach-zx/Kconfig"
-diff --git a/arch/arm/mach-tinyexpress/Kconfig b/arch/arm/mach-tinyexpre=
ss/Kconfig
-new file mode 100644
-index 000000000000..f9946bad1170
---- /dev/null
-+++ b/arch/arm/mach-tinyexpress/Kconfig
-@@ -0,0 +1,28 @@
-+config ARCH_TINY_VEXPRESS
-+	bool "ARM Ltd. Tiny Versatile Express family"
-+	depends on ARM_SINGLE_ARMV7A
-+	select ARCH_SUPPORTS_BIG_ENDIAN
-+	select ARM_AMBA
-+	select ARM_GIC
-+	select ARM_GLOBAL_TIMER
-+	select ARM_TIMER_SP804
-+	select COMMON_CLK_VERSATILE
-+	select GPIOLIB
-+	select HAVE_ARM_SCU if SMP
-+	select HAVE_ARM_TWD if SMP
-+	select HAVE_PATA_PLATFORM
-+	select ICST
-+	select NO_IOPORT_MAP
-+	select PLAT_VERSATILE
-+	select POWER_RESET
-+	select POWER_RESET_VEXPRESS
-+	select POWER_SUPPLY
-+	select REGULATOR if MMC_ARMMMCI
-+	select REGULATOR_FIXED_VOLTAGE if REGULATOR
-+	select VEXPRESS_CONFIG
-+	select VEXPRESS_SYSCFG
-+	select MFD_VEXPRESS_SYSREG
-+	help
-+	  This option enables support for tiny linux based systems using Corte=
x
-+	  processor based ARM core and logic (FPGA) tiles on the Versatile
-+	  Express motherboard.
-diff --git a/drivers/clk/versatile/Kconfig b/drivers/clk/versatile/Kconf=
ig
-index c2618f1477a2..f245f520df0c 100644
---- a/drivers/clk/versatile/Kconfig
-+++ b/drivers/clk/versatile/Kconfig
-@@ -6,7 +6,7 @@ config COMMON_CLK_VERSATILE
- 	bool "Clock driver for ARM Reference designs"
- 	depends on ARCH_INTEGRATOR || ARCH_REALVIEW || \
- 		ARCH_VERSATILE || ARCH_VEXPRESS || ARM64 || \
--		COMPILE_TEST
-+		ARCH_TINY_VEXPRESS || COMPILE_TEST
- 	select REGMAP_MMIO
- 	---help---
- 	  Supports clocking on ARM Reference designs:
-@@ -17,7 +17,7 @@ config COMMON_CLK_VERSATILE
- config CLK_SP810
- 	bool "Clock driver for ARM SP810 System Controller"
- 	depends on COMMON_CLK_VERSATILE
--	default y if ARCH_VEXPRESS
-+	default y if ARCH_VEXPRESS || ARCH_TINY_VEXPRESS
- 	---help---
- 	  Supports clock muxing (REFCLK/TIMCLK to TIMERCLKEN0-3) capabilities
- 	  of the ARM SP810 System Controller cell.
-@@ -26,7 +26,7 @@ config CLK_VEXPRESS_OSC
- 	bool "Clock driver for Versatile Express OSC clock generators"
- 	depends on COMMON_CLK_VERSATILE
- 	depends on VEXPRESS_CONFIG
--	default y if ARCH_VEXPRESS
-+	default y if ARCH_VEXPRESS || ARCH_TINY_VEXPRESS
- 	---help---
- 	  Simple regmap-based driver driving clock generators on Versatile
- 	  Express platforms hidden behind its configuration infrastructure,
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0003-arm=
-introduce-corstone700_defconfig.patch b/meta-arm-bsp/recipes-kernel/linu=
x/files/corstone700/0003-arm-introduce-corstone700_defconfig.patch
deleted file mode 100644
index d97abdaf..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0003-arm-introd=
uce-corstone700_defconfig.patch
+++ /dev/null
@@ -1,197 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From f237b4ab421bae452a8613d6343d7e35d1295003 Mon Sep 17 00:00:00 2001
-From: Manish Pandey <manish.pandey2@arm.com>
-Date: Tue, 15 Jan 2019 16:21:20 +0000
-Subject: [PATCH 03/20] arm: introduce corstone700_defconfig
-
-corstone700_defconfig is derived from tiny vexpress machine
-having XIP kernel and MMU enabled together.
-
-Signed-off-by: Manish Pandey <manish.pandey2@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/configs/corstone700_defconfig | 170 +++++++++++++++++++++++++
- 1 file changed, 170 insertions(+)
- create mode 100644 arch/arm/configs/corstone700_defconfig
-
-diff --git a/arch/arm/configs/corstone700_defconfig b/arch/arm/configs/c=
orstone700_defconfig
-new file mode 100644
-index 000000000000..d6553a85db16
---- /dev/null
-+++ b/arch/arm/configs/corstone700_defconfig
-@@ -0,0 +1,170 @@
-+# CONFIG_LOCALVERSION_AUTO is not set
-+# CONFIG_SYSVIPC=3Dy
-+# CONFIG_IKCONFIG=3Dy
-+# CONFIG_IKCONFIG_PROC=3Dy
-+CONFIG_LOG_BUF_SHIFT=3D12
-+# CONFIG_CGROUPS=3Dy
-+# CONFIG_CPUSETS=3Dy
-+# CONFIG_UTS_NS is not set
-+# CONFIG_IPC_NS is not set
-+# CONFIG_PID_NS is not set
-+# CONFIG_NET_NS is not set
-+CONFIG_BLK_DEV_INITRD=3Dy
-+# CONFIG_PROFILING=3Dy
-+# CONFIG_OPROFILE=3Dy
-+# CONFIG_MODULES=3Dy
-+# CONFIG_MODULE_UNLOAD=3Dy
-+# CONFIG_LBDAF is not set
-+# CONFIG_BLK_DEV_BSG is not set
-+# CONFIG_IOSCHED_DEADLINE is not set
-+# CONFIG_IOSCHED_CFQ is not set
-+CONFIG_ARCH_TINY_VEXPRESS=3Dy
-+CONFIG_ARM_SINGLE_ARMV7A=3Dy
-+#CONFIG_DRAM_BASE=3D0x02100000
-+CONFIG_PHYS_OFFSET=3D0x02100000
-+CONFIG_FLASH_MEM_BASE=3D0x08000000
-+CONFIG_FLASH_SIZE=3D0x4000000
-+CONFIG_XIP_KERNEL=3Dy
-+CONFIG_XIP_PHYS_ADDR=3D0x08500000
-+# CONFIG_ARCH_VEXPRESS_CA9X4=3Dy
-+# CONFIG_ARCH_VEXPRESS_DCSCB=3Dy
-+# CONFIG_ARCH_VEXPRESS_TC2_PM=3Dy
-+# CONFIG_SWP_EMULATE is not set
-+# CONFIG_SMP=3Dy
-+CONFIG_HAVE_ARM_ARCH_TIMER=3Dy
-+# CONFIG_MCPM=3Dy
-+# CONFIG_VMSPLIT_2G=3Dy
-+# CONFIG_NR_CPUS=3D8
-+# CONFIG_ARM_PSCI=3Dy
-+# CONFIG_AEABI=3Dy
-+# CONFIG_CMA=3Dy
-+CONFIG_ZBOOT_ROM_TEXT=3D0x0
-+CONFIG_ZBOOT_ROM_BSS=3D0x0
-+CONFIG_CMDLINE=3D"console=3DttyAMA0"
-+# CONFIG_CPU_IDLE=3Dy
-+# CONFIG_CPU_IDLE_MULTIPLE_DRIVERS=3Dy
-+CONFIG_VFP=3Dy
-+# CONFIG_NEON=3Dy
-+# CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
-+CONFIG_NET=3Dy
-+CONFIG_PACKET=3Dy
-+CONFIG_UNIX=3Dy
-+CONFIG_INET=3Dy
-+CONFIG_IP_PNP=3Dy
-+CONFIG_IP_PNP_DHCP=3Dy
-+CONFIG_IP_PNP_BOOTP=3Dy
-+# CONFIG_INET_LRO is not set
-+# CONFIG_IPV6 is not set
-+# CONFIG_WIRELESS is not set
-+# CONFIG_NET_9P=3Dy
-+# CONFIG_NET_9P_VIRTIO=3Dy
-+# CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
-+CONFIG_DEVTMPFS=3Dy
-+# CONFIG_MTD=3Dy
-+# CONFIG_MTD_CMDLINE_PARTS=3Dy
-+# CONFIG_MTD_BLOCK=3Dy
-+# CONFIG_MTD_CFI=3Dy
-+# CONFIG_MTD_CFI_INTELEXT=3Dy
-+# CONFIG_MTD_CFI_AMDSTD=3Dy
-+# CONFIG_MTD_PHYSMAP=3Dy
-+# CONFIG_MTD_PHYSMAP_OF=3Dy
-+# CONFIG_MTD_PLATRAM=3Dy
-+# CONFIG_MTD_UBI=3Dy
-+# CONFIG_PROC_DEVICETREE=3Dy
-+# CONFIG_VIRTIO_BLK=3Dy
-+# CONFIG_SCSI_PROC_FS is not set
-+# CONFIG_BLK_DEV_SD=3Dy
-+# CONFIG_SCSI_VIRTIO=3Dy
-+# CONFIG_ATA=3Dy
-+# CONFIG_SATA_PMP is not set
-+CONFIG_NETDEVICES=3Dy
-+CONFIG_VIRTIO_NET=3Dy
-+CONFIG_SMC91X=3Dy
-+CONFIG_SMSC911X=3Dy
-+# CONFIG_WLAN is not set
-+# CONFIG_INPUT_EVDEV=3Dy
-+# CONFIG_SERIO_SERPORT is not set
-+# CONFIG_SERIO_AMBAKMI=3Dy
-+# CONFIG_LEGACY_PTY_COUNT=3D16
-+CONFIG_SERIAL_AMBA_PL011=3Dy
-+CONFIG_SERIAL_AMBA_PL011_CONSOLE=3Dy
-+# CONFIG_VIRTIO_CONSOLE=3Dy
-+# CONFIG_HW_RANDOM=3Dy
-+# CONFIG_HW_RANDOM_VIRTIO=3Dy
-+# CONFIG_I2C=3Dy
-+# CONFIG_I2C_VERSATILE=3Dy
-+# CONFIG_SENSORS_VEXPRESS=3Dy
-+# CONFIG_REGULATOR=3Dy
-+# CONFIG_REGULATOR_VEXPRESS=3Dy
-+# CONFIG_FB=3Dy
-+# CONFIG_FB_ARMCLCD=3Dy
-+# CONFIG_FRAMEBUFFER_CONSOLE=3Dy
-+# CONFIG_LOGO=3Dy
-+# CONFIG_LOGO_LINUX_MONO is not set
-+# CONFIG_LOGO_LINUX_VGA16 is not set
-+# CONFIG_SOUND=3Dy
-+# CONFIG_SND=3Dy
-+# CONFIG_SND_MIXER_OSS=3Dy
-+# CONFIG_SND_PCM_OSS=3Dy
-+# CONFIG_SND_DRIVERS is not set
-+# CONFIG_SND_ARMAACI=3Dy
-+# CONFIG_HID_DRAGONRISE=3Dy
-+# CONFIG_HID_GYRATION=3Dy
-+# CONFIG_HID_TWINHAN=3Dy
-+# CONFIG_HID_NTRIG=3Dy
-+# CONFIG_HID_PANTHERLORD=3Dy
-+# CONFIG_HID_PETALYNX=3Dy
-+# CONFIG_HID_SAMSUNG=3Dy
-+# CONFIG_HID_SONY=3Dy
-+# CONFIG_HID_SUNPLUS=3Dy
-+# CONFIG_HID_GREENASIA=3Dy
-+# CONFIG_HID_SMARTJOYPLUS=3Dy
-+# CONFIG_HID_TOPSEED=3Dy
-+# CONFIG_HID_THRUSTMASTER=3Dy
-+# CONFIG_HID_ZEROPLUS=3Dy
-+# CONFIG_USB=3Dy
-+# CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
-+# CONFIG_USB_MON=3Dy
-+# CONFIG_USB_STORAGE=3Dy
-+# CONFIG_USB_ISP1760=3Dy
-+# CONFIG_MMC=3Dy
-+# CONFIG_MMC_ARMMMCI=3Dy
-+# CONFIG_NEW_LEDS=3Dy
-+# CONFIG_LEDS_CLASS=3Dy
-+# CONFIG_LEDS_GPIO=3Dy
-+# CONFIG_LEDS_TRIGGERS=3Dy
-+# CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dy
-+# CONFIG_LEDS_TRIGGER_CPU=3Dy
-+CONFIG_RTC_CLASS=3Dy
-+CONFIG_RTC_DRV_PL031=3Dy
-+# CONFIG_VIRTIO_BALLOON=3Dy
-+# CONFIG_VIRTIO_MMIO=3Dy
-+# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=3Dy
-+# CONFIG_EXT2_FS=3Dy
-+# CONFIG_EXT3_FS=3Dy
-+# CONFIG_EXT3_DEFAULTS_TO_ORDERED is not set
-+# CONFIG_EXT3_FS_XATTR is not set
-+# CONFIG_EXT4_FS=3Dy
-+# CONFIG_VFAT_FS=3Dy
-+# CONFIG_TMPFS=3Dy
-+# CONFIG_JFFS2_FS=3Dy
-+# CONFIG_UBIFS_FS=3Dy
-+# CONFIG_CRAMFS=3Dy
-+# CONFIG_SQUASHFS=3Dy
-+# CONFIG_SQUASHFS_LZO=3Dy
-+# CONFIG_NFS_FS=3Dy
-+# CONFIG_ROOT_NFS=3Dy
-+# CONFIG_9P_FS=3Dy
-+# CONFIG_NLS_CODEPAGE_437=3Dy
-+# CONFIG_NLS_ISO8859_1=3Dy
-+# CONFIG_DEBUG_INFO=3Dy
-+# CONFIG_DEBUG_FS=3Dy
-+# CONFIG_MAGIC_SYSRQ=3Dy
-+# CONFIG_DEBUG_KERNEL=3Dy
-+# CONFIG_DETECT_HUNG_TASK=3Dy
-+# CONFIG_SCHED_DEBUG is not set
-+# CONFIG_DEBUG_USER=3Dy
-+# CONFIG_CRYPTO_ANSI_CPRNG is not set
-+# CONFIG_CRYPTO_HW is not set
-+# CONFIG_LTO_MENU=3Dy
-+CONFIG_THUMB2_KERNEL=3Dy
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0004-add=
-driver-of-mailbox-handling-unit-controller-versi.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0004-add-driver-of-mailbox-handling-=
unit-controller-versi.patch
deleted file mode 100644
index 37fbe3a5..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0004-add-driver=
-of-mailbox-handling-unit-controller-versi.patch
+++ /dev/null
@@ -1,322 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From fb380896ff4e0be235a95ef32b6b3f67a56d1e9b Mon Sep 17 00:00:00 2001
-From: Samarth Parikh <samarthp@ymail.com>
-Date: Sun, 3 Feb 2019 16:35:03 +0000
-Subject: [PATCH 04/20] add driver of mailbox handling unit controller ve=
rsion
- 2
-
-this driver design is based on MHUv1 driver.
-But there is change of logic while reading device tree
-entry because MHUv2.1 has sender and receiver channels
-separate.
-
-ARM has launched a next version of MHU i.e. MHUv2 with its latest
-subsystems. The main change is that the MHUv2 is now a distributed IP
-with different peripheral views (registers) for the sender and receiver.
-
-Another main difference is that MHUv1 duplex channels are now split into
-simplex/half duplex in MHUv2. MHUv2 has a configurable number of
-communication channels. There is a capability register (MSG_NO_CAP) to
-find out how many channels are available in a system.
-
-The register offsets have also changed for STAT, SET & CLEAR registers
-from 0x0, 0x8 & 0x10 in MHUv1 to 0x0, 0xC & 0x8 in MHUv2 respectively.
-
-0x0    0x4  0x8  0xC             0x1F
-------------------------....-----
-| STAT |    |    | SET |    |   |
-------------------------....-----
-      Transmit Channel
-
-0x0    0x4  0x8   0xC            0x1F
-------------------------....-----
-| STAT |    | CLR |    |    |   |
-------------------------....-----
-        Receive Channel
-
-The MHU controller can request the receiver to wake-up and once the
-request is removed, the receiver may go back to sleep, but the MHU
-itself does not actively puts a receiver to sleep.
-
-So, in order to wake-up the receiver when the sender wants to send data,
-the sender has to set ACCESS_REQUEST register first in order to wake-up
-receiver, state of which can be detected using ACCESS_READY register.
-ACCESS_REQUEST has an offset of 0xF88 & ACCESS_READY has an offset
-of 0xF8C and are accessible only on any sender channel.
-
-This patch adds necessary changes in a new file required to support the
-latest MHUv2 controller. This patch also need an update in DT binding fo=
r
-ARM MHUv2 as we need a second register base (tx base) which would be use=
d
-as the send channel base.
-
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/mailbox/Kconfig      |   8 ++
- drivers/mailbox/Makefile     |   2 +
- drivers/mailbox/arm_mhu_v2.c | 219 +++++++++++++++++++++++++++++++++++
- 3 files changed, 229 insertions(+)
- create mode 100644 drivers/mailbox/arm_mhu_v2.c
-
-diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
-index ab4eb750bbdd..15d2974d9c20 100644
---- a/drivers/mailbox/Kconfig
-+++ b/drivers/mailbox/Kconfig
-@@ -16,6 +16,14 @@ config ARM_MHU
- 	  The controller has 3 mailbox channels, the last of which can be
- 	  used in Secure mode only.
-=20
-+config ARM_MHUv2
-+	tristate "ARM MHUv2 Mailbox"
-+	depends on ARM_AMBA
-+	help
-+	  Say Y here if you want to build the ARM MHUv2 controller driver.
-+	  The controller has transmitter and receiver channels with their
-+	  interrupt lines.
-+
- config IMX_MBOX
- 	tristate "i.MX Mailbox"
- 	depends on ARCH_MXC || COMPILE_TEST
-diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
-index c22fad6f696b..ba77deeb86a2 100644
---- a/drivers/mailbox/Makefile
-+++ b/drivers/mailbox/Makefile
-@@ -7,6 +7,8 @@ obj-$(CONFIG_MAILBOX_TEST)	+=3D mailbox-test.o
-=20
- obj-$(CONFIG_ARM_MHU)	+=3D arm_mhu.o
-=20
-+obj-$(CONFIG_ARM_MHUv2)		+=3D arm_mhu_v2.o
-+
- obj-$(CONFIG_IMX_MBOX)	+=3D imx-mailbox.o
-=20
- obj-$(CONFIG_ARMADA_37XX_RWTM_MBOX)	+=3D armada-37xx-rwtm-mailbox.o
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-new file mode 100644
-index 000000000000..44ad125bf1c6
---- /dev/null
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -0,0 +1,219 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Message Handling Unit version 2 controller driver
-+ * Copyright (C) 2019 ARM Ltd.
-+ *
-+ * Based on drivers/mailbox/arm_mhu.c
-+ *
-+ */
-+
-+#include <linux/interrupt.h>
-+#include <linux/mutex.h>
-+#include <linux/slab.h>
-+#include <linux/err.h>
-+#include <linux/io.h>
-+#include <linux/module.h>
-+#include <linux/amba/bus.h>
-+#include <linux/mailbox_controller.h>
-+#include <linux/of_device.h>
-+#include <linux/of_address.h>
-+
-+#define MHU_V2_REG_STAT_OFS		0x0
-+#define MHU_V2_REG_CLR_OFS		0x8
-+#define MHU_V2_REG_SET_OFS		0xC
-+#define MHU_V2_REG_MSG_NO_CAP_OFS	0xF80
-+#define MHU_V2_REG_ACC_REQ_OFS		0xF88
-+#define MHU_V2_REG_ACC_RDY_OFS		0xF8C
-+
-+#define MHU_V2_CHANS			2
-+
-+#define mbox_to_arm_mhuv2(c) container_of(c, struct arm_mhuv2, mbox)
-+
-+struct mhuv2_link {
-+	unsigned int irq;
-+	void __iomem *tx_reg;
-+	void __iomem *rx_reg;
-+};
-+
-+struct arm_mhuv2 {
-+	void __iomem *base;
-+	struct mhuv2_link mlink[MHU_V2_CHANS];
-+	struct mbox_chan chan[MHU_V2_CHANS];
-+	struct mbox_controller mbox;
-+};
-+
-+static irqreturn_t mhuv2_rx_interrupt(int irq, void *p)
-+{
-+	struct mbox_chan *chan =3D p;
-+	struct mhuv2_link *mlink =3D chan->con_priv;
-+	u32 val;
-+
-+	val =3D readl_relaxed(mlink->rx_reg + MHU_V2_REG_STAT_OFS);
-+	if (!val)
-+		return IRQ_NONE;
-+
-+	mbox_chan_received_data(chan, (void *)&val);
-+
-+	writel_relaxed(val, mlink->rx_reg + MHU_V2_REG_CLR_OFS);
-+
-+	return IRQ_HANDLED;
-+}
-+
-+static bool mhuv2_last_tx_done(struct mbox_chan *chan)
-+{
-+	struct mhuv2_link *mlink =3D chan->con_priv;
-+	u32 val =3D readl_relaxed(mlink->tx_reg + MHU_V2_REG_STAT_OFS);
-+
-+	return (val =3D=3D 0);
-+}
-+
-+static int mhuv2_send_data(struct mbox_chan *chan, void *data)
-+{
-+	struct mhuv2_link *mlink =3D chan->con_priv;
-+	u32 *arg =3D data;
-+
-+	writel_relaxed(*arg, mlink->tx_reg + MHU_V2_REG_SET_OFS);
-+
-+	return 0;
-+}
-+
-+static int mhuv2_startup(struct mbox_chan *chan)
-+{
-+	struct mhuv2_link *mlink =3D chan->con_priv;
-+	u32 val;
-+	int ret;
-+	struct arm_mhuv2 *mhuv2 =3D mbox_to_arm_mhuv2(chan->mbox);
-+
-+	writel_relaxed(0x1, mhuv2->base + MHU_V2_REG_ACC_REQ_OFS);
-+
-+	val =3D readl_relaxed(mlink->tx_reg + MHU_V2_REG_STAT_OFS);
-+	writel_relaxed(val, mlink->tx_reg + MHU_V2_REG_CLR_OFS);
-+
-+	ret =3D request_irq(mlink->irq, mhuv2_rx_interrupt,
-+			  IRQF_SHARED, "mhuv2_link", chan);
-+	if (ret) {
-+		dev_err(chan->mbox->dev,
-+			"unable to acquire IRQ %d\n", mlink->irq);
-+		return ret;
-+	}
-+
-+	return 0;
-+}
-+
-+static void mhuv2_shutdown(struct mbox_chan *chan)
-+{
-+	struct mhuv2_link *mlink =3D chan->con_priv;
-+	struct arm_mhuv2 *mhuv2 =3D mbox_to_arm_mhuv2(chan->mbox);
-+
-+	writel_relaxed(0x0, mhuv2->base + MHU_V2_REG_ACC_REQ_OFS);
-+
-+	free_irq(mlink->irq, chan);
-+}
-+
-+static const struct mbox_chan_ops mhuv2_ops =3D {
-+	.send_data =3D mhuv2_send_data,
-+	.startup =3D mhuv2_startup,
-+	.shutdown =3D mhuv2_shutdown,
-+	.last_tx_done =3D mhuv2_last_tx_done,
-+};
-+
-+static int mhuv2_probe(struct amba_device *adev, const struct amba_id *=
id)
-+{
-+	int i, err;
-+	struct arm_mhuv2 *mhuv2;
-+	struct device *dev =3D &adev->dev;
-+	void __iomem *rx_base, *tx_base;
-+	const struct device_node *np =3D dev->of_node;
-+	unsigned int pchans;
-+
-+	/* Allocate memory for device */
-+	mhuv2 =3D devm_kzalloc(dev, sizeof(*mhuv2), GFP_KERNEL);
-+	if (!mhuv2)
-+		return -ENOMEM;
-+
-+	tx_base =3D of_iomap((struct device_node *)np, 0);
-+	if (!tx_base) {
-+		dev_err(dev, "failed to map tx registers\n");
-+		iounmap(rx_base);
-+		return -ENOMEM;
-+	}
-+
-+	rx_base =3D of_iomap((struct device_node *)np, 1);
-+	if (!rx_base) {
-+		dev_err(dev, "failed to map rx registers\n");
-+		return -ENOMEM;
-+	}
-+
-+
-+	pchans =3D readl_relaxed(tx_base + MHU_V2_REG_MSG_NO_CAP_OFS);
-+	if (pchans =3D=3D 0 || pchans > MHU_V2_CHANS || pchans % 2) {
-+		dev_err(dev, "invalid number of channels %d\n", pchans);
-+		iounmap(rx_base);
-+		iounmap(tx_base);
-+		return -EINVAL;
-+	}
-+	for (i =3D 0; i < pchans/2; i++) {
-+		mhuv2->chan[i].con_priv =3D &mhuv2->mlink[i];
-+		mhuv2->mlink[i].irq =3D adev->irq[i];
-+		mhuv2->mlink[i].rx_reg =3D rx_base + i*0x4;
-+		mhuv2->mlink[i].tx_reg =3D tx_base + i*0x4;
-+	}
-+
-+	mhuv2->base =3D tx_base;
-+	mhuv2->mbox.dev =3D dev;
-+	mhuv2->mbox.chans =3D &mhuv2->chan[0];
-+	mhuv2->mbox.num_chans =3D pchans;
-+	mhuv2->mbox.ops =3D &mhuv2_ops;
-+	mhuv2->mbox.txdone_irq =3D false;
-+	mhuv2->mbox.txdone_poll =3D true;
-+	mhuv2->mbox.txpoll_period =3D 1;
-+
-+	amba_set_drvdata(adev, mhuv2);
-+
-+	err =3D mbox_controller_register(&mhuv2->mbox);
-+	if (err) {
-+		dev_err(dev, "failed to register mailboxes %d\n", err);
-+		iounmap(rx_base);
-+		iounmap(tx_base);
-+		return err;
-+	}
-+
-+	dev_info(dev, "ARM MHUv2 Mailbox driver registered\n");
-+	return 0;
-+}
-+
-+static int mhuv2_remove(struct amba_device *adev)
-+{
-+	struct arm_mhuv2 *mhuv2 =3D amba_get_drvdata(adev);
-+
-+	mbox_controller_unregister(&mhuv2->mbox);
-+
-+	return 0;
-+}
-+
-+static struct amba_id mhuv2_ids[] =3D {
-+	{
-+		.id     =3D 0x4b0d1,
-+		.mask   =3D 0xfffff,
-+	},
-+	{
-+		.id     =3D 0xbb0d1,
-+		.mask   =3D 0xfffff,
-+	},
-+	{ 0, 0 },
-+};
-+MODULE_DEVICE_TABLE(amba, mhuv2_ids);
-+
-+static struct amba_driver arm_mhuv2_driver =3D {
-+	.drv =3D {
-+		.name	=3D "mhuv2",
-+	},
-+	.id_table	=3D mhuv2_ids,
-+	.probe		=3D mhuv2_probe,
-+	.remove		=3D mhuv2_remove,
-+};
-+module_amba_driver(arm_mhuv2_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("ARM MHUv2 Driver");
-+MODULE_AUTHOR("Samarth Parikh <samarthp@ymail.com>");
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0005-add=
-rpmsg-based-on-rpmsg-char-driver-using-mailbox.patch b/meta-arm-bsp/reci=
pes-kernel/linux/files/corstone700/0005-add-rpmsg-based-on-rpmsg-char-dri=
ver-using-mailbox.patch
deleted file mode 100644
index 0e1e00b6..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0005-add-rpmsg-=
based-on-rpmsg-char-driver-using-mailbox.patch
+++ /dev/null
@@ -1,202 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From f864a1bcd09b2f2cbe0c0b923d6d974d16b602ed Mon Sep 17 00:00:00 2001
-From: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Date: Sun, 3 Feb 2019 16:41:14 +0000
-Subject: [PATCH 05/20] add rpmsg based on rpmsg char driver using mailbo=
x
-
-this driver registers a rpmsg client which inturn registers a mailbox
-client to commmunicate the remote processor over MHU
-
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/Kconfig             |  10 +++
- drivers/rpmsg/Makefile            |   1 +
- drivers/rpmsg/rpmsg_arm_mailbox.c | 141 ++++++++++++++++++++++++++++++
- 3 files changed, 152 insertions(+)
- create mode 100644 drivers/rpmsg/rpmsg_arm_mailbox.c
-
-diff --git a/drivers/rpmsg/Kconfig b/drivers/rpmsg/Kconfig
-index a9108ff563dc..13f04012caeb 100644
---- a/drivers/rpmsg/Kconfig
-+++ b/drivers/rpmsg/Kconfig
-@@ -6,6 +6,16 @@ menu "Rpmsg drivers"
- config RPMSG
- 	tristate
-=20
-+config RPMSG_ARM
-+	tristate "ARM RPMSG driver"
-+	select     RPMSG
-+	depends on HAS_IOMEM
-+	depends on MAILBOX
-+	help
-+	  Say y here to enable support for rpmsg lient driver which is built
-+	  around mailbox client using Arm MHUv2.1 as physical medium.This
-+	  driver enables communication which remote processor using MHU.
-+
- config RPMSG_CHAR
- 	tristate "RPMSG device interface"
- 	depends on RPMSG
-diff --git a/drivers/rpmsg/Makefile b/drivers/rpmsg/Makefile
-index ae92a7fb08f6..3f0238a66a00 100644
---- a/drivers/rpmsg/Makefile
-+++ b/drivers/rpmsg/Makefile
-@@ -1,5 +1,6 @@
- # SPDX-License-Identifier: GPL-2.0
- obj-$(CONFIG_RPMSG)		+=3D rpmsg_core.o
-+obj-$(CONFIG_RPMSG_ARM)		+=3D rpmsg_arm_mailbox.o
- obj-$(CONFIG_RPMSG_CHAR)	+=3D rpmsg_char.o
- obj-$(CONFIG_RPMSG_MTK_SCP)	+=3D mtk_rpmsg.o
- obj-$(CONFIG_RPMSG_QCOM_GLINK_RPM) +=3D qcom_glink_rpm.o
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-new file mode 100644
-index 000000000000..af6c47737d06
---- /dev/null
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -0,0 +1,141 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * rpmsg client driver using mailbox client interface
-+ *
-+ * Copyright (C) 2019 ARM Ltd.
-+ *
-+ */
-+
-+#include <linux/bitmap.h>
-+#include <linux/export.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/ktime.h>
-+#include <linux/mailbox_client.h>
-+#include <linux/module.h>
-+#include <linux/of_address.h>
-+#include <linux/of_device.h>
-+#include <linux/processor.h>
-+#include <linux/semaphore.h>
-+#include <linux/slab.h>
-+#include <linux/rpmsg.h>
-+#include "rpmsg_internal.h"
-+
-+#define RPMSG_NAME	"arm_rpmsg"
-+#define RPMSG_ADDR_ANY	0xFFFFFFFF
-+#define TX_TIMEOUT	500 /*by half second*/
-+
-+struct rpmsg_endpoint *eptg;
-+
-+static void message_from_se(struct mbox_client *cl, void *mssg)
-+{
-+	eptg->cb(eptg->rpdev, mssg, 4, eptg->priv, RPMSG_ADDR_ANY);
-+}
-+
-+
-+static void arm_destroy_ept(struct rpmsg_endpoint *ept)
-+{
-+	kfree(ept);
-+}
-+
-+static int arm_send(struct rpmsg_endpoint *ept, void *data, int len)
-+{
-+	struct mbox_client *cl;
-+	struct mbox_chan *mbox;
-+
-+	cl =3D kzalloc(sizeof(struct mbox_client), GFP_KERNEL);
-+	cl->dev =3D ept->rpdev->dev.parent;
-+	cl->rx_callback =3D message_from_se;
-+	cl->tx_done =3D NULL; /* operate in blocking mode */
-+	cl->tx_block =3D true;
-+	cl->tx_tout =3D TX_TIMEOUT; /* by half a second */
-+	cl->knows_txdone =3D false; /* depending upon protocol */
-+
-+	mbox =3D mbox_request_channel(cl, 0);
-+	if (mbox =3D=3D NULL) {
-+		dev_printk(KERN_ERR, cl->dev, "\nCannot get the channel\n");
-+		return -1;
-+	}
-+	mbox_send_message(mbox, data);
-+	mbox_free_channel(mbox);
-+	return 0;
-+}
-+
-+static const struct rpmsg_endpoint_ops arm_endpoint_ops =3D {
-+	.destroy_ept =3D arm_destroy_ept,
-+	.send =3D arm_send,
-+};
-+
-+
-+static struct rpmsg_endpoint *arm_create_ept(struct rpmsg_device *rpdev=
,
-+		rpmsg_rx_cb_t cb, void *priv, struct rpmsg_channel_info chinfo)
-+{
-+	struct rpmsg_endpoint *ept;
-+
-+	ept =3D kzalloc(sizeof(*ept), GFP_KERNEL);
-+	if (!ept)
-+		return NULL;
-+
-+	kref_init(&ept->refcount);
-+	ept->rpdev =3D rpdev;
-+	ept->cb =3D cb;
-+	ept->priv =3D priv;
-+	ept->ops =3D &arm_endpoint_ops;
-+	eptg =3D ept;
-+
-+	return ept;
-+}
-+
-+static const struct rpmsg_device_ops arm_device_ops =3D {
-+	.create_ept =3D arm_create_ept,
-+};
-+
-+
-+static void arm_release_device(struct device *dev)
-+{
-+	struct rpmsg_device *rpdev =3D to_rpmsg_device(dev);
-+
-+	kfree(rpdev);
-+}
-+
-+
-+static int client_probe(struct platform_device *pdev)
-+{
-+	struct device *dev =3D &pdev->dev;
-+	struct rpmsg_device *rpdev;
-+
-+	rpdev =3D kzalloc(sizeof(*rpdev), GFP_KERNEL);
-+	if (!rpdev)
-+		return -ENOMEM;
-+
-+	/* Assign callbacks for rpmsg_device */
-+	rpdev->ops =3D &arm_device_ops;
-+
-+	/* Assign public information to the rpmsg_device */
-+	strncpy(rpdev->id.name, RPMSG_NAME, strlen(RPMSG_NAME));
-+
-+	rpdev->dev.parent =3D dev;
-+	rpdev->dev.release =3D arm_release_device;
-+
-+	return rpmsg_chrdev_register_device(rpdev);
-+}
-+
-+static const struct of_device_id client_of_match[] =3D {
-+	{ .compatible =3D "arm,client", .data =3D NULL },
-+	{ /* Sentinel */ },
-+};
-+
-+static struct platform_driver client_driver =3D {
-+	.driver =3D {
-+		.name =3D "arm-mhu-client",
-+		.of_match_table =3D client_of_match,
-+	},
-+	.probe =3D client_probe,
-+};
-+
-+module_platform_driver(client_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("ARM RPMSG Driver");
-+MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
-+
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0006-ena=
ble-arm-MHU-driver-and-RPMSG-char-driver.patch b/meta-arm-bsp/recipes-ker=
nel/linux/files/corstone700/0006-enable-arm-MHU-driver-and-RPMSG-char-dri=
ver.patch
deleted file mode 100644
index c9102943..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0006-enable-arm=
-MHU-driver-and-RPMSG-char-driver.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 83f137956333e57b7313cb5c344df0eb52caefdf Mon Sep 17 00:00:00 2001
-From: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Date: Thu, 2 May 2019 23:23:11 +0100
-Subject: [PATCH 06/20] enable arm MHU driver and RPMSG char driver
-
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/configs/corstone700_defconfig | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/arch/arm/configs/corstone700_defconfig b/arch/arm/configs/c=
orstone700_defconfig
-index d6553a85db16..5d5244ce8278 100644
---- a/arch/arm/configs/corstone700_defconfig
-+++ b/arch/arm/configs/corstone700_defconfig
-@@ -168,3 +168,8 @@ CONFIG_RTC_DRV_PL031=3Dy
- # CONFIG_CRYPTO_HW is not set
- # CONFIG_LTO_MENU=3Dy
- CONFIG_THUMB2_KERNEL=3Dy
-+CONFIG_MAILBOX=3Dy
-+CONFIG_ARM_MHUv2=3Dy
-+CONFIG_RPMSG=3Dy
-+CONFIG_RPMSG_CHAR=3Dy
-+CONFIG_RPMSG_ARM=3Dy
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0007-all=
ow-creation-of-multiple-arm-rpmsg-channels.patch b/meta-arm-bsp/recipes-k=
ernel/linux/files/corstone700/0007-allow-creation-of-multiple-arm-rpmsg-c=
hannels.patch
deleted file mode 100644
index f9ef6276..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0007-allow-crea=
tion-of-multiple-arm-rpmsg-channels.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From ae9eb0666ea462bf742abc8effc3cb3ec145cbae Mon Sep 17 00:00:00 2001
-From: Morten Borup Petersen <morten.petersen@arm.com>
-Date: Fri, 3 May 2019 10:45:20 +0100
-Subject: [PATCH 07/20] allow creation of multiple arm rpmsg channels
-
-This commit introduces support for accessing multiple channels
-through the arm rpmsg driver.
-To do this, information connecting rpmsg endpoints, mailbox channels
-and mailbox names are stored for each created endpoint.
-rpmsg endpoints and now to be created by referring to mailbox
-names defined in the device-tree.
-
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/rpmsg_arm_mailbox.c | 69 +++++++++++++++++++++++++++----
- 1 file changed, 60 insertions(+), 9 deletions(-)
-
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-index af6c47737d06..1cf7e20142e2 100644
---- a/drivers/rpmsg/rpmsg_arm_mailbox.c
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -25,35 +25,80 @@
- #define RPMSG_ADDR_ANY	0xFFFFFFFF
- #define TX_TIMEOUT	500 /*by half second*/
-=20
--struct rpmsg_endpoint *eptg;
-+struct arm_ept_info {
-+	struct rpmsg_channel_info info;
-+	struct rpmsg_endpoint *ept;
-+	struct mbox_client *cl;
-+
-+	struct list_head node;
-+};
-=20
--static void message_from_se(struct mbox_client *cl, void *mssg)
-+static LIST_HEAD(arm_ept_infos);
-+
-+static void arm_msg_rx_handler(struct mbox_client *cl, void *mssg)
- {
--	eptg->cb(eptg->rpdev, mssg, 4, eptg->priv, RPMSG_ADDR_ANY);
-+	struct arm_ept_info *it =3D NULL;
-+
-+	list_for_each_entry(it, &arm_ept_infos, node) {
-+		if (it->cl =3D=3D cl) {
-+			struct rpmsg_endpoint *ept =3D it->ept;
-+
-+			ept->cb(ept->rpdev, mssg, 4, ept->priv, RPMSG_ADDR_ANY);
-+			return;
-+		}
-+	}
- }
-=20
-=20
- static void arm_destroy_ept(struct rpmsg_endpoint *ept)
- {
-+	struct arm_ept_info *it =3D NULL;
-+
-+	list_for_each_entry(it, &arm_ept_infos, node) {
-+		if (it->ept =3D=3D ept) {
-+			list_del(&it->node);
-+			kfree(it);
-+			break;
-+		}
-+	}
- 	kfree(ept);
- }
-=20
- static int arm_send(struct rpmsg_endpoint *ept, void *data, int len)
- {
-+	struct arm_ept_info *it =3D NULL;
-+	struct arm_ept_info *arm_ept =3D NULL;
- 	struct mbox_client *cl;
- 	struct mbox_chan *mbox;
-=20
-+	// Locate registered endpoint
-+	list_for_each_entry(it, &arm_ept_infos, node) {
-+		if (it->ept =3D=3D ept) {
-+			arm_ept =3D it;
-+			break;
-+		}
-+	}
-+
-+	if (arm_ept =3D=3D NULL) {
-+		dev_printk(KERN_ERR, cl->dev,
-+			   "RPMsg ARM: Invalid endpoint\n");
-+		return -1;
-+	}
-+
- 	cl =3D kzalloc(sizeof(struct mbox_client), GFP_KERNEL);
- 	cl->dev =3D ept->rpdev->dev.parent;
--	cl->rx_callback =3D message_from_se;
-+	cl->rx_callback =3D arm_msg_rx_handler;
- 	cl->tx_done =3D NULL; /* operate in blocking mode */
- 	cl->tx_block =3D true;
- 	cl->tx_tout =3D TX_TIMEOUT; /* by half a second */
- 	cl->knows_txdone =3D false; /* depending upon protocol */
-+	arm_ept->cl =3D cl;
-=20
--	mbox =3D mbox_request_channel(cl, 0);
--	if (mbox =3D=3D NULL) {
--		dev_printk(KERN_ERR, cl->dev, "\nCannot get the channel\n");
-+	mbox =3D mbox_request_channel_byname(cl, arm_ept->info.name);
-+	if (IS_ERR_OR_NULL(mbox)) {
-+		dev_printk(KERN_ERR, cl->dev,
-+		 "RPMsg ARM: Cannot get channel by name: '%s'\n",
-+		 arm_ept->info.name);
- 		return -1;
- 	}
- 	mbox_send_message(mbox, data);
-@@ -71,6 +116,7 @@ static struct rpmsg_endpoint *arm_create_ept(struct r=
pmsg_device *rpdev,
- 		rpmsg_rx_cb_t cb, void *priv, struct rpmsg_channel_info chinfo)
- {
- 	struct rpmsg_endpoint *ept;
-+	struct arm_ept_info *ept_mbox;
-=20
- 	ept =3D kzalloc(sizeof(*ept), GFP_KERNEL);
- 	if (!ept)
-@@ -81,8 +127,13 @@ static struct rpmsg_endpoint *arm_create_ept(struct =
rpmsg_device *rpdev,
- 	ept->cb =3D cb;
- 	ept->priv =3D priv;
- 	ept->ops =3D &arm_endpoint_ops;
--	eptg =3D ept;
-=20
-+	// store chinfo for determining destination mailbox when sending
-+	ept_mbox =3D kzalloc(sizeof(*ept_mbox), GFP_KERNEL);
-+	ept_mbox->info =3D chinfo;
-+	strncpy(ept_mbox->info.name, chinfo.name, RPMSG_NAME_SIZE);
-+	ept_mbox->ept =3D ept;
-+	list_add(&ept_mbox->node, &arm_ept_infos);
- 	return ept;
- }
-=20
-@@ -112,7 +163,7 @@ static int client_probe(struct platform_device *pdev=
)
- 	rpdev->ops =3D &arm_device_ops;
-=20
- 	/* Assign public information to the rpmsg_device */
--	strncpy(rpdev->id.name, RPMSG_NAME, strlen(RPMSG_NAME));
-+	memcpy(rpdev->id.name, RPMSG_NAME, strlen(RPMSG_NAME));
-=20
- 	rpdev->dev.parent =3D dev;
- 	rpdev->dev.release =3D arm_release_device;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0008-mai=
lbox-enable-combined-receiver-interrupt-when-usin.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0008-mailbox-enable-combined-receive=
r-interrupt-when-usin.patch
deleted file mode 100644
index 1fc33da2..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0008-mailbox-en=
able-combined-receiver-interrupt-when-usin.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 5ec2338142acb7c1ca191fc79f9ea3ecc96dc125 Mon Sep 17 00:00:00 2001
-From: Morten Borup Petersen <morten.petersen@arm.com>
-Date: Tue, 25 Jun 2019 13:23:51 +0100
-Subject: [PATCH 08/20] mailbox: enable combined receiver interrupt when =
using
- MHUv2.1
-
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/mailbox/arm_mhu_v2.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-index 44ad125bf1c6..7780958a16ab 100644
---- a/drivers/mailbox/arm_mhu_v2.c
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -24,6 +24,11 @@
- #define MHU_V2_REG_MSG_NO_CAP_OFS	0xF80
- #define MHU_V2_REG_ACC_REQ_OFS		0xF88
- #define MHU_V2_REG_ACC_RDY_OFS		0xF8C
-+#define MHU_V2_INT_EN_OFS		0xF98
-+#define MHU_V2_AIDR_OFS			0xFCC
-+
-+#define MHU_V2_CHCOMB			BIT(2)
-+#define MHU_V2_AIDR_MINOR(_reg)		((_reg) & 0xF)
-=20
- #define MHU_V2_CHANS			2
-=20
-@@ -117,6 +122,16 @@ static const struct mbox_chan_ops mhuv2_ops =3D {
- 	.last_tx_done =3D mhuv2_last_tx_done,
- };
-=20
-+void mhuv2_check_enable_cmbint(struct mhuv2_link *link)
-+{
-+	const u32 aidr =3D readl_relaxed(link->rx_reg + MHU_V2_AIDR_OFS);
-+
-+	if (MHU_V2_AIDR_MINOR(aidr) =3D=3D 1) {
-+		// Enable combined receiver interrupt for MHUv2.1
-+		writel_relaxed(MHU_V2_CHCOMB, link->rx_reg + MHU_V2_INT_EN_OFS);
-+	}
-+}
-+
- static int mhuv2_probe(struct amba_device *adev, const struct amba_id *=
id)
- {
- 	int i, err;
-@@ -157,6 +172,7 @@ static int mhuv2_probe(struct amba_device *adev, con=
st struct amba_id *id)
- 		mhuv2->mlink[i].irq =3D adev->irq[i];
- 		mhuv2->mlink[i].rx_reg =3D rx_base + i*0x4;
- 		mhuv2->mlink[i].tx_reg =3D tx_base + i*0x4;
-+		mhuv2_check_enable_cmbint(&mhuv2->mlink[i]);
- 	}
-=20
- 	mhuv2->base =3D tx_base;
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0009-mis=
c-arm-add-corstone700-external-system-harness-dri.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0009-misc-arm-add-corstone700-extern=
al-system-harness-dri.patch
deleted file mode 100644
index e6c176eb..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0009-misc-arm-a=
dd-corstone700-external-system-harness-dri.patch
+++ /dev/null
@@ -1,232 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From dc2c23ba5acf17644af5ce5efc90667ce5da56c6 Mon Sep 17 00:00:00 2001
-From: Morten Borup Petersen <Morten.Petersen@arm.com>
-Date: Fri, 1 Mar 2019 13:29:18 +0000
-Subject: [PATCH 09/20] misc: arm: add corstone700 external system harnes=
s
- driver
-
-This commit adds a driver and device node for controlling the external
-system harness of arm corstone700.
-Currently, the only functionality is ioctl command: 0x0, which will
-deassert the CPU_WAIT pin of the external system harness attached to the
-driver.
-
-Signed-off-by: Morten Borup Petersen <Morten.Petersen@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/configs/corstone700_defconfig |   1 +
- drivers/misc/Kconfig                   |   1 +
- drivers/misc/Makefile                  |   1 +
- drivers/misc/arm/Kconfig               |   5 +
- drivers/misc/arm/Makefile              |   1 +
- drivers/misc/arm/extsys_ctrl.c         | 147 +++++++++++++++++++++++++
- 6 files changed, 156 insertions(+)
- create mode 100644 drivers/misc/arm/Kconfig
- create mode 100644 drivers/misc/arm/Makefile
- create mode 100644 drivers/misc/arm/extsys_ctrl.c
-
-diff --git a/arch/arm/configs/corstone700_defconfig b/arch/arm/configs/c=
orstone700_defconfig
-index 5d5244ce8278..629b2163a534 100644
---- a/arch/arm/configs/corstone700_defconfig
-+++ b/arch/arm/configs/corstone700_defconfig
-@@ -173,3 +173,4 @@ CONFIG_ARM_MHUv2=3Dy
- CONFIG_RPMSG=3Dy
- CONFIG_RPMSG_CHAR=3Dy
- CONFIG_RPMSG_ARM=3Dy
-+CONFIG_EXTSYS_CTRL=3Dy
-\ No newline at end of file
-diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
-index 7f0d48f406e3..8d904cd46e4b 100644
---- a/drivers/misc/Kconfig
-+++ b/drivers/misc/Kconfig
-@@ -480,4 +480,5 @@ source "drivers/misc/cxl/Kconfig"
- source "drivers/misc/ocxl/Kconfig"
- source "drivers/misc/cardreader/Kconfig"
- source "drivers/misc/habanalabs/Kconfig"
-+source "drivers/misc/arm/Kconfig"
- endmenu
-diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
-index c1860d35dc7e..9eec96cfb750 100644
---- a/drivers/misc/Makefile
-+++ b/drivers/misc/Makefile
-@@ -57,3 +57,4 @@ obj-y				+=3D cardreader/
- obj-$(CONFIG_PVPANIC)   	+=3D pvpanic.o
- obj-$(CONFIG_HABANA_AI)		+=3D habanalabs/
- obj-$(CONFIG_XILINX_SDFEC)	+=3D xilinx_sdfec.o
-+obj-y				+=3D arm/
-diff --git a/drivers/misc/arm/Kconfig b/drivers/misc/arm/Kconfig
-new file mode 100644
-index 000000000000..a808b5b17b8d
---- /dev/null
-+++ b/drivers/misc/arm/Kconfig
-@@ -0,0 +1,5 @@
-+config EXTSYS_CTRL
-+	tristate "Arm External System control driver"
-+	help
-+	  Say y here to enable support for external system control
-+	  driver for the Arm Corstone-700 platform
-diff --git a/drivers/misc/arm/Makefile b/drivers/misc/arm/Makefile
-new file mode 100644
-index 000000000000..1ca3084cf8a0
---- /dev/null
-+++ b/drivers/misc/arm/Makefile
-@@ -0,0 +1 @@
-+obj-$(CONFIG_EXTSYS_CTRL)	+=3D extsys_ctrl.o
-diff --git a/drivers/misc/arm/extsys_ctrl.c b/drivers/misc/arm/extsys_ct=
rl.c
-new file mode 100644
-index 000000000000..1ff384ef9c0d
---- /dev/null
-+++ b/drivers/misc/arm/extsys_ctrl.c
-@@ -0,0 +1,147 @@
-+// SPDX-License-Identifier: GPL-2.0
-+/*
-+ * Arm Corstone700 external system reset control driver
-+ *
-+ * Copyright (C) 2019 Arm Ltd.
-+ *
-+ */
-+
-+#include <linux/fs.h>
-+#include <linux/clk.h>
-+#include <linux/err.h>
-+#include <linux/interrupt.h>
-+#include <linux/io.h>
-+#include <linux/kernel.h>
-+#include <linux/mod_devicetable.h>
-+#include <linux/module.h>
-+#include <linux/platform_device.h>
-+#include <linux/miscdevice.h>
-+#include <linux/init.h>
-+
-+#define EXTSYS_DRV_NAME		"extsys_ctrl"
-+#define EXTSYS_MAX_DEVS		 4
-+
-+#define EXTSYS_RST_SIZE		U(0x8)
-+#define EXTSYS_RST_CTRL_OFF	U(0x0)
-+#define EXTSYS_RST_ST_OFF	U(0x4)
-+
-+/* External system reset control indexes */
-+#define EXTSYS_CPU_WAIT		(0x0)
-+#define EXTSYS_RST_REQ		(0x1)
-+
-+/* External system reset status masks */
-+#define EXTSYS_RST_ST_ACK_OFF	U(0x1)
-+
-+/* No Reset Requested */
-+#define EXTSYS_RST_ST_ACK_NRR	(0x0 << EXTSYS_RST_ST_ACK_OFF)
-+
-+/* Reset Request Complete */
-+#define EXTSYS_RST_ST_ACK_RRC	(0x2 << EXTSYS_RST_ST_ACK_OFF)
-+
-+/* Reset Request Unable to Complete */
-+#define EXTSYS_RST_ST_ACK_RRUC	(0x3 << EXTSYS_RST_ST_ACK_OFF)
-+
-+/* IOCTL commands */
-+#define EXTSYS_CPU_WAIT_DISABLE	0x0
-+
-+struct extsys_ctrl {
-+	struct miscdevice miscdev;
-+	void __iomem *reset_reg;
-+	void __iomem *set_reg;
-+};
-+
-+#define CLEAR_BIT(addr, index) writel(readl(addr) & ~(1UL << index), ad=
dr)
-+
-+static long extsys_ctrl_ioctl(struct file *f, unsigned int cmd,
-+			      unsigned long arg)
-+{
-+	struct extsys_ctrl *extsys;
-+
-+	extsys =3D container_of(f->private_data, struct extsys_ctrl, miscdev);
-+
-+	switch (cmd) {
-+	case EXTSYS_CPU_WAIT_DISABLE:
-+		CLEAR_BIT(extsys->reset_reg, EXTSYS_CPU_WAIT);
-+		break;
-+
-+	default:
-+		break;
-+	}
-+
-+	return 0;
-+}
-+
-+static const struct file_operations extsys_ctrl_fops =3D {
-+	.owner =3D THIS_MODULE,
-+	.unlocked_ioctl =3D extsys_ctrl_ioctl,
-+};
-+
-+static int extsys_ctrl_probe(struct platform_device *pdev)
-+{
-+	struct device *dev =3D &pdev->dev;
-+	struct extsys_ctrl *extsys;
-+	struct resource *res;
-+	void __iomem *reset_reg;
-+	void __iomem *set_reg;
-+	int ret;
-+
-+	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "rstreg");
-+	reset_reg =3D devm_ioremap_resource(dev, res);
-+	if (IS_ERR(reset_reg))
-+		return PTR_ERR(reset_reg);
-+
-+	res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "streg");
-+	set_reg =3D devm_ioremap_resource(dev, res);
-+	if (IS_ERR(set_reg))
-+		return PTR_ERR(set_reg);
-+
-+	extsys =3D devm_kzalloc(dev, sizeof(*extsys), GFP_KERNEL);
-+	if (!extsys)
-+		return -ENOMEM;
-+
-+	extsys->reset_reg =3D reset_reg;
-+	extsys->set_reg =3D set_reg;
-+
-+	extsys->miscdev.minor =3D MISC_DYNAMIC_MINOR;
-+	extsys->miscdev.name =3D EXTSYS_DRV_NAME;
-+	extsys->miscdev.fops =3D &extsys_ctrl_fops;
-+	extsys->miscdev.parent =3D dev;
-+
-+	ret =3D misc_register(&extsys->miscdev);
-+	if (ret)
-+		return ret;
-+
-+	dev_info(dev, "external system controller ready\n");
-+
-+	return 0;
-+}
-+
-+static int extsys_ctrl_remove(struct platform_device *pdev)
-+{
-+	struct extsys_ctrl *extsys =3D dev_get_drvdata(&pdev->dev);
-+
-+	misc_deregister(&extsys->miscdev);
-+
-+	return 0;
-+}
-+
-+static const struct of_device_id extsys_ctrl_match[] =3D {
-+	{ .compatible =3D "arm,extsys_ctrl" },
-+	{ },
-+};
-+MODULE_DEVICE_TABLE(of, extsys_ctrl_match);
-+
-+static struct platform_driver extsys_ctrl_driver =3D {
-+	.driver =3D {
-+		.name =3D EXTSYS_DRV_NAME,
-+		.of_match_table =3D extsys_ctrl_match,
-+	},
-+	.probe =3D extsys_ctrl_probe,
-+	.remove =3D extsys_ctrl_remove,
-+};
-+module_platform_driver(extsys_ctrl_driver);
-+
-+MODULE_LICENSE("GPL v2");
-+MODULE_DESCRIPTION("Arm External System Control Driver");
-+MODULE_AUTHOR("Morten Borup Petersen <morten.petersen@arm.com>");
-+MODULE_AUTHOR("Rui Miguel Silva <rui.silva@linaro.org>");
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0010-arm=
-containerize-endpoint-and-mailbox-information.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone700/0010-arm-containerize-endpoint-and-mail=
box-information.patch
deleted file mode 100644
index ef785076..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0010-arm-contai=
nerize-endpoint-and-mailbox-information.patch
+++ /dev/null
@@ -1,181 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From a0cee835763d884d8ce44d01d5271e7f2e68313f Mon Sep 17 00:00:00 2001
-From: Morten Borup Petersen <morten.petersen@arm.com>
-Date: Thu, 30 May 2019 15:30:54 +0100
-Subject: [PATCH 10/20] arm: containerize endpoint and mailbox informatio=
n
-
-This commit adds the rpmsg_endpoint and mbox_client structs as members o=
f the
-arm_channel struct. This allows for usage of the container_of macro, vas=
tly
-simplifying lookup between endpoints and mailboxes.
-
-Furthermore, a memory leak from the allocation of mbox_client's is fixed=
.
-
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Tushar Khandelwal <tushar.khandelwal@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/rpmsg_arm_mailbox.c | 113 ++++++++++--------------------
- 1 file changed, 36 insertions(+), 77 deletions(-)
-
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-index 1cf7e20142e2..4933187c61ea 100644
---- a/drivers/rpmsg/rpmsg_arm_mailbox.c
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -23,84 +23,41 @@
-=20
- #define RPMSG_NAME	"arm_rpmsg"
- #define RPMSG_ADDR_ANY	0xFFFFFFFF
--#define TX_TIMEOUT	500 /*by half second*/
-=20
--struct arm_ept_info {
--	struct rpmsg_channel_info info;
--	struct rpmsg_endpoint *ept;
--	struct mbox_client *cl;
--
--	struct list_head node;
-+struct arm_channel {
-+	struct rpmsg_channel_info chinfo;
-+	struct rpmsg_endpoint ept;
-+	struct mbox_client cl;
- };
-=20
--static LIST_HEAD(arm_ept_infos);
-+#define arm_channel_from_rpmsg(_ept) container_of(_ept, struct arm_chan=
nel, ept)
-+#define arm_channel_from_mbox(_ept) container_of(_ept, struct arm_chann=
el, cl)
-+
-=20
- static void arm_msg_rx_handler(struct mbox_client *cl, void *mssg)
- {
--	struct arm_ept_info *it =3D NULL;
--
--	list_for_each_entry(it, &arm_ept_infos, node) {
--		if (it->cl =3D=3D cl) {
--			struct rpmsg_endpoint *ept =3D it->ept;
--
--			ept->cb(ept->rpdev, mssg, 4, ept->priv, RPMSG_ADDR_ANY);
--			return;
--		}
--	}
-+	struct arm_channel* channel =3D arm_channel_from_mbox(cl);
-+	channel->ept.cb(channel->ept.rpdev, mssg, 4, channel->ept.priv, RPMSG_=
ADDR_ANY);
- }
-=20
-=20
- static void arm_destroy_ept(struct rpmsg_endpoint *ept)
- {
--	struct arm_ept_info *it =3D NULL;
--
--	list_for_each_entry(it, &arm_ept_infos, node) {
--		if (it->ept =3D=3D ept) {
--			list_del(&it->node);
--			kfree(it);
--			break;
--		}
--	}
--	kfree(ept);
-+	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
-+	kfree(channel);
- }
-=20
- static int arm_send(struct rpmsg_endpoint *ept, void *data, int len)
- {
--	struct arm_ept_info *it =3D NULL;
--	struct arm_ept_info *arm_ept =3D NULL;
--	struct mbox_client *cl;
-+	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
- 	struct mbox_chan *mbox;
-=20
--	// Locate registered endpoint
--	list_for_each_entry(it, &arm_ept_infos, node) {
--		if (it->ept =3D=3D ept) {
--			arm_ept =3D it;
--			break;
--		}
--	}
--
--	if (arm_ept =3D=3D NULL) {
--		dev_printk(KERN_ERR, cl->dev,
--			   "RPMsg ARM: Invalid endpoint\n");
--		return -1;
--	}
--
--	cl =3D kzalloc(sizeof(struct mbox_client), GFP_KERNEL);
--	cl->dev =3D ept->rpdev->dev.parent;
--	cl->rx_callback =3D arm_msg_rx_handler;
--	cl->tx_done =3D NULL; /* operate in blocking mode */
--	cl->tx_block =3D true;
--	cl->tx_tout =3D TX_TIMEOUT; /* by half a second */
--	cl->knows_txdone =3D false; /* depending upon protocol */
--	arm_ept->cl =3D cl;
--
--	mbox =3D mbox_request_channel_byname(cl, arm_ept->info.name);
-+	mbox =3D mbox_request_channel_byname(&channel->cl, channel->chinfo.nam=
e);
- 	if (IS_ERR_OR_NULL(mbox)) {
--		dev_printk(KERN_ERR, cl->dev,
--		 "RPMsg ARM: Cannot get channel by name: '%s'\n",
--		 arm_ept->info.name);
-+		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", channel->chin=
fo.name);
- 		return -1;
- 	}
-+
- 	mbox_send_message(mbox, data);
- 	mbox_free_channel(mbox);
- 	return 0;
-@@ -115,26 +72,29 @@ static const struct rpmsg_endpoint_ops arm_endpoint=
_ops =3D {
- static struct rpmsg_endpoint *arm_create_ept(struct rpmsg_device *rpdev=
,
- 		rpmsg_rx_cb_t cb, void *priv, struct rpmsg_channel_info chinfo)
- {
--	struct rpmsg_endpoint *ept;
--	struct arm_ept_info *ept_mbox;
--
--	ept =3D kzalloc(sizeof(*ept), GFP_KERNEL);
--	if (!ept)
--		return NULL;
--
--	kref_init(&ept->refcount);
--	ept->rpdev =3D rpdev;
--	ept->cb =3D cb;
--	ept->priv =3D priv;
--	ept->ops =3D &arm_endpoint_ops;
-+	struct arm_channel* channel;
-+	channel =3D kzalloc(sizeof(*channel), GFP_KERNEL);
-=20
- 	// store chinfo for determining destination mailbox when sending
--	ept_mbox =3D kzalloc(sizeof(*ept_mbox), GFP_KERNEL);
--	ept_mbox->info =3D chinfo;
--	strncpy(ept_mbox->info.name, chinfo.name, RPMSG_NAME_SIZE);
--	ept_mbox->ept =3D ept;
--	list_add(&ept_mbox->node, &arm_ept_infos);
--	return ept;
-+	channel->chinfo =3D chinfo;
-+	strncpy(channel->chinfo.name, chinfo.name, RPMSG_NAME_SIZE);
-+
-+	// Initialize rpmsg endpoint
-+	kref_init(&channel->ept.refcount);
-+	channel->ept.rpdev =3D rpdev;
-+	channel->ept.cb =3D cb;
-+	channel->ept.priv =3D priv;
-+	channel->ept.ops =3D &arm_endpoint_ops;
-+
-+	// Initialize mailbox client
-+	channel->cl.dev =3D rpdev->dev.parent;
-+	channel->cl.rx_callback =3D arm_msg_rx_handler;
-+	channel->cl.tx_done =3D NULL; /* operate in blocking mode */
-+	channel->cl.tx_block =3D true;
-+	channel->cl.tx_tout =3D 500; /* by half a second */
-+	channel->cl.knows_txdone =3D false; /* depending upon protocol */
-+
-+	return &channel->ept;
- }
-=20
- static const struct rpmsg_device_ops arm_device_ops =3D {
-@@ -189,4 +149,3 @@ module_platform_driver(client_driver);
- MODULE_LICENSE("GPL v2");
- MODULE_DESCRIPTION("ARM RPMSG Driver");
- MODULE_AUTHOR("Tushar Khandelwal <tushar.khandelwal@arm.com>");
--
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0011-arm=
-couple-mailbox-channel-ownership-to-rpmsg-endpoi.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0011-arm-couple-mailbox-channel-owne=
rship-to-rpmsg-endpoi.patch
deleted file mode 100644
index d37cf946..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0011-arm-couple=
-mailbox-channel-ownership-to-rpmsg-endpoi.patch
+++ /dev/null
@@ -1,107 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 451766a1eb1e070b585ab8cae31ed0dc7845a37a Mon Sep 17 00:00:00 2001
-From: Morten Borup Petersen <morten.petersen@arm.com>
-Date: Wed, 12 Jun 2019 12:11:57 +0100
-Subject: [PATCH 11/20] arm: couple mailbox channel ownership to rpmsg en=
dpoint
- lifecycle
-
-Previously, mailbox channels would be assigned once a write occured to t=
he
-endpoint. This presents an issue wherein if a mailbox is opened with a g=
iven
-destination channel, and then read from, instead of writing to it, the t=
arget
-mailbox channel would not bind to the mailbox client, and thus not forwa=
rd its
-received message to the rpmsg endpoint.
-
-This commits moves the ownership of a mailbox channel to the lifecycle o=
f an
-rpmsg endpoint, thus registerring the mailbox channel with the mailbox c=
lient
-once the rpmsg endpoint is opened in userspace.
-
-Signed-off-by: Morten Borup Petersen <morten.petersen@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/rpmsg/rpmsg_arm_mailbox.c | 31 +++++++++++++++----------------
- 1 file changed, 15 insertions(+), 16 deletions(-)
-
-diff --git a/drivers/rpmsg/rpmsg_arm_mailbox.c b/drivers/rpmsg/rpmsg_arm=
_mailbox.c
-index 4933187c61ea..0773b475a932 100644
---- a/drivers/rpmsg/rpmsg_arm_mailbox.c
-+++ b/drivers/rpmsg/rpmsg_arm_mailbox.c
-@@ -25,9 +25,9 @@
- #define RPMSG_ADDR_ANY	0xFFFFFFFF
-=20
- struct arm_channel {
--	struct rpmsg_channel_info chinfo;
- 	struct rpmsg_endpoint ept;
- 	struct mbox_client cl;
-+	struct mbox_chan *mbox;
- };
-=20
- #define arm_channel_from_rpmsg(_ept) container_of(_ept, struct arm_chan=
nel, ept)
-@@ -37,29 +37,25 @@ struct arm_channel {
- static void arm_msg_rx_handler(struct mbox_client *cl, void *mssg)
- {
- 	struct arm_channel* channel =3D arm_channel_from_mbox(cl);
--	channel->ept.cb(channel->ept.rpdev, mssg, 4, channel->ept.priv, RPMSG_=
ADDR_ANY);
-+	int err =3D channel->ept.cb(channel->ept.rpdev, mssg, 4, channel->ept.=
priv, RPMSG_ADDR_ANY);
-+	if(err) {
-+		printk("ARM Mailbox: Endpoint callback failed with error: %d", err);
-+	}
- }
-=20
-=20
- static void arm_destroy_ept(struct rpmsg_endpoint *ept)
- {
- 	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
-+	mbox_free_channel(channel->mbox);
- 	kfree(channel);
- }
-=20
- static int arm_send(struct rpmsg_endpoint *ept, void *data, int len)
- {
- 	struct arm_channel *channel =3D arm_channel_from_rpmsg(ept);
--	struct mbox_chan *mbox;
--
--	mbox =3D mbox_request_channel_byname(&channel->cl, channel->chinfo.nam=
e);
--	if (IS_ERR_OR_NULL(mbox)) {
--		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", channel->chin=
fo.name);
--		return -1;
--	}
-=20
--	mbox_send_message(mbox, data);
--	mbox_free_channel(mbox);
-+	mbox_send_message(channel->mbox, data);
- 	return 0;
- }
-=20
-@@ -72,12 +68,9 @@ static const struct rpmsg_endpoint_ops arm_endpoint_o=
ps =3D {
- static struct rpmsg_endpoint *arm_create_ept(struct rpmsg_device *rpdev=
,
- 		rpmsg_rx_cb_t cb, void *priv, struct rpmsg_channel_info chinfo)
- {
--	struct arm_channel* channel;
--	channel =3D kzalloc(sizeof(*channel), GFP_KERNEL);
-+	struct arm_channel *channel;
-=20
--	// store chinfo for determining destination mailbox when sending
--	channel->chinfo =3D chinfo;
--	strncpy(channel->chinfo.name, chinfo.name, RPMSG_NAME_SIZE);
-+	channel =3D kzalloc(sizeof(*channel), GFP_KERNEL);
-=20
- 	// Initialize rpmsg endpoint
- 	kref_init(&channel->ept.refcount);
-@@ -94,6 +87,12 @@ static struct rpmsg_endpoint *arm_create_ept(struct r=
pmsg_device *rpdev,
- 	channel->cl.tx_tout =3D 500; /* by half a second */
- 	channel->cl.knows_txdone =3D false; /* depending upon protocol */
-=20
-+	channel->mbox =3D mbox_request_channel_byname(&channel->cl, chinfo.nam=
e);
-+	if (IS_ERR_OR_NULL(channel->mbox)) {
-+		printk("RPMsg ARM: Cannot get channel by name: '%s'\n", chinfo.name);
-+		return -1;
-+	}
-+
- 	return &channel->ept;
- }
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0012-mai=
lbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0012-mailbox-arm_mhu_v2-add-new-AMBA=
-ID-to-support-MHU-v2.patch
deleted file mode 100644
index 56ce9e96..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0012-mailbox-ar=
m_mhu_v2-add-new-AMBA-ID-to-support-MHU-v2.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 546e8277f0a187bc32c1e60b4317c87ea6145f90 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Fri, 16 Aug 2019 13:40:39 +0100
-Subject: [PATCH 12/20] mailbox: arm_mhu_v2: add new AMBA ID to support M=
HU
- v2.1
-
-With MHU v2.1 specification, AMBA ID is changed.
-This change is to add a new AMBA ID entry for MHU.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/mailbox/arm_mhu_v2.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-index 7780958a16ab..fe43348db5e3 100644
---- a/drivers/mailbox/arm_mhu_v2.c
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -216,6 +216,10 @@ static struct amba_id mhuv2_ids[] =3D {
- 		.id     =3D 0xbb0d1,
- 		.mask   =3D 0xfffff,
- 	},
-+	{
-+		.id     =3D 0xbb076,
-+		.mask   =3D 0xfffff,
-+	},
- 	{ 0, 0 },
- };
- MODULE_DEVICE_TABLE(amba, mhuv2_ids);
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0013-mai=
lbox-arm_mhu_v2-dynamic-allocation-of-channels.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone700/0013-mailbox-arm_mhu_v2-dynamic-allocat=
ion-of-channels.patch
deleted file mode 100644
index b4187afd..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0013-mailbox-ar=
m_mhu_v2-dynamic-allocation-of-channels.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 4c0f31d0b6a10e9c67ca1e1a5cbae6511b087a51 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 14 Aug 2019 18:02:11 +0100
-Subject: [PATCH 13/20] mailbox: arm_mhu_v2: dynamic allocation of channe=
ls
-
-Typically, hardware reports number of channels it supports.
-Software should read the appropriate registers to determine the
-number of channels support and should make the allocations
-accordingly. This change is to achieve it by removing static allocation
-and making dynamic allocations.
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/mailbox/arm_mhu_v2.c | 47 +++++++++++++++++++++++++++---------
- 1 file changed, 35 insertions(+), 12 deletions(-)
-
-diff --git a/drivers/mailbox/arm_mhu_v2.c b/drivers/mailbox/arm_mhu_v2.c
-index fe43348db5e3..56fb31eeaa87 100644
---- a/drivers/mailbox/arm_mhu_v2.c
-+++ b/drivers/mailbox/arm_mhu_v2.c
-@@ -30,7 +30,7 @@
- #define MHU_V2_CHCOMB			BIT(2)
- #define MHU_V2_AIDR_MINOR(_reg)		((_reg) & 0xF)
-=20
--#define MHU_V2_CHANS			2
-+#define MHU_V2_EACH_CHANNEL_SIZE	0x20
-=20
- #define mbox_to_arm_mhuv2(c) container_of(c, struct arm_mhuv2, mbox)
-=20
-@@ -42,8 +42,8 @@ struct mhuv2_link {
-=20
- struct arm_mhuv2 {
- 	void __iomem *base;
--	struct mhuv2_link mlink[MHU_V2_CHANS];
--	struct mbox_chan chan[MHU_V2_CHANS];
-+	struct mhuv2_link *mlink;
-+	struct mbox_chan *chan;
- 	struct mbox_controller mbox;
- };
-=20
-@@ -140,6 +140,9 @@ static int mhuv2_probe(struct amba_device *adev, con=
st struct amba_id *id)
- 	void __iomem *rx_base, *tx_base;
- 	const struct device_node *np =3D dev->of_node;
- 	unsigned int pchans;
-+	struct mhuv2_link *mlink;
-+	struct mbox_chan *chan;
-+
-=20
- 	/* Allocate memory for device */
- 	mhuv2 =3D devm_kzalloc(dev, sizeof(*mhuv2), GFP_KERNEL);
-@@ -159,25 +162,43 @@ static int mhuv2_probe(struct amba_device *adev, c=
onst struct amba_id *id)
- 		return -ENOMEM;
- 	}
-=20
--
- 	pchans =3D readl_relaxed(tx_base + MHU_V2_REG_MSG_NO_CAP_OFS);
--	if (pchans =3D=3D 0 || pchans > MHU_V2_CHANS || pchans % 2) {
-+	if (pchans =3D=3D 0 || pchans % 2) {
- 		dev_err(dev, "invalid number of channels %d\n", pchans);
- 		iounmap(rx_base);
- 		iounmap(tx_base);
- 		return -EINVAL;
- 	}
--	for (i =3D 0; i < pchans/2; i++) {
--		mhuv2->chan[i].con_priv =3D &mhuv2->mlink[i];
--		mhuv2->mlink[i].irq =3D adev->irq[i];
--		mhuv2->mlink[i].rx_reg =3D rx_base + i*0x4;
--		mhuv2->mlink[i].tx_reg =3D tx_base + i*0x4;
--		mhuv2_check_enable_cmbint(&mhuv2->mlink[i]);
-+
-+	mhuv2->mlink =3D devm_kcalloc(dev, pchans, sizeof(*mlink), GFP_KERNEL)=
;
-+	if (!mhuv2->mlink) {
-+		iounmap(rx_base);
-+		iounmap(tx_base);
-+		return -ENOMEM;
-+	}
-+
-+	mhuv2->chan =3D devm_kcalloc(dev, pchans, sizeof(*chan), GFP_KERNEL);
-+	if (!mhuv2->chan) {
-+		iounmap(rx_base);
-+		iounmap(tx_base);
-+		kfree(mhuv2->mlink);
-+		return -ENOMEM;
- 	}
-=20
-+	for (i =3D 0; i < pchans; i++) {
-+		mlink =3D mhuv2->mlink + i;
-+		chan =3D mhuv2->chan + i;
-+		chan->con_priv =3D mlink;
-+		mlink->rx_reg =3D rx_base + (i * MHU_V2_EACH_CHANNEL_SIZE);
-+		mlink->tx_reg =3D tx_base + (i * MHU_V2_EACH_CHANNEL_SIZE);
-+	}
-+
-+	mhuv2->mlink->irq =3D adev->irq[0];
-+	mhuv2_check_enable_cmbint(mhuv2->mlink);
-+
- 	mhuv2->base =3D tx_base;
- 	mhuv2->mbox.dev =3D dev;
--	mhuv2->mbox.chans =3D &mhuv2->chan[0];
-+	mhuv2->mbox.chans =3D mhuv2->chan;
- 	mhuv2->mbox.num_chans =3D pchans;
- 	mhuv2->mbox.ops =3D &mhuv2_ops;
- 	mhuv2->mbox.txdone_irq =3D false;
-@@ -191,6 +212,8 @@ static int mhuv2_probe(struct amba_device *adev, con=
st struct amba_id *id)
- 		dev_err(dev, "failed to register mailboxes %d\n", err);
- 		iounmap(rx_base);
- 		iounmap(tx_base);
-+		kfree(mhuv2->mlink);
-+		kfree(mhuv2->chan);
- 		return err;
- 	}
-=20
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0014-def=
config-adjust-XIP-physical-address-to-3MB-offset.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/files/corstone700/0014-defconfig-adjust-XIP-physical-ad=
dress-to-3MB-offset.patch
deleted file mode 100644
index b79470ea..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0014-defconfig-=
adjust-XIP-physical-address-to-3MB-offset.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From eb92a2e53578326a15bc193c0dc2512793c8c502 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Wed, 9 Oct 2019 13:28:51 +0100
-Subject: [PATCH 14/20] defconfig: adjust XIP physical address to 3MB off=
set
-
-Because of the memory constraint, reduced root filesystem
-to 2MB and as result XIP start address should be changed.
-This change is to adjust XIP PHYS start address to align
-with the rootfs size change
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/configs/corstone700_defconfig | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/configs/corstone700_defconfig b/arch/arm/configs/c=
orstone700_defconfig
-index 629b2163a534..61a0a3c3a209 100644
---- a/arch/arm/configs/corstone700_defconfig
-+++ b/arch/arm/configs/corstone700_defconfig
-@@ -25,7 +25,7 @@ CONFIG_PHYS_OFFSET=3D0x02100000
- CONFIG_FLASH_MEM_BASE=3D0x08000000
- CONFIG_FLASH_SIZE=3D0x4000000
- CONFIG_XIP_KERNEL=3Dy
--CONFIG_XIP_PHYS_ADDR=3D0x08500000
-+CONFIG_XIP_PHYS_ADDR=3D0x08300000
- # CONFIG_ARCH_VEXPRESS_CA9X4=3Dy
- # CONFIG_ARCH_VEXPRESS_DCSCB=3Dy
- # CONFIG_ARCH_VEXPRESS_TC2_PM=3Dy
-@@ -173,4 +173,4 @@ CONFIG_ARM_MHUv2=3Dy
- CONFIG_RPMSG=3Dy
- CONFIG_RPMSG_CHAR=3Dy
- CONFIG_RPMSG_ARM=3Dy
--CONFIG_EXTSYS_CTRL=3Dy
-\ No newline at end of file
-+CONFIG_EXTSYS_CTRL=3Dy
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0015-arm=
-Kconfig-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0015-arm-Kconfig-disable-ARM_VIRT-ex=
tension-if-XIP_KERNEL.patch
deleted file mode 100644
index c316cba6..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0015-arm-Kconfi=
g-disable-ARM_VIRT-extension-if-XIP_KERNEL.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From dbf2cd8967b6e2c47084e52aae8a15a669614cb1 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Mon, 7 Oct 2019 12:26:06 +0100
-Subject: [PATCH 15/20] arm: Kconfig: disable ARM_VIRT extension if XIP_K=
ERNEL
-
-XIP is intended to execute kernel inplace and typically from
-flash and is used mostly on low memory devices.
-
-.macro  store_primary_cpu_mode  reg1, reg2, reg3
-        mrs     \reg1, cpsr
-        and     \reg1, \reg1, #MODE_MASK
-        adr     \reg2, .L__boot_cpu_mode_offset
-        ldr     \reg3, [\reg2]
-        str     \reg1, [\reg2, \reg3]
-
-As text section is in flash memory and data section is in RAM.
-L__boot_cpu_mode_offset would evaluate to address based
-on virtual addresses provided by linker script. At this stage
-the MMU is OFF.
-
-The logic used based stored @L__boot_cpu_mode_offset on the offset
-between the  boot_cpu_mode in data section and the location of
-L__boot_cpu_mode_offset can't be used along with PC to fetch the value
-of boot_cpu_mode doesn't work.
-
-This change is to disable CONFIG_ARM_VIRT_EXT for XIP kernel
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
----
- arch/arm/mm/Kconfig | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
-index 65e4482e3849..69810125998b 100644
---- a/arch/arm/mm/Kconfig
-+++ b/arch/arm/mm/Kconfig
-@@ -703,6 +703,7 @@ config ARM_THUMBEE
-=20
- config ARM_VIRT_EXT
- 	bool
-+	depends on !XIP_KERNEL
- 	default y if CPU_V7
- 	help
- 	  Enable the kernel to make use of the ARM Virtualization
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0016-cor=
stone700_defconfig-use-DDR-address-instead-of-sha.patch b/meta-arm-bsp/re=
cipes-kernel/linux/files/corstone700/0016-corstone700_defconfig-use-DDR-a=
ddress-instead-of-sha.patch
deleted file mode 100644
index 06220e10..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0016-corstone70=
0_defconfig-use-DDR-address-instead-of-sha.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From e5d99c1524576eb47c13e08d4dd20ebc72491477 Mon Sep 17 00:00:00 2001
-From: Vishnu Banavath <vishnu.banavath@arm.com>
-Date: Mon, 14 Oct 2019 15:15:46 +0100
-Subject: [PATCH 16/20] corstone700_defconfig: use DDR address instead of
- shared RAM
-
-On fpga we use DDR for kernel data, dtb and rootfs.
-This change is to update CONFIG_PHYS_ADDR to 0x80000000
-
-Signed-off-by: Vishnu Banavath <vishnu.banavath@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/configs/corstone700_defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/configs/corstone700_defconfig b/arch/arm/configs/c=
orstone700_defconfig
-index 61a0a3c3a209..add9f5673395 100644
---- a/arch/arm/configs/corstone700_defconfig
-+++ b/arch/arm/configs/corstone700_defconfig
-@@ -21,7 +21,7 @@ CONFIG_BLK_DEV_INITRD=3Dy
- CONFIG_ARCH_TINY_VEXPRESS=3Dy
- CONFIG_ARM_SINGLE_ARMV7A=3Dy
- #CONFIG_DRAM_BASE=3D0x02100000
--CONFIG_PHYS_OFFSET=3D0x02100000
-+CONFIG_PHYS_OFFSET=3D0x80000000
- CONFIG_FLASH_MEM_BASE=3D0x08000000
- CONFIG_FLASH_SIZE=3D0x4000000
- CONFIG_XIP_KERNEL=3Dy
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0017-cor=
stone700_defconfig-enable-configs-for-cramfs-xip.patch b/meta-arm-bsp/rec=
ipes-kernel/linux/files/corstone700/0017-corstone700_defconfig-enable-con=
figs-for-cramfs-xip.patch
deleted file mode 100644
index f4b25ba4..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0017-corstone70=
0_defconfig-enable-configs-for-cramfs-xip.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 32969f7963890fc0e3c7d47d788751272d95e501 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 20 Dec 2019 13:12:27 +0000
-Subject: [PATCH 17/20] corstone700_defconfig: enable configs for cramfs-=
xip
-
-Add the MTD and CRAMFS support for CramFS-XIP
-
-Because the NOR flash is already mapped and read-accessible
-before the kernel starts, so we don't need a QSPI driver to
-access the rootfs. The kernel shouldn't be configured with
-MTD_CFI. Otherwise, the kernel will verify CFI compliancy
-by writing commands to the flash and a QSPI driver is required
-in this case.
-
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- arch/arm/configs/corstone700_defconfig | 13 +++++++++----
- 1 file changed, 9 insertions(+), 4 deletions(-)
-
-diff --git a/arch/arm/configs/corstone700_defconfig b/arch/arm/configs/c=
orstone700_defconfig
-index add9f5673395..13863b804c6b 100644
---- a/arch/arm/configs/corstone700_defconfig
-+++ b/arch/arm/configs/corstone700_defconfig
-@@ -60,13 +60,17 @@ CONFIG_IP_PNP_BOOTP=3Dy
- # CONFIG_NET_9P_VIRTIO=3Dy
- # CONFIG_UEVENT_HELPER_PATH=3D"/sbin/hotplug"
- CONFIG_DEVTMPFS=3Dy
--# CONFIG_MTD=3Dy
-+CONFIG_MTD=3Dy
- # CONFIG_MTD_CMDLINE_PARTS=3Dy
- # CONFIG_MTD_BLOCK=3Dy
--# CONFIG_MTD_CFI=3Dy
-+CONFIG_MTD_RAM=3Dy
-+CONFIG_MTD_ROM=3Dy
- # CONFIG_MTD_CFI_INTELEXT=3Dy
- # CONFIG_MTD_CFI_AMDSTD=3Dy
--# CONFIG_MTD_PHYSMAP=3Dy
-+CONFIG_MTD_PHYSMAP=3Dy
-+CONFIG_MTD_PHYSMAP_COMPAT=3Dy
-+CONFIG_MTD_PHYSMAP_START=3D0x08100000
-+CONFIG_MTD_PHYSMAP_LEN=3D0x200000
- # CONFIG_MTD_PHYSMAP_OF=3Dy
- # CONFIG_MTD_PLATRAM=3Dy
- # CONFIG_MTD_UBI=3Dy
-@@ -149,7 +153,8 @@ CONFIG_RTC_DRV_PL031=3Dy
- # CONFIG_TMPFS=3Dy
- # CONFIG_JFFS2_FS=3Dy
- # CONFIG_UBIFS_FS=3Dy
--# CONFIG_CRAMFS=3Dy
-+CONFIG_CRAMFS=3Dy
-+CONFIG_CRAMFS_MTD=3Dy
- # CONFIG_SQUASHFS=3Dy
- # CONFIG_SQUASHFS_LZO=3Dy
- # CONFIG_NFS_FS=3Dy
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0018-usb=
-isp1760-move-to-regmap-for-register-access.patch b/meta-arm-bsp/recipes-=
kernel/linux/files/corstone700/0018-usb-isp1760-move-to-regmap-for-regist=
er-access.patch
deleted file mode 100644
index 4e97419c..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0018-usb-isp176=
0-move-to-regmap-for-register-access.patch
+++ /dev/null
@@ -1,2297 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From beba47e338d093f7fc08231b5b8039ad4db93494 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Thu, 25 Jun 2020 16:29:08 +0100
-Subject: [PATCH 18/20] usb: isp1760: move to regmap for register access
-
-Rework access to registers and memory to use regmap framework.
-No change in current feature or way of work is intended with this
-change.
-
-This will allow to reuse this driver with other IP of this family,
-for example isp1763, with little changes and effort.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-core.c | 120 +++++---
- drivers/usb/isp1760/isp1760-core.h |  38 ++-
- drivers/usb/isp1760/isp1760-hcd.c  | 434 ++++++++++++++--------------
- drivers/usb/isp1760/isp1760-hcd.h  |  16 +-
- drivers/usb/isp1760/isp1760-if.c   |   4 +-
- drivers/usb/isp1760/isp1760-regs.h | 443 +++++++++++++++++------------
- drivers/usb/isp1760/isp1760-udc.c  | 235 ++++++++++-----
- drivers/usb/isp1760/isp1760-udc.h  |  10 +-
- 8 files changed, 775 insertions(+), 525 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index fdeb4cf97cc5..f7f680046a15 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -2,12 +2,14 @@
- /*
-  * Driver for the NXP ISP1760 chip
-  *
-+ * Copyright 2020 Rui Miguel Silva
-  * Copyright 2014 Laurent Pinchart
-  * Copyright 2007 Sebastian Siewior
-  *
-  * Contacts:
-  *	Sebastian Siewior <bigeasy@linutronix.de>
-  *	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-+ *	Rui Miguel Silva <rmfrfs@gmail.com>
-  */
-=20
- #include <linux/delay.h>
-@@ -25,8 +27,8 @@
-=20
- static void isp1760_init_core(struct isp1760_device *isp)
- {
--	u32 otgctrl;
--	u32 hwmode;
-+	struct isp1760_hcd *hcd =3D &isp->hcd;
-+	struct isp1760_udc *udc =3D &isp->udc;
-=20
- 	/* Low-level chip reset */
- 	if (isp->rst_gpio) {
-@@ -39,24 +41,22 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 * Reset the host controller, including the CPU interface
- 	 * configuration.
- 	 */
--	isp1760_write32(isp->regs, HC_RESET_REG, SW_RESET_RESET_ALL);
-+	isp1760_field_set(hcd->fields, SW_RESET_RESET_ALL);
- 	msleep(100);
-=20
- 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
--	hwmode =3D HW_DATA_BUS_32BIT;
--
- 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
--		hwmode &=3D ~HW_DATA_BUS_32BIT;
-+		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
- 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
--		hwmode |=3D HW_ANA_DIGI_OC;
-+		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
- 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
--		hwmode |=3D HW_DACK_POL_HIGH;
-+		isp1760_field_set(hcd->fields, HW_DACK_POL_HIGH);
- 	if (isp->devflags & ISP1760_FLAG_DREQ_POL_HIGH)
--		hwmode |=3D HW_DREQ_POL_HIGH;
-+		isp1760_field_set(hcd->fields, HW_DREQ_POL_HIGH);
- 	if (isp->devflags & ISP1760_FLAG_INTR_POL_HIGH)
--		hwmode |=3D HW_INTR_HIGH_ACT;
-+		isp1760_field_set(hcd->fields, HW_INTR_HIGH_ACT);
- 	if (isp->devflags & ISP1760_FLAG_INTR_EDGE_TRIG)
--		hwmode |=3D HW_INTR_EDGE_TRIG;
-+		isp1760_field_set(hcd->fields, HW_INTR_EDGE_TRIG);
-=20
- 	/*
- 	 * The ISP1761 has a dedicated DC IRQ line but supports sharing the HC
-@@ -65,18 +65,10 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 * spurious interrupts during HCD registration.
- 	 */
- 	if (isp->devflags & ISP1760_FLAG_ISP1761) {
--		isp1760_write32(isp->regs, DC_MODE, 0);
--		hwmode |=3D HW_COMN_IRQ;
-+		isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
-+		isp1760_field_set(hcd->fields, HW_COMN_IRQ);
- 	}
-=20
--	/*
--	 * We have to set this first in case we're in 16-bit mode.
--	 * Write it twice to ensure correct upper bits if switching
--	 * to 16-bit mode.
--	 */
--	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
--	isp1760_write32(isp->regs, HC_HW_MODE_CTRL, hwmode);
--
- 	/*
- 	 * PORT 1 Control register of the ISP1760 is the OTG control register
- 	 * on ISP1761.
-@@ -85,14 +77,15 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 * when OTG is requested.
- 	 */
- 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
--	    (isp->devflags & ISP1760_FLAG_OTG_EN))
--		otgctrl =3D ((HW_DM_PULLDOWN | HW_DP_PULLDOWN) << 16)
--			| HW_OTG_DISABLE;
--	else
--		otgctrl =3D (HW_SW_SEL_HC_DC << 16)
--			| (HW_VBUS_DRV | HW_SEL_CP_EXT);
--
--	isp1760_write32(isp->regs, HC_PORT1_CTRL, otgctrl);
-+	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
-+		isp1760_field_set(udc->fields, HW_DM_PULLDOWN);
-+		isp1760_field_set(udc->fields, HW_DP_PULLDOWN);
-+		isp1760_field_set(udc->fields, HW_OTG_DISABLE);
-+	} else if (isp->devflags & ISP1760_FLAG_ISP1761) {
-+		isp1760_field_set(udc->fields, HW_SW_SEL_HC_DC);
-+		isp1760_field_set(udc->fields, HW_VBUS_DRV);
-+		isp1760_field_set(udc->fields, HW_SEL_CP_EXT);
-+	}
-=20
- 	dev_info(isp->dev, "bus width: %u, oc: %s\n",
- 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
-@@ -101,16 +94,43 @@ static void isp1760_init_core(struct isp1760_device=
 *isp)
-=20
- void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
- {
--	isp1760_write32(isp->regs, HW_OTG_CTRL_SET,
--			enable ? HW_DP_PULLUP : HW_DP_PULLUP << 16);
-+	struct isp1760_udc *udc =3D &isp->udc;
-+
-+	if (enable)
-+		isp1760_field_set(udc->fields, HW_DP_PULLUP);
-+	else
-+		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
- }
-=20
-+static const struct regmap_config isp1760_hc_regmap_conf =3D {
-+	.name =3D "isp1760-hc",
-+	.reg_bits =3D 16,
-+	.val_bits =3D 32,
-+	.fast_io =3D true,
-+	.max_register =3D ISP176x_HC_MEMORY,
-+	.volatile_table =3D &isp176x_hc_volatile_table,
-+};
-+
-+static const struct regmap_config isp1760_dc_regmap_conf =3D {
-+	.name =3D "isp1760-dc",
-+	.reg_bits =3D 16,
-+	.val_bits =3D 32,
-+	.fast_io =3D true,
-+	.max_register =3D ISP1761_DC_OTG_CTRL_CLEAR,
-+	.volatile_table =3D &isp176x_dc_volatile_table,
-+};
-+
- int isp1760_register(struct resource *mem, int irq, unsigned long irqfl=
ags,
- 		     struct device *dev, unsigned int devflags)
- {
- 	struct isp1760_device *isp;
-+	struct isp1760_hcd *hcd;
-+	struct isp1760_udc *udc;
- 	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
-+	struct regmap_field *f;
-+	void __iomem *base;
- 	int ret;
-+	int i;
-=20
- 	/*
- 	 * If neither the HCD not the UDC is enabled return an error, as no
-@@ -126,19 +146,47 @@ int isp1760_register(struct resource *mem, int irq=
, unsigned long irqflags,
-=20
- 	isp->dev =3D dev;
- 	isp->devflags =3D devflags;
-+	hcd =3D &isp->hcd;
-+	udc =3D &isp->udc;
-=20
- 	isp->rst_gpio =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
- 	if (IS_ERR(isp->rst_gpio))
- 		return PTR_ERR(isp->rst_gpio);
-=20
--	isp->regs =3D devm_ioremap_resource(dev, mem);
--	if (IS_ERR(isp->regs))
--		return PTR_ERR(isp->regs);
-+	hcd->base =3D devm_ioremap_resource(dev, mem);
-+	if (IS_ERR(hcd->base))
-+		return PTR_ERR(hcd->base);
-+
-+	hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf=
);
-+	if (IS_ERR(hcd->regs))
-+		return PTR_ERR(hcd->regs);
-+
-+	for (i =3D 0; i < HC_FIELD_MAX; i++) {
-+		f =3D devm_regmap_field_alloc(dev, hcd->regs,
-+					    isp1760_hc_reg_fields[i]);
-+		if (IS_ERR(f))
-+			return PTR_ERR(f);
-+
-+		hcd->fields[i] =3D f;
-+	}
-+
-+	udc->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_dc_regmap_conf=
);
-+	if (IS_ERR(udc->regs))
-+		return PTR_ERR(udc->regs);
-+
-+	for (i =3D 0; i < DC_FIELD_MAX; i++) {
-+		f =3D devm_regmap_field_alloc(dev, udc->regs,
-+					    isp1761_dc_reg_fields[i]);
-+		if (IS_ERR(f))
-+			return PTR_ERR(f);
-+
-+		udc->fields[i] =3D f;
-+	}
-=20
- 	isp1760_init_core(isp);
-=20
- 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
--		ret =3D isp1760_hcd_register(&isp->hcd, isp->regs, mem, irq,
-+		ret =3D isp1760_hcd_register(hcd, mem, irq,
- 					   irqflags | IRQF_SHARED, dev);
- 		if (ret < 0)
- 			return ret;
-@@ -147,7 +195,7 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 	if (IS_ENABLED(CONFIG_USB_ISP1761_UDC) && !udc_disabled) {
- 		ret =3D isp1760_udc_register(isp, irq, irqflags);
- 		if (ret < 0) {
--			isp1760_hcd_unregister(&isp->hcd);
-+			isp1760_hcd_unregister(hcd);
- 			return ret;
- 		}
- 	}
-diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/is=
p1760-core.h
-index 97cb4d7a3e1c..0cae69b4792c 100644
---- a/drivers/usb/isp1760/isp1760-core.h
-+++ b/drivers/usb/isp1760/isp1760-core.h
-@@ -14,6 +14,7 @@
- #define _ISP1760_CORE_H_
-=20
- #include <linux/ioport.h>
-+#include <linux/regmap.h>
-=20
- #include "isp1760-hcd.h"
- #include "isp1760-udc.h"
-@@ -38,7 +39,6 @@ struct gpio_desc;
- struct isp1760_device {
- 	struct device *dev;
-=20
--	void __iomem *regs;
- 	unsigned int devflags;
- 	struct gpio_desc *rst_gpio;
-=20
-@@ -52,14 +52,42 @@ void isp1760_unregister(struct device *dev);
-=20
- void isp1760_set_pullup(struct isp1760_device *isp, bool enable);
-=20
--static inline u32 isp1760_read32(void __iomem *base, u32 reg)
-+inline static u32 isp1760_field_read(struct regmap_field **fields, u32 =
field)
- {
--	return readl(base + reg);
-+	unsigned int val;
-+
-+	regmap_field_read(fields[field], &val);
-+
-+	return val;
-+}
-+
-+inline static void isp1760_field_write(struct regmap_field **fields, u3=
2 field,
-+				u32 val)
-+{
-+	regmap_field_write(fields[field], val);
-+}
-+
-+inline static void isp1760_field_set(struct regmap_field **fields, u32 =
field)
-+{
-+	isp1760_field_write(fields, field, 0xFFFFFFFF);
- }
-=20
--static inline void isp1760_write32(void __iomem *base, u32 reg, u32 val=
)
-+inline static void isp1760_field_clear(struct regmap_field **fields, u3=
2 field)
- {
--	writel(val, base + reg);
-+	isp1760_field_write(fields, field, 0);
- }
-=20
-+inline static u32 isp1760_reg_read(struct regmap *regs, u32 reg)
-+{
-+	unsigned int val;
-+
-+	regmap_read(regs, reg, &val);
-+
-+	return val;
-+}
-+
-+inline static void isp1760_reg_write(struct regmap *regs, u32 reg, u32 =
val)
-+{
-+	regmap_write(regs, reg, val);
-+}
- #endif
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 579a21bd70ad..76fed6e062ed 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -65,6 +65,10 @@ struct ptd {
- #define ATL_PTD_OFFSET		0x0c00
- #define PAYLOAD_OFFSET		0x1000
-=20
-+#define ISP_BANK_0		0x00
-+#define ISP_BANK_1		0x01
-+#define ISP_BANK_2		0x02
-+#define ISP_BANK_3		0x03
-=20
- /* ATL */
- /* DW0 */
-@@ -158,16 +162,59 @@ struct urb_listitem {
- };
-=20
- /*
-- * Access functions for isp176x registers (addresses 0..0x03FF).
-+ * Access functions for isp176x registers regmap fields
-  */
--static u32 reg_read32(void __iomem *base, u32 reg)
-+static u32 isp1760_hcd_read(struct usb_hcd *hcd, u32 field)
- {
--	return isp1760_read32(base, reg);
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	return isp1760_field_read(priv->fields, field);
-+}
-+
-+static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	isp1760_field_write(priv->fields, field, val);
-+}
-+
-+static void isp1760_hcd_set(struct usb_hcd *hcd, u32 field)
-+{
-+	isp1760_hcd_write(hcd, field, 0xFFFFFFFF);
-+}
-+
-+static void isp1760_hcd_clear(struct usb_hcd *hcd, u32 field)
-+{
-+	isp1760_hcd_write(hcd, field, 0);
-+}
-+
-+static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
-+					   u32 timeout_us)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	unsigned int val;
-+
-+	isp1760_hcd_set(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
-+					      timeout_us);
-+}
-+
-+static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 fiel=
d,
-+					     u32 timeout_us)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	unsigned int val;
-+
-+	isp1760_hcd_clear(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
-+					      timeout_us);
- }
-=20
--static void reg_write32(void __iomem *base, u32 reg, u32 val)
-+static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
- {
--	isp1760_write32(base, reg, val);
-+	return !!isp1760_hcd_read(hcd, field);
- }
-=20
- /*
-@@ -230,12 +277,15 @@ static void bank_reads8(void __iomem *src_base, u3=
2 src_offset, u32 bank_addr,
- 	}
- }
-=20
--static void mem_reads8(void __iomem *src_base, u32 src_offset, void *ds=
t,
--								u32 bytes)
-+static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
-+		       u32 src_offset, void *dst, u32 bytes)
- {
--	reg_write32(src_base, HC_MEMORY_REG, src_offset + ISP_BANK(0));
-+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+
- 	ndelay(90);
--	bank_reads8(src_base, src_offset, ISP_BANK(0), dst, bytes);
-+
-+	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
- }
-=20
- static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
-@@ -277,13 +327,14 @@ static void mem_writes8(void __iomem *dst_base, u3=
2 dst_offset,
-  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
-  * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
-  */
--static void ptd_read(void __iomem *base, u32 ptd_offset, u32 slot,
--								struct ptd *ptd)
-+static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
-+		     u32 ptd_offset, u32 slot, struct ptd *ptd)
- {
--	reg_write32(base, HC_MEMORY_REG,
--				ISP_BANK(0) + ptd_offset + slot*sizeof(*ptd));
-+	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
-+	isp1760_hcd_write(hcd, MEM_START_ADDR,
-+			  ptd_offset + slot * sizeof(*ptd));
- 	ndelay(90);
--	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK(0),
-+	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK_0,
- 						(void *) ptd, sizeof(*ptd));
- }
-=20
-@@ -376,37 +427,15 @@ static void free_mem(struct usb_hcd *hcd, struct i=
sp1760_qtd *qtd)
- 	qtd->payload_addr =3D 0;
- }
-=20
--static int handshake(struct usb_hcd *hcd, u32 reg,
--		      u32 mask, u32 done, int usec)
--{
--	u32 result;
--
--	do {
--		result =3D reg_read32(hcd->regs, reg);
--		if (result =3D=3D ~0)
--			return -ENODEV;
--		result &=3D mask;
--		if (result =3D=3D done)
--			return 0;
--		udelay(1);
--		usec--;
--	} while (usec > 0);
--	return -ETIMEDOUT;
--}
--
- /* reset a non-running (STS_HALT =3D=3D 1) controller */
- static int ehci_reset(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
--	u32 command =3D reg_read32(hcd->regs, HC_USBCMD);
--
--	command |=3D CMD_RESET;
--	reg_write32(hcd->regs, HC_USBCMD, command);
- 	hcd->state =3D HC_STATE_HALT;
- 	priv->next_statechange =3D jiffies;
-=20
--	return handshake(hcd, HC_USBCMD, CMD_RESET, 0, 250 * 1000);
-+	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
- }
-=20
- static struct isp1760_qh *qh_alloc(gfp_t flags)
-@@ -434,8 +463,10 @@ static void qh_free(struct isp1760_qh *qh)
- /* one-time init, only for memory state */
- static int priv_init(struct usb_hcd *hcd)
- {
--	struct isp1760_hcd		*priv =3D hcd_to_priv(hcd);
--	u32			hcc_params;
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 isoc_cache;
-+	u32 isoc_thres;
-+
- 	int i;
-=20
- 	spin_lock_init(&priv->lock);
-@@ -450,12 +481,14 @@ static int priv_init(struct usb_hcd *hcd)
- 	priv->periodic_size =3D DEFAULT_I_TDPS;
-=20
- 	/* controllers may cache some of the periodic schedule ... */
--	hcc_params =3D reg_read32(hcd->regs, HC_HCCPARAMS);
-+	isoc_cache =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_CACHE);
-+	isoc_thres =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_THRES);
-+
- 	/* full frame cache */
--	if (HCC_ISOC_CACHE(hcc_params))
-+	if (isoc_cache)
- 		priv->i_thresh =3D 8;
- 	else /* N microframes cached */
--		priv->i_thresh =3D 2 + HCC_ISOC_THRES(hcc_params);
-+		priv->i_thresh =3D 2 + isoc_thres;
-=20
- 	return 0;
- }
-@@ -464,12 +497,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	int result;
--	u32 scratch, hwmode;
-+	u32 scratch;
-+
-+	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
-=20
--	reg_write32(hcd->regs, HC_SCRATCH_REG, 0xdeadbabe);
- 	/* Change bus pattern */
--	scratch =3D reg_read32(hcd->regs, HC_CHIP_ID_REG);
--	scratch =3D reg_read32(hcd->regs, HC_SCRATCH_REG);
-+	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
-+	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
- 	if (scratch !=3D 0xdeadbabe) {
- 		dev_err(hcd->self.controller, "Scratch test failed.\n");
- 		return -ENODEV;
-@@ -483,10 +517,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	 * the host controller through the EHCI USB Command register. The devi=
ce
- 	 * has been reset in core code anyway, so this shouldn't matter.
- 	 */
--	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG, 0);
--	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
--	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
--	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, NO_TRANSFER_ACTIVE);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-+			  NO_TRANSFER_ACTIVE);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-+			  NO_TRANSFER_ACTIVE);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
-+			  NO_TRANSFER_ACTIVE);
-=20
- 	result =3D ehci_reset(hcd);
- 	if (result)
-@@ -495,14 +532,11 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	/* Step 11 passed */
-=20
- 	/* ATL reset */
--	hwmode =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL) & ~ALL_ATX_RESET;
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode | ALL_ATX_RESET);
-+	isp1760_hcd_set(hcd, ALL_ATX_RESET);
- 	mdelay(10);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, hwmode);
--
--	reg_write32(hcd->regs, HC_INTERRUPT_ENABLE, INTERRUPT_ENABLE_MASK);
-+	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
-=20
--	priv->hcs_params =3D reg_read32(hcd->regs, HC_HCSPARAMS);
-+	isp1760_hcd_set(hcd, HC_INT_ENABLE);
-=20
- 	return priv_init(hcd);
- }
-@@ -732,12 +766,12 @@ static void start_bus_transfer(struct usb_hcd *hcd=
, u32 ptd_offset, int slot,
-=20
- 	/* Make sure done map has not triggered from some unlinked transfer */
- 	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		priv->atl_done_map |=3D reg_read32(hcd->regs,
--						HC_ATL_PTD_DONEMAP_REG);
-+		priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
-+						ISP176x_HC_ATL_PTD_DONEMAP);
- 		priv->atl_done_map &=3D ~(1 << slot);
- 	} else {
--		priv->int_done_map |=3D reg_read32(hcd->regs,
--						HC_INT_PTD_DONEMAP_REG);
-+		priv->int_done_map |=3D isp1760_reg_read(priv->regs,
-+					       ISP176x_HC_INT_PTD_DONEMAP);
- 		priv->int_done_map &=3D ~(1 << slot);
- 	}
-=20
-@@ -746,16 +780,20 @@ static void start_bus_transfer(struct usb_hcd *hcd=
, u32 ptd_offset, int slot,
- 	slots[slot].timestamp =3D jiffies;
- 	slots[slot].qtd =3D qtd;
- 	slots[slot].qh =3D qh;
--	ptd_write(hcd->regs, ptd_offset, slot, ptd);
-+	ptd_write(priv->base, ptd_offset, slot, ptd);
-=20
- 	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_ATL_PTD_SKIPMAP);
- 		skip_map &=3D ~(1 << qh->slot);
--		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-+				  skip_map);
- 	} else {
--		skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_INT_PTD_SKIPMAP);
- 		skip_map &=3D ~(1 << qh->slot);
--		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-+				  skip_map);
- 	}
- }
-=20
-@@ -768,9 +806,10 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
- static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
- 						struct list_head *urb_list)
- {
--	int last_qtd;
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	struct isp1760_qtd *qtd, *qtd_next;
- 	struct urb_listitem *urb_listitem;
-+	int last_qtd;
-=20
- 	list_for_each_entry_safe(qtd, qtd_next, &qh->qtd_list, qtd_list) {
- 		if (qtd->status < QTD_XFER_COMPLETE)
-@@ -785,9 +824,10 @@ static void collect_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh,
- 			if (qtd->actual_length) {
- 				switch (qtd->packet_type) {
- 				case IN_PID:
--					mem_reads8(hcd->regs, qtd->payload_addr,
--							qtd->data_buffer,
--							qtd->actual_length);
-+					mem_reads8(hcd, priv->base,
-+						   qtd->payload_addr,
-+						   qtd->data_buffer,
-+						   qtd->actual_length);
- 					/* Fall through */
- 				case OUT_PID:
- 					qtd->urb->actual_length +=3D
-@@ -875,7 +915,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struct=
 isp1760_qh *qh)
- 			if ((qtd->length) &&
- 			    ((qtd->packet_type =3D=3D SETUP_PID) ||
- 			     (qtd->packet_type =3D=3D OUT_PID))) {
--				mem_writes8(hcd->regs, qtd->payload_addr,
-+				mem_writes8(priv->base, qtd->payload_addr,
- 						qtd->data_buffer, qtd->length);
- 			}
-=20
-@@ -1076,9 +1116,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 	int modified;
- 	int skip_map;
-=20
--	skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
-+	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
- 	priv->int_done_map &=3D ~skip_map;
--	skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
-+	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
- 	priv->atl_done_map &=3D ~skip_map;
-=20
- 	modified =3D priv->int_done_map || priv->atl_done_map;
-@@ -1096,7 +1136,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D INT_PTD_OFFSET;
--			ptd_read(hcd->regs, INT_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
- 			state =3D check_int_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		} else {
-@@ -1111,7 +1151,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D ATL_PTD_OFFSET;
--			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
- 			state =3D check_atl_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		}
-@@ -1212,13 +1252,15 @@ static irqreturn_t isp1760_irq(struct usb_hcd *h=
cd)
- 	if (!(hcd->state & HC_STATE_RUNNING))
- 		goto leave;
-=20
--	imask =3D reg_read32(hcd->regs, HC_INTERRUPT_REG);
-+	imask =3D isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
- 	if (unlikely(!imask))
- 		goto leave;
--	reg_write32(hcd->regs, HC_INTERRUPT_REG, imask); /* Clear */
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear *=
/
-=20
--	priv->int_done_map |=3D reg_read32(hcd->regs, HC_INT_PTD_DONEMAP_REG);
--	priv->atl_done_map |=3D reg_read32(hcd->regs, HC_ATL_PTD_DONEMAP_REG);
-+	priv->int_done_map |=3D isp1760_reg_read(priv->regs,
-+					       ISP176x_HC_INT_PTD_DONEMAP);
-+	priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
-+					       ISP176x_HC_ATL_PTD_DONEMAP);
-=20
- 	handle_done_ptds(hcd);
-=20
-@@ -1273,7 +1315,7 @@ static void errata2_function(struct timer_list *un=
used)
- 		if (priv->atl_slots[slot].qh && time_after(jiffies,
- 					priv->atl_slots[slot].timestamp +
- 					msecs_to_jiffies(SLOT_TIMEOUT))) {
--			ptd_read(hcd->regs, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
- 			if (!FROM_DW0_VALID(ptd.dw0) &&
- 					!FROM_DW3_ACTIVE(ptd.dw3))
- 				priv->atl_done_map |=3D 1 << slot;
-@@ -1290,9 +1332,8 @@ static void errata2_function(struct timer_list *un=
used)
-=20
- static int isp1760_run(struct usb_hcd *hcd)
- {
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	int retval;
--	u32 temp;
--	u32 command;
- 	u32 chipid;
-=20
- 	hcd->uses_new_polling =3D 1;
-@@ -1300,23 +1341,20 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	hcd->state =3D HC_STATE_RUNNING;
-=20
- 	/* Set PTD interrupt AND & OR maps */
--	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_AND_REG, 0);
--	reg_write32(hcd->regs, HC_ATL_IRQ_MASK_OR_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_INT_IRQ_MASK_AND_REG, 0);
--	reg_write32(hcd->regs, HC_INT_IRQ_MASK_OR_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_AND_REG, 0);
--	reg_write32(hcd->regs, HC_ISO_IRQ_MASK_OR_REG, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
- 	/* step 23 passed */
-=20
--	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp | HW_GLOBAL_INTR_EN);
-+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-=20
--	command =3D reg_read32(hcd->regs, HC_USBCMD);
--	command &=3D ~(CMD_LRESET|CMD_RESET);
--	command |=3D CMD_RUN;
--	reg_write32(hcd->regs, HC_USBCMD, command);
-+	isp1760_hcd_clear(hcd, CMD_LRESET);
-+	isp1760_hcd_clear(hcd, CMD_RESET);
-=20
--	retval =3D handshake(hcd, HC_USBCMD, CMD_RUN, CMD_RUN, 250 * 1000);
-+	retval =3D isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
- 	if (retval)
- 		return retval;
-=20
-@@ -1326,9 +1364,8 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	 * the semaphore while doing so.
- 	 */
- 	down_write(&ehci_cf_port_reset_rwsem);
--	reg_write32(hcd->regs, HC_CONFIGFLAG, FLAG_CF);
-=20
--	retval =3D handshake(hcd, HC_CONFIGFLAG, FLAG_CF, FLAG_CF, 250 * 1000)=
;
-+	retval =3D isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
- 	up_write(&ehci_cf_port_reset_rwsem);
- 	if (retval)
- 		return retval;
-@@ -1338,21 +1375,22 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	errata2_timer.expires =3D jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD=
);
- 	add_timer(&errata2_timer);
-=20
--	chipid =3D reg_read32(hcd->regs, HC_CHIP_ID_REG);
-+	chipid =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
- 	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
- 					chipid & 0xffff, chipid >> 16);
-=20
- 	/* PTD Register Init Part 2, Step 28 */
-=20
- 	/* Setup registers controlling PTD checking */
--	reg_write32(hcd->regs, HC_ATL_PTD_LASTPTD_REG, 0x80000000);
--	reg_write32(hcd->regs, HC_INT_PTD_LASTPTD_REG, 0x80000000);
--	reg_write32(hcd->regs, HC_ISO_PTD_LASTPTD_REG, 0x00000001);
--	reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_ISO_PTD_SKIPMAP_REG, 0xffffffff);
--	reg_write32(hcd->regs, HC_BUFFER_STATUS_REG,
--						ATL_BUF_FILL | INT_BUF_FILL);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
-+	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
-+
-+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
-+	isp1760_hcd_set(hcd, INT_BUF_FILL);
-=20
- 	/* GRR this is run-once init(), being done every time the HC starts.
- 	 * So long as they're part of class devices, we can't do it init()
-@@ -1586,15 +1624,19 @@ static void kill_transfer(struct usb_hcd *hcd, s=
truct urb *urb,
- 	/* We need to forcefully reclaim the slot since some transfers never
- 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
- 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
--		skip_map =3D reg_read32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_ATL_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		reg_write32(hcd->regs, HC_ATL_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
-+				  skip_map);
- 		priv->atl_slots[qh->slot].qh =3D NULL;
- 		priv->atl_slots[qh->slot].qtd =3D NULL;
- 	} else {
--		skip_map =3D reg_read32(hcd->regs, HC_INT_PTD_SKIPMAP_REG);
-+		skip_map =3D isp1760_reg_read(priv->regs,
-+					    ISP176x_HC_INT_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		reg_write32(hcd->regs, HC_INT_PTD_SKIPMAP_REG, skip_map);
-+		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
-+				  skip_map);
- 		priv->int_slots[qh->slot].qh =3D NULL;
- 		priv->int_slots[qh->slot].qtd =3D NULL;
- 	}
-@@ -1707,8 +1749,7 @@ static void isp1760_endpoint_disable(struct usb_hc=
d *hcd,
- static int isp1760_hub_status_data(struct usb_hcd *hcd, char *buf)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	u32 temp, status =3D 0;
--	u32 mask;
-+	u32 status =3D 0;
- 	int retval =3D 1;
- 	unsigned long flags;
-=20
-@@ -1718,17 +1759,13 @@ static int isp1760_hub_status_data(struct usb_hc=
d *hcd, char *buf)
-=20
- 	/* init status to no-changes */
- 	buf[0] =3D 0;
--	mask =3D PORT_CSC;
-=20
- 	spin_lock_irqsave(&priv->lock, flags);
--	temp =3D reg_read32(hcd->regs, HC_PORTSC1);
-=20
--	if (temp & PORT_OWNER) {
--		if (temp & PORT_CSC) {
--			temp &=3D ~PORT_CSC;
--			reg_write32(hcd->regs, HC_PORTSC1, temp);
--			goto done;
--		}
-+	if (isp1760_hcd_is_set(hcd, PORT_OWNER) &&
-+	    isp1760_hcd_is_set(hcd, PORT_CSC)) {
-+		isp1760_hcd_clear(hcd, PORT_CSC);
-+		goto done;
- 	}
-=20
- 	/*
-@@ -1737,11 +1774,9 @@ static int isp1760_hub_status_data(struct usb_hcd=
 *hcd, char *buf)
- 	 * high-speed device is switched over to the companion
- 	 * controller by the user.
- 	 */
--
--	if ((temp & mask) !=3D 0
--			|| ((temp & PORT_RESUME) !=3D 0
--				&& time_after_eq(jiffies,
--					priv->reset_done))) {
-+	if (isp1760_hcd_is_set(hcd, PORT_CSC) ||
-+	     (isp1760_hcd_is_set(hcd, PORT_RESUME) &&
-+	      time_after_eq(jiffies, priv->reset_done))) {
- 		buf [0] |=3D 1 << (0 + 1);
- 		status =3D STS_PCD;
- 	}
-@@ -1754,9 +1789,11 @@ static int isp1760_hub_status_data(struct usb_hcd=
 *hcd, char *buf)
- static void isp1760_hub_descriptor(struct isp1760_hcd *priv,
- 		struct usb_hub_descriptor *desc)
- {
--	int ports =3D HCS_N_PORTS(priv->hcs_params);
-+	int ports;
- 	u16 temp;
-=20
-+	ports =3D isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
-+
- 	desc->bDescriptorType =3D USB_DT_HUB;
- 	/* priv 1.0, 2.3.9 says 20ms max */
- 	desc->bPwrOn2PwrGood =3D 10;
-@@ -1772,7 +1809,7 @@ static void isp1760_hub_descriptor(struct isp1760_=
hcd *priv,
-=20
- 	/* per-port overcurrent reporting */
- 	temp =3D HUB_CHAR_INDV_PORT_OCPM;
--	if (HCS_PPC(priv->hcs_params))
-+	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
- 		/* per-port power control */
- 		temp |=3D HUB_CHAR_INDV_PORT_LPSM;
- 	else
-@@ -1783,38 +1820,37 @@ static void isp1760_hub_descriptor(struct isp176=
0_hcd *priv,
-=20
- #define	PORT_WAKE_BITS	(PORT_WKOC_E|PORT_WKDISC_E|PORT_WKCONN_E)
-=20
--static int check_reset_complete(struct usb_hcd *hcd, int index,
--		int port_status)
-+static void check_reset_complete(struct usb_hcd *hcd, int index)
- {
--	if (!(port_status & PORT_CONNECT))
--		return port_status;
-+	if (!(isp1760_hcd_is_set(hcd, PORT_CONNECT)))
-+		return;
-=20
- 	/* if reset finished and it's still not enabled -- handoff */
--	if (!(port_status & PORT_PE)) {
--
-+	if (!isp1760_hcd_is_set(hcd, PORT_PE)) {
- 		dev_info(hcd->self.controller,
- 					"port %d full speed --> companion\n",
- 					index + 1);
-=20
--		port_status |=3D PORT_OWNER;
--		port_status &=3D ~PORT_RWC_BITS;
--		reg_write32(hcd->regs, HC_PORTSC1, port_status);
-+		isp1760_hcd_set(hcd, PORT_OWNER);
-=20
-+		isp1760_hcd_clear(hcd, PORT_CSC);
- 	} else
- 		dev_info(hcd->self.controller, "port %d high speed\n",
- 								index + 1);
-=20
--	return port_status;
-+	return;
- }
-=20
- static int isp1760_hub_control(struct usb_hcd *hcd, u16 typeReq,
- 		u16 wValue, u16 wIndex, char *buf, u16 wLength)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	int ports =3D HCS_N_PORTS(priv->hcs_params);
--	u32 temp, status;
-+	u32 status;
- 	unsigned long flags;
- 	int retval =3D 0;
-+	int ports;
-+
-+	ports =3D isp1760_hcd_read(hcd, HCS_N_PORTS);
-=20
- 	/*
- 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
-@@ -1839,7 +1875,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		if (!wIndex || wIndex > ports)
- 			goto error;
- 		wIndex--;
--		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
-=20
- 		/*
- 		 * Even if OWNER is set, so the port is owned by the
-@@ -1850,22 +1885,22 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
-=20
- 		switch (wValue) {
- 		case USB_PORT_FEAT_ENABLE:
--			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_PE);
-+			isp1760_hcd_clear(hcd, PORT_PE);
- 			break;
- 		case USB_PORT_FEAT_C_ENABLE:
- 			/* XXX error? */
- 			break;
- 		case USB_PORT_FEAT_SUSPEND:
--			if (temp & PORT_RESET)
-+			if (isp1760_hcd_is_set(hcd, PORT_RESET))
- 				goto error;
-=20
--			if (temp & PORT_SUSPEND) {
--				if ((temp & PORT_PE) =3D=3D 0)
-+			if (isp1760_hcd_is_set(hcd, PORT_SUSPEND)) {
-+				if (!isp1760_hcd_is_set(hcd, PORT_PE))
- 					goto error;
- 				/* resume signaling for 20 msec */
--				temp &=3D ~(PORT_RWC_BITS);
--				reg_write32(hcd->regs, HC_PORTSC1,
--							temp | PORT_RESUME);
-+				isp1760_hcd_clear(hcd, PORT_CSC);
-+				isp1760_hcd_set(hcd, PORT_RESUME);
-+
- 				priv->reset_done =3D jiffies +
- 					msecs_to_jiffies(USB_RESUME_TIMEOUT);
- 			}
-@@ -1874,12 +1909,11 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 			/* we auto-clear this feature */
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (HCS_PPC(priv->hcs_params))
--				reg_write32(hcd->regs, HC_PORTSC1,
--							temp & ~PORT_POWER);
-+			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+				isp1760_hcd_clear(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_C_CONNECTION:
--			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_CSC);
-+			isp1760_hcd_set(hcd, PORT_CSC);
- 			break;
- 		case USB_PORT_FEAT_C_OVER_CURRENT:
- 			/* XXX error ?*/
-@@ -1890,7 +1924,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		default:
- 			goto error;
- 		}
--		reg_read32(hcd->regs, HC_USBCMD);
-+		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
- 		break;
- 	case GetHubDescriptor:
- 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
-@@ -1905,15 +1939,14 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 			goto error;
- 		wIndex--;
- 		status =3D 0;
--		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
-=20
- 		/* wPortChange bits */
--		if (temp & PORT_CSC)
-+		if (isp1760_hcd_is_set(hcd, PORT_CSC))
- 			status |=3D USB_PORT_STAT_C_CONNECTION << 16;
-=20
-=20
- 		/* whoever resumes must GetPortStatus to complete it!! */
--		if (temp & PORT_RESUME) {
-+		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
- 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
-=20
- 			/* Remote Wakeup received? */
-@@ -1932,35 +1965,32 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 				priv->reset_done =3D 0;
-=20
- 				/* stop resume signaling */
--				temp =3D reg_read32(hcd->regs, HC_PORTSC1);
--				reg_write32(hcd->regs, HC_PORTSC1,
--					temp & ~(PORT_RWC_BITS | PORT_RESUME));
--				retval =3D handshake(hcd, HC_PORTSC1,
--					   PORT_RESUME, 0, 2000 /* 2msec */);
-+				isp1760_hcd_clear(hcd, PORT_CSC);
-+
-+				retval =3D isp1760_hcd_clear_poll_timeout(hcd,
-+							  PORT_RESUME, 2000);
- 				if (retval !=3D 0) {
- 					dev_err(hcd->self.controller,
- 						"port %d resume error %d\n",
- 						wIndex + 1, retval);
- 					goto error;
- 				}
--				temp &=3D ~(PORT_SUSPEND|PORT_RESUME|(3<<10));
- 			}
- 		}
-=20
- 		/* whoever resets must GetPortStatus to complete it!! */
--		if ((temp & PORT_RESET)
--				&& time_after_eq(jiffies,
--					priv->reset_done)) {
-+		if (isp1760_hcd_is_set(hcd, PORT_RESET)
-+		    && time_after_eq(jiffies, priv->reset_done)) {
- 			status |=3D USB_PORT_STAT_C_RESET << 16;
- 			priv->reset_done =3D 0;
-=20
- 			/* force reset to complete */
--			reg_write32(hcd->regs, HC_PORTSC1, temp & ~PORT_RESET);
- 			/* REVISIT:  some hardware needs 550+ usec to clear
- 			 * this bit; seems too long to spin routinely...
- 			 */
--			retval =3D handshake(hcd, HC_PORTSC1,
--					PORT_RESET, 0, 750);
-+			retval =3D isp1760_hcd_clear_poll_timeout(hcd,
-+								  PORT_RESET,
-+								  750);
- 			if (retval !=3D 0) {
- 				dev_err(hcd->self.controller, "port %d reset error %d\n",
- 						wIndex + 1, retval);
-@@ -1968,8 +1998,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			}
-=20
- 			/* see what we found out */
--			temp =3D check_reset_complete(hcd, wIndex,
--					reg_read32(hcd->regs, HC_PORTSC1));
-+			check_reset_complete(hcd, wIndex);
- 		}
- 		/*
- 		 * Even if OWNER is set, there's no harm letting hub_wq
-@@ -1977,21 +2006,22 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 		 * for PORT_POWER anyway).
- 		 */
-=20
--		if (temp & PORT_OWNER)
-+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
- 			dev_err(hcd->self.controller, "PORT_OWNER is set\n");
-=20
--		if (temp & PORT_CONNECT) {
-+		if (isp1760_hcd_is_set(hcd, PORT_CONNECT)) {
- 			status |=3D USB_PORT_STAT_CONNECTION;
- 			/* status may be from integrated TT */
- 			status |=3D USB_PORT_STAT_HIGH_SPEED;
- 		}
--		if (temp & PORT_PE)
-+		if (isp1760_hcd_is_set(hcd, PORT_PE))
- 			status |=3D USB_PORT_STAT_ENABLE;
--		if (temp & (PORT_SUSPEND|PORT_RESUME))
-+		if (isp1760_hcd_is_set(hcd, PORT_SUSPEND) &&
-+		    isp1760_hcd_is_set(hcd, PORT_RESUME))
- 			status |=3D USB_PORT_STAT_SUSPEND;
--		if (temp & PORT_RESET)
-+		if (isp1760_hcd_is_set(hcd, PORT_RESET))
- 			status |=3D USB_PORT_STAT_RESET;
--		if (temp & PORT_POWER)
-+		if (isp1760_hcd_is_set(hcd, PORT_POWER))
- 			status |=3D USB_PORT_STAT_POWER;
-=20
- 		put_unaligned(cpu_to_le32(status), (__le32 *) buf);
-@@ -2011,41 +2041,39 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 		if (!wIndex || wIndex > ports)
- 			goto error;
- 		wIndex--;
--		temp =3D reg_read32(hcd->regs, HC_PORTSC1);
--		if (temp & PORT_OWNER)
-+		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
- 			break;
-=20
--/*		temp &=3D ~PORT_RWC_BITS; */
- 		switch (wValue) {
- 		case USB_PORT_FEAT_ENABLE:
--			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_PE);
-+			isp1760_hcd_set(hcd, PORT_PE);
- 			break;
-=20
- 		case USB_PORT_FEAT_SUSPEND:
--			if ((temp & PORT_PE) =3D=3D 0
--					|| (temp & PORT_RESET) !=3D 0)
-+			if (!isp1760_hcd_is_set(hcd, PORT_PE)
-+			    || isp1760_hcd_is_set(hcd, PORT_RESET))
- 				goto error;
-=20
--			reg_write32(hcd->regs, HC_PORTSC1, temp | PORT_SUSPEND);
-+			isp1760_hcd_set(hcd, PORT_SUSPEND);
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (HCS_PPC(priv->hcs_params))
--				reg_write32(hcd->regs, HC_PORTSC1,
--							temp | PORT_POWER);
-+			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+				isp1760_hcd_set(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_RESET:
--			if (temp & PORT_RESUME)
-+			if (isp1760_hcd_is_set(hcd, PORT_RESUME))
- 				goto error;
- 			/* line status bits may report this as low speed,
- 			 * which can be fine if this root hub has a
- 			 * transaction translator built in.
- 			 */
--			if ((temp & (PORT_PE|PORT_CONNECT)) =3D=3D PORT_CONNECT
--					&& PORT_USB11(temp)) {
--				temp |=3D PORT_OWNER;
-+			if ((isp1760_hcd_is_set(hcd, PORT_CONNECT) &&
-+			     !isp1760_hcd_is_set(hcd, PORT_PE)) &&
-+			    (isp1760_hcd_read(hcd, PORT_LSTATUS) =3D=3D 1)) {
-+				isp1760_hcd_set(hcd, PORT_OWNER);
- 			} else {
--				temp |=3D PORT_RESET;
--				temp &=3D ~PORT_PE;
-+				isp1760_hcd_set(hcd, PORT_RESET);
-+				isp1760_hcd_clear(hcd, PORT_PE);
-=20
- 				/*
- 				 * caller must wait, then call GetPortStatus
-@@ -2054,12 +2082,11 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 				priv->reset_done =3D jiffies +
- 					msecs_to_jiffies(50);
- 			}
--			reg_write32(hcd->regs, HC_PORTSC1, temp);
- 			break;
- 		default:
- 			goto error;
- 		}
--		reg_read32(hcd->regs, HC_USBCMD);
-+		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
- 		break;
-=20
- 	default:
-@@ -2076,14 +2103,13 @@ static int isp1760_get_frame(struct usb_hcd *hcd=
)
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	u32 fr;
-=20
--	fr =3D reg_read32(hcd->regs, HC_FRINDEX);
-+	fr =3D isp1760_hcd_read(hcd, HC_FRINDEX);
- 	return (fr >> 3) % priv->periodic_size;
- }
-=20
- static void isp1760_stop(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	u32 temp;
-=20
- 	del_timer(&errata2_timer);
-=20
-@@ -2094,24 +2120,19 @@ static void isp1760_stop(struct usb_hcd *hcd)
- 	spin_lock_irq(&priv->lock);
- 	ehci_reset(hcd);
- 	/* Disable IRQ */
--	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INTR_EN);
-+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
- 	spin_unlock_irq(&priv->lock);
-=20
--	reg_write32(hcd->regs, HC_CONFIGFLAG, 0);
-+	isp1760_hcd_clear(hcd, FLAG_CF);
- }
-=20
- static void isp1760_shutdown(struct usb_hcd *hcd)
- {
--	u32 command, temp;
--
- 	isp1760_stop(hcd);
--	temp =3D reg_read32(hcd->regs, HC_HW_MODE_CTRL);
--	reg_write32(hcd->regs, HC_HW_MODE_CTRL, temp &=3D ~HW_GLOBAL_INTR_EN);
-=20
--	command =3D reg_read32(hcd->regs, HC_USBCMD);
--	command &=3D ~CMD_RUN;
--	reg_write32(hcd->regs, HC_USBCMD, command);
-+	isp1760_hcd_clear(hcd, HW_GLOBAL_INTR_EN);
-+
-+	isp1760_hcd_clear(hcd, CMD_RUN);
- }
-=20
- static void isp1760_clear_tt_buffer_complete(struct usb_hcd *hcd,
-@@ -2184,8 +2205,8 @@ void isp1760_deinit_kmem_cache(void)
- 	kmem_cache_destroy(urb_listitem_cachep);
- }
-=20
--int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
--			 struct resource *mem, int irq, unsigned long irqflags,
-+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem=
,
-+			 int irq, unsigned long irqflags,
- 			 struct device *dev)
- {
- 	struct usb_hcd *hcd;
-@@ -2202,7 +2223,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv,=
 void __iomem *regs,
- 	init_memory(priv);
-=20
- 	hcd->irq =3D irq;
--	hcd->regs =3D regs;
- 	hcd->rsrc_start =3D mem->start;
- 	hcd->rsrc_len =3D resource_size(mem);
-=20
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-index f1bb2deb1ccf..7a1f4f2607be 100644
---- a/drivers/usb/isp1760/isp1760-hcd.h
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -3,6 +3,9 @@
- #define _ISP1760_HCD_H_
-=20
- #include <linux/spinlock.h>
-+#include <linux/regmap.h>
-+
-+#include "isp1760-regs.h"
-=20
- struct isp1760_qh;
- struct isp1760_qtd;
-@@ -51,7 +54,11 @@ struct isp1760_hcd {
- #ifdef CONFIG_USB_ISP1760_HCD
- 	struct usb_hcd		*hcd;
-=20
--	u32 hcs_params;
-+	void __iomem		*base;
-+
-+	struct regmap		*regs;
-+	struct regmap_field	*fields[HC_FIELD_MAX];
-+
- 	spinlock_t		lock;
- 	struct isp1760_slotinfo	atl_slots[32];
- 	int			atl_done_map;
-@@ -70,16 +77,15 @@ struct isp1760_hcd {
- };
-=20
- #ifdef CONFIG_USB_ISP1760_HCD
--int isp1760_hcd_register(struct isp1760_hcd *priv, void __iomem *regs,
--			 struct resource *mem, int irq, unsigned long irqflags,
--			 struct device *dev);
-+int isp1760_hcd_register(struct isp1760_hcd *priv, struct resource *mem=
,
-+			 int irq, unsigned long irqflags, struct device *dev);
- void isp1760_hcd_unregister(struct isp1760_hcd *priv);
-=20
- int isp1760_init_kmem_once(void);
- void isp1760_deinit_kmem_cache(void);
- #else
- static inline int isp1760_hcd_register(struct isp1760_hcd *priv,
--				       void __iomem *regs, struct resource *mem,
-+				       struct resource *mem,
- 				       int irq, unsigned long irqflags,
- 				       struct device *dev)
- {
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-index ccd30f835888..abfba9f5ec23 100644
---- a/drivers/usb/isp1760/isp1760-if.c
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -75,9 +75,9 @@ static int isp1761_pci_init(struct pci_dev *dev)
- 		/*by default host is in 16bit mode, so
- 		 * io operations at this stage must be 16 bit
- 		 * */
--		writel(0xface, iobase + HC_SCRATCH_REG);
-+		writel(0xface, iobase + ISP176x_HC_SCRATCH);
- 		udelay(100);
--		reg_data =3D readl(iobase + HC_SCRATCH_REG) & 0x0000ffff;
-+		reg_data =3D readl(iobase + ISP176x_HC_SCRATCH) & 0x0000ffff;
- 		retry_count--;
- 	}
-=20
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-index 1f00c3850cf7..4e835e9665bd 100644
---- a/drivers/usb/isp1760/isp1760-regs.h
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -10,218 +10,287 @@
-  *     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
-  */
-=20
--#ifndef _ISP1760_REGS_H_
--#define _ISP1760_REGS_H_
-+#ifndef _ISP176x_REGS_H_
-+#define _ISP176x_REGS_H_
-+
-+#include <linux/regmap.h>
-=20
- /* --------------------------------------------------------------------=
---------
-  * Host Controller
-  */
-=20
- /* EHCI capability registers */
--#define HC_CAPLENGTH		0x000
--#define HC_LENGTH(p)		(((p) >> 00) & 0x00ff)	/* bits 7:0 */
--#define HC_VERSION(p)		(((p) >> 16) & 0xffff)	/* bits 31:16 */
--
--#define HC_HCSPARAMS		0x004
--#define HCS_INDICATOR(p)	((p) & (1 << 16))	/* true: has port indicators=
 */
--#define HCS_PPC(p)		((p) & (1 << 4))	/* true: port power control */
--#define HCS_N_PORTS(p)		(((p) >> 0) & 0xf)	/* bits 3:0, ports on HC */
--
--#define HC_HCCPARAMS		0x008
--#define HCC_ISOC_CACHE(p)       ((p) & (1 << 7))	/* true: can cache iso=
c frame */
--#define HCC_ISOC_THRES(p)       (((p) >> 4) & 0x7)	/* bits 6:4, uframes=
 cached */
-+#define ISP176x_HC_CAPLENGTH		0x000
-+#define ISP176x_HC_VERSION		0x002
-+#define ISP176x_HC_HCSPARAMS		0x004
-+#define ISP176x_HC_HCCPARAMS		0x008
-=20
- /* EHCI operational registers */
--#define HC_USBCMD		0x020
--#define CMD_LRESET		(1 << 7)		/* partial reset (no ports, etc) */
--#define CMD_RESET		(1 << 1)		/* reset HC not bus */
--#define CMD_RUN			(1 << 0)		/* start/stop HC */
--
--#define HC_USBSTS		0x024
--#define STS_PCD			(1 << 2)		/* port change detect */
--
--#define HC_FRINDEX		0x02c
--
--#define HC_CONFIGFLAG		0x060
--#define FLAG_CF			(1 << 0)		/* true: we'll support "high speed" */
--
--#define HC_PORTSC1		0x064
--#define PORT_OWNER		(1 << 13)		/* true: companion hc owns this port */
--#define PORT_POWER		(1 << 12)		/* true: has power (see PPC) */
--#define PORT_USB11(x)		(((x) & (3 << 10)) =3D=3D (1 << 10))	/* USB 1.1 =
device */
--#define PORT_RESET		(1 << 8)		/* reset port */
--#define PORT_SUSPEND		(1 << 7)		/* suspend port */
--#define PORT_RESUME		(1 << 6)		/* resume it */
--#define PORT_PE			(1 << 2)		/* port enable */
--#define PORT_CSC		(1 << 1)		/* connect status change */
--#define PORT_CONNECT		(1 << 0)		/* device connected */
--#define PORT_RWC_BITS		(PORT_CSC)
--
--#define HC_ISO_PTD_DONEMAP_REG	0x130
--#define HC_ISO_PTD_SKIPMAP_REG	0x134
--#define HC_ISO_PTD_LASTPTD_REG	0x138
--#define HC_INT_PTD_DONEMAP_REG	0x140
--#define HC_INT_PTD_SKIPMAP_REG	0x144
--#define HC_INT_PTD_LASTPTD_REG	0x148
--#define HC_ATL_PTD_DONEMAP_REG	0x150
--#define HC_ATL_PTD_SKIPMAP_REG	0x154
--#define HC_ATL_PTD_LASTPTD_REG	0x158
-+#define ISP176x_HC_USBCMD		0x020
-+#define ISP176x_HC_USBSTS		0x024
-+#define ISP176x_HC_FRINDEX		0x02c
-+
-+#define ISP176x_HC_CONFIGFLAG		0x060
-+#define ISP176x_HC_PORTSC1		0x064
-+
-+#define ISP176x_HC_ISO_PTD_DONEMAP	0x130
-+#define ISP176x_HC_ISO_PTD_SKIPMAP	0x134
-+#define ISP176x_HC_ISO_PTD_LASTPTD	0x138
-+#define ISP176x_HC_INT_PTD_DONEMAP	0x140
-+#define ISP176x_HC_INT_PTD_SKIPMAP	0x144
-+#define ISP176x_HC_INT_PTD_LASTPTD	0x148
-+#define ISP176x_HC_ATL_PTD_DONEMAP	0x150
-+#define ISP176x_HC_ATL_PTD_SKIPMAP	0x154
-+#define ISP176x_HC_ATL_PTD_LASTPTD	0x158
-=20
- /* Configuration Register */
--#define HC_HW_MODE_CTRL		0x300
--#define ALL_ATX_RESET		(1 << 31)
--#define HW_ANA_DIGI_OC		(1 << 15)
--#define HW_DEV_DMA		(1 << 11)
--#define HW_COMN_IRQ		(1 << 10)
--#define HW_COMN_DMA		(1 << 9)
--#define HW_DATA_BUS_32BIT	(1 << 8)
--#define HW_DACK_POL_HIGH	(1 << 6)
--#define HW_DREQ_POL_HIGH	(1 << 5)
--#define HW_INTR_HIGH_ACT	(1 << 2)
--#define HW_INTR_EDGE_TRIG	(1 << 1)
--#define HW_GLOBAL_INTR_EN	(1 << 0)
--
--#define HC_CHIP_ID_REG		0x304
--#define HC_SCRATCH_REG		0x308
--
--#define HC_RESET_REG		0x30c
--#define SW_RESET_RESET_HC	(1 << 1)
--#define SW_RESET_RESET_ALL	(1 << 0)
--
--#define HC_BUFFER_STATUS_REG	0x334
--#define ISO_BUF_FILL		(1 << 2)
--#define INT_BUF_FILL		(1 << 1)
--#define ATL_BUF_FILL		(1 << 0)
--
--#define HC_MEMORY_REG		0x33c
--#define ISP_BANK(x)		((x) << 16)
--
--#define HC_PORT1_CTRL		0x374
--#define PORT1_POWER		(3 << 3)
--#define PORT1_INIT1		(1 << 7)
--#define PORT1_INIT2		(1 << 23)
--#define HW_OTG_CTRL_SET		0x374
--#define HW_OTG_CTRL_CLR		0x376
--#define HW_OTG_DISABLE		(1 << 10)
--#define HW_OTG_SE0_EN		(1 << 9)
--#define HW_BDIS_ACON_EN		(1 << 8)
--#define HW_SW_SEL_HC_DC		(1 << 7)
--#define HW_VBUS_CHRG		(1 << 6)
--#define HW_VBUS_DISCHRG		(1 << 5)
--#define HW_VBUS_DRV		(1 << 4)
--#define HW_SEL_CP_EXT		(1 << 3)
--#define HW_DM_PULLDOWN		(1 << 2)
--#define HW_DP_PULLDOWN		(1 << 1)
--#define HW_DP_PULLUP		(1 << 0)
-+#define ISP176x_HC_HW_MODE_CTRL		0x300
-+#define ISP176x_HC_CHIP_ID		0x304
-+#define ISP176x_HC_SCRATCH		0x308
-+#define ISP176x_HC_RESET		0x30c
-+#define ISP176x_HC_BUFFER_STATUS	0x334
-+#define ISP176x_HC_MEMORY		0x33c
-=20
- /* Interrupt Register */
--#define HC_INTERRUPT_REG	0x310
--
--#define HC_INTERRUPT_ENABLE	0x314
--#define HC_ISO_INT		(1 << 9)
--#define HC_ATL_INT		(1 << 8)
--#define HC_INTL_INT		(1 << 7)
--#define HC_EOT_INT		(1 << 3)
--#define HC_SOT_INT		(1 << 1)
--#define INTERRUPT_ENABLE_MASK	(HC_INTL_INT | HC_ATL_INT)
--
--#define HC_ISO_IRQ_MASK_OR_REG	0x318
--#define HC_INT_IRQ_MASK_OR_REG	0x31c
--#define HC_ATL_IRQ_MASK_OR_REG	0x320
--#define HC_ISO_IRQ_MASK_AND_REG	0x324
--#define HC_INT_IRQ_MASK_AND_REG	0x328
--#define HC_ATL_IRQ_MASK_AND_REG	0x32c
-+#define ISP176x_HC_INTERRUPT		0x310
-+#define ISP176x_HC_INTERRUPT_ENABLE	0x314
-+#define ISP176x_HC_ISO_IRQ_MASK_OR	0x318
-+#define ISP176x_HC_INT_IRQ_MASK_OR	0x31c
-+#define ISP176x_HC_ATL_IRQ_MASK_OR	0x320
-+#define ISP176x_HC_ISO_IRQ_MASK_AND	0x324
-+#define ISP176x_HC_INT_IRQ_MASK_AND	0x328
-+#define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
-+
-+
-+static const struct regmap_range isp176x_hc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
-+	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
-+	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
-+};
-+
-+static const struct regmap_access_table isp176x_hc_volatile_table =3D {
-+	.yes_ranges	=3D isp176x_hc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_hc_volatile_ranges),
-+};
-+
-+enum isp176x_host_controller_fields {
-+	/* HC_HCSPARAMS */
-+	HCS_PPC, HCS_N_PORTS,
-+	/* HC_HCCPARAMS */
-+	HCC_ISOC_CACHE, HCC_ISOC_THRES,
-+	/* HC_USBCMD */
-+	CMD_LRESET, CMD_RESET, CMD_RUN,
-+	/* HC_USBSTS */
-+	STS_PCD,
-+	/* HC_FRINDEX */
-+	HC_FRINDEX,
-+	/* HC_CONFIGFLAG */
-+	FLAG_CF,
-+	/* HC_PORTSC1 */
-+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
-+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
-+	/* HC_HW_MODE_CTRL */
-+	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
-+	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_AC=
T,
-+	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	/* HC_RESET */
-+	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
-+	/* HC_BUFFER_STATUS */
-+	INT_BUF_FILL, ATL_BUF_FILL,
-+	/* HC_MEMORY */
-+	MEM_BANK_SEL, MEM_START_ADDR,
-+	/* HC_INTERRUPT_ENABLE */
-+	HC_INT_ENABLE,
-+	/* Last element */
-+	HC_FIELD_MAX,
-+};
-+
-+static const struct reg_field isp1760_hc_reg_fields[] =3D {
-+	[HCS_PPC]		=3D REG_FIELD(ISP176x_HC_HCSPARAMS, 4, 4),
-+	[HCS_N_PORTS]		=3D REG_FIELD(ISP176x_HC_HCSPARAMS, 0, 3),
-+	[HCC_ISOC_CACHE]	=3D REG_FIELD(ISP176x_HC_HCCPARAMS, 7, 7),
-+	[HCC_ISOC_THRES]	=3D REG_FIELD(ISP176x_HC_HCCPARAMS, 4, 6),
-+	[CMD_LRESET]		=3D REG_FIELD(ISP176x_HC_USBCMD, 7, 7),
-+	[CMD_RESET]		=3D REG_FIELD(ISP176x_HC_USBCMD, 1, 1),
-+	[CMD_RUN]		=3D REG_FIELD(ISP176x_HC_USBCMD, 0, 0),
-+	[STS_PCD]		=3D REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
-+	[HC_FRINDEX]		=3D REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
-+	[FLAG_CF]		=3D REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
-+	[PORT_OWNER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
-+	[PORT_POWER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
-+	[PORT_LSTATUS]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
-+	[PORT_RESET]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 8, 8),
-+	[PORT_SUSPEND]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 7, 7),
-+	[PORT_RESUME]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 6, 6),
-+	[PORT_PE]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 2, 2),
-+	[PORT_CSC]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 1, 1),
-+	[PORT_CONNECT]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 0, 0),
-+	[ALL_ATX_RESET]		=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 31, 31),
-+	[HW_ANA_DIGI_OC]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 15, 15),
-+	[HW_COMN_IRQ]		=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 10, 10),
-+	[HW_DATA_BUS_WIDTH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 8, 8),
-+	[HW_DACK_POL_HIGH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 6, 6),
-+	[HW_DREQ_POL_HIGH]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 5, 5),
-+	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
-+	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
-+	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
-+	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP176x_HC_RESET, 0, 0),
-+	[INT_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
-+	[ATL_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
-+	[MEM_BANK_SEL]		=3D REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
-+	[MEM_START_ADDR]	=3D REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
-+	[HC_INT_ENABLE]		=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
-+};
-=20
- /* --------------------------------------------------------------------=
---------
-  * Peripheral Controller
-  */
-=20
--/* Initialization Registers */
--#define DC_ADDRESS			0x0200
--#define DC_DEVEN			(1 << 7)
--
--#define DC_MODE				0x020c
--#define DC_DMACLKON			(1 << 9)
--#define DC_VBUSSTAT			(1 << 8)
--#define DC_CLKAON			(1 << 7)
--#define DC_SNDRSU			(1 << 6)
--#define DC_GOSUSP			(1 << 5)
--#define DC_SFRESET			(1 << 4)
--#define DC_GLINTENA			(1 << 3)
--#define DC_WKUPCS			(1 << 2)
--
--#define DC_INTCONF			0x0210
--#define DC_CDBGMOD_ACK_NAK		(0 << 6)
--#define DC_CDBGMOD_ACK			(1 << 6)
--#define DC_CDBGMOD_ACK_1NAK		(2 << 6)
--#define DC_DDBGMODIN_ACK_NAK		(0 << 4)
--#define DC_DDBGMODIN_ACK		(1 << 4)
--#define DC_DDBGMODIN_ACK_1NAK		(2 << 4)
--#define DC_DDBGMODOUT_ACK_NYET_NAK	(0 << 2)
--#define DC_DDBGMODOUT_ACK_NYET		(1 << 2)
--#define DC_DDBGMODOUT_ACK_NYET_1NAK	(2 << 2)
--#define DC_INTLVL			(1 << 1)
--#define DC_INTPOL			(1 << 0)
--
--#define DC_DEBUG			0x0212
--#define DC_INTENABLE			0x0214
- #define DC_IEPTX(n)			(1 << (11 + 2 * (n)))
- #define DC_IEPRX(n)			(1 << (10 + 2 * (n)))
- #define DC_IEPRXTX(n)			(3 << (10 + 2 * (n)))
--#define DC_IEP0SETUP			(1 << 8)
--#define DC_IEVBUS			(1 << 7)
--#define DC_IEDMA			(1 << 6)
--#define DC_IEHS_STA			(1 << 5)
--#define DC_IERESM			(1 << 4)
--#define DC_IESUSP			(1 << 3)
--#define DC_IEPSOF			(1 << 2)
--#define DC_IESOF			(1 << 1)
--#define DC_IEBRST			(1 << 0)
-+
-+#define ISP176x_DC_ENDPTYP_ISOC		0x01
-+#define ISP176x_DC_ENDPTYP_BULK		0x02
-+#define ISP176x_DC_ENDPTYP_INTERRUPT	0x03
-+
-+/* Initialization Registers */
-+#define ISP176x_DC_ADDRESS			0x0200
-+#define ISP176x_DC_MODE				0x020c
-+#define ISP176x_DC_INTCONF			0x0210
-+#define ISP176x_DC_DEBUG			0x0212
-+#define ISP176x_DC_INTENABLE			0x0214
-=20
- /* Data Flow Registers */
--#define DC_EPINDEX			0x022c
--#define DC_EP0SETUP			(1 << 5)
--#define DC_ENDPIDX(n)			((n) << 1)
--#define DC_EPDIR			(1 << 0)
--
--#define DC_CTRLFUNC			0x0228
--#define DC_CLBUF			(1 << 4)
--#define DC_VENDP			(1 << 3)
--#define DC_DSEN				(1 << 2)
--#define DC_STATUS			(1 << 1)
--#define DC_STALL			(1 << 0)
--
--#define DC_DATAPORT			0x0220
--#define DC_BUFLEN			0x021c
--#define DC_DATACOUNT_MASK		0xffff
--#define DC_BUFSTAT			0x021e
--#define DC_EPMAXPKTSZ			0x0204
--
--#define DC_EPTYPE			0x0208
--#define DC_NOEMPKT			(1 << 4)
--#define DC_EPENABLE			(1 << 3)
--#define DC_DBLBUF			(1 << 2)
--#define DC_ENDPTYP_ISOC			(1 << 0)
--#define DC_ENDPTYP_BULK			(2 << 0)
--#define DC_ENDPTYP_INTERRUPT		(3 << 0)
-+#define ISP176x_DC_EPMAXPKTSZ			0x0204
-+#define ISP176x_DC_EPTYPE			0x0208
-+
-+#define ISP176x_DC_BUFLEN			0x021c
-+#define ISP176x_DC_BUFSTAT			0x021e
-+#define ISP176x_DC_DATAPORT			0x0220
-+
-+#define ISP176x_DC_CTRLFUNC			0x0228
-+#define ISP176x_DC_EPINDEX			0x022c
-+
-+#define ISP1761_DC_OTG_CTRL_SET			0x374
-+#define ISP1761_DC_OTG_CTRL_CLEAR		0x376
-=20
- /* DMA Registers */
--#define DC_DMACMD			0x0230
--#define DC_DMATXCOUNT			0x0234
--#define DC_DMACONF			0x0238
--#define DC_DMAHW			0x023c
--#define DC_DMAINTREASON			0x0250
--#define DC_DMAINTEN			0x0254
--#define DC_DMAEP			0x0258
--#define DC_DMABURSTCOUNT		0x0264
-+#define ISP176x_DC_DMACMD			0x0230
-+#define ISP176x_DC_DMATXCOUNT			0x0234
-+#define ISP176x_DC_DMACONF			0x0238
-+#define ISP176x_DC_DMAHW			0x023c
-+#define ISP176x_DC_DMAINTREASON			0x0250
-+#define ISP176x_DC_DMAINTEN			0x0254
-+#define ISP176x_DC_DMAEP			0x0258
-+#define ISP176x_DC_DMABURSTCOUNT		0x0264
-=20
- /* General Registers */
--#define DC_INTERRUPT			0x0218
--#define DC_CHIPID			0x0270
--#define DC_FRAMENUM			0x0274
--#define DC_SCRATCH			0x0278
--#define DC_UNLOCKDEV			0x027c
--#define DC_INTPULSEWIDTH		0x0280
--#define DC_TESTMODE			0x0284
-+#define ISP176x_DC_INTERRUPT			0x0218
-+#define ISP176x_DC_CHIPID			0x0270
-+#define ISP176x_DC_FRAMENUM			0x0274
-+#define ISP176x_DC_SCRATCH			0x0278
-+#define ISP176x_DC_UNLOCKDEV			0x027c
-+#define ISP176x_DC_INTPULSEWIDTH		0x0280
-+#define ISP176x_DC_TESTMODE			0x0284
-+
-+static const struct regmap_range isp176x_dc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
-+	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
-+	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
-+};
-+
-+static const struct regmap_access_table isp176x_dc_volatile_table =3D {
-+	.yes_ranges	=3D isp176x_dc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp176x_dc_volatile_ranges),
-+};
-+
-+enum isp176x_device_controller_fields {
-+	/* DC_ADDRESS */
-+	DC_DEVEN, DC_DEVADDR,
-+	/* DC_MODE */
-+	DC_VBUSSTAT, DC_SFRESET, DC_GLINTENA,
-+	/* DC_INTCONF */
-+	DC_CDBGMOD_ACK, DC_DDBGMODIN_ACK, DC_DDBGMODOUT_ACK, DC_INTPOL,
-+	/* DC_INTENABLE */
-+	DC_IEPRXTX_7, DC_IEPRXTX_6, DC_IEPRXTX_5, DC_IEPRXTX_4, DC_IEPRXTX_3,
-+	DC_IEPRXTX_2, DC_IEPRXTX_1, DC_IEPRXTX_0,
-+	DC_IEP0SETUP, DC_IEVBUS, DC_IEHS_STA, DC_IERESM, DC_IESUSP, DC_IEBRST,
-+	/* DC_EPINDEX */
-+	DC_EP0SETUP, DC_ENDPIDX, DC_EPDIR,
-+	/* DC_CTRLFUNC */
-+	DC_CLBUF, DC_VENDP, DC_DSEN, DC_STATUS, DC_STALL,
-+	/* DC_BUFLEN */
-+	DC_BUFLEN,
-+	/* DC_EPMAXPKTSZ */
-+	DC_FFOSZ,
-+	/* DC_EPTYPE */
-+	DC_EPENABLE, DC_ENDPTYP,
-+	/* DC_FRAMENUM */
-+	DC_FRAMENUM, DC_UFRAMENUM,
-+	/* HW_OTG_CTRL_SET */
-+	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
-+	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
-+	/* HW_OTG_CTRL_CLR */
-+	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
-+	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
-+	HW_DP_PULLUP_CLEAR,
-+	/* Last element */
-+	DC_FIELD_MAX,
-+};
-+
-+static const struct reg_field isp1761_dc_reg_fields[] =3D {
-+	[DC_DEVEN]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 7, 7),
-+	[DC_DEVADDR]		=3D REG_FIELD(ISP176x_DC_ADDRESS, 0, 6),
-+	[DC_VBUSSTAT]		=3D REG_FIELD(ISP176x_DC_MODE, 8, 8),
-+	[DC_SFRESET]		=3D REG_FIELD(ISP176x_DC_MODE, 4, 4),
-+	[DC_GLINTENA]		=3D REG_FIELD(ISP176x_DC_MODE, 3, 3),
-+	[DC_CDBGMOD_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 6, 6),
-+	[DC_DDBGMODIN_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 4, 4),
-+	[DC_DDBGMODOUT_ACK]	=3D REG_FIELD(ISP176x_DC_INTCONF, 2, 2),
-+	[DC_INTPOL]		=3D REG_FIELD(ISP176x_DC_INTCONF, 0, 0),
-+	[DC_IEPRXTX_7]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 25, 25),
-+	[DC_IEPRXTX_6]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 23, 23),
-+	[DC_IEPRXTX_5]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 21, 21),
-+	[DC_IEPRXTX_4]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 19, 19),
-+	[DC_IEPRXTX_3]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 17, 17),
-+	[DC_IEPRXTX_2]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 15, 15),
-+	[DC_IEPRXTX_1]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 13, 13),
-+	[DC_IEPRXTX_0]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 11, 11),
-+	[DC_IEP0SETUP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 8, 8),
-+	[DC_IEVBUS]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 7, 7),
-+	[DC_IEHS_STA]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 5, 5),
-+	[DC_IERESM]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 4, 4),
-+	[DC_IESUSP]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 3, 3),
-+	[DC_IEBRST]		=3D REG_FIELD(ISP176x_DC_INTENABLE, 0, 0),
-+	[DC_EP0SETUP]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 5, 5),
-+	[DC_ENDPIDX]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 1, 4),
-+	[DC_EPDIR]		=3D REG_FIELD(ISP176x_DC_EPINDEX, 0, 0),
-+	[DC_CLBUF]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 4, 4),
-+	[DC_VENDP]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 3, 3),
-+	[DC_DSEN]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 2, 2),
-+	[DC_STATUS]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 1, 1),
-+	[DC_STALL]		=3D REG_FIELD(ISP176x_DC_CTRLFUNC, 0, 0),
-+	[DC_BUFLEN]		=3D REG_FIELD(ISP176x_DC_BUFLEN, 0, 15),
-+	[DC_FFOSZ]		=3D REG_FIELD(ISP176x_DC_EPMAXPKTSZ, 0, 10),
-+	[DC_EPENABLE]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 3, 3),
-+	[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
-+	[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
-+	[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
-+};
-=20
- #endif
-diff --git a/drivers/usb/isp1760/isp1760-udc.c b/drivers/usb/isp1760/isp=
1760-udc.c
-index 1714b2258b54..1ce21ef291b6 100644
---- a/drivers/usb/isp1760/isp1760-udc.c
-+++ b/drivers/usb/isp1760/isp1760-udc.c
-@@ -45,16 +45,62 @@ static inline struct isp1760_request *req_to_udc_req=
(struct usb_request *req)
- 	return container_of(req, struct isp1760_request, req);
- }
-=20
--static inline u32 isp1760_udc_read(struct isp1760_udc *udc, u16 reg)
-+static u32 isp1760_udc_read(struct isp1760_udc *udc, u16 field)
- {
--	return isp1760_read32(udc->regs, reg);
-+	return isp1760_field_read(udc->fields, field);
- }
-=20
--static inline void isp1760_udc_write(struct isp1760_udc *udc, u16 reg, =
u32 val)
-+static void isp1760_udc_write(struct isp1760_udc *udc, u16 field, u32 v=
al)
- {
--	isp1760_write32(udc->regs, reg, val);
-+	isp1760_field_write(udc->fields, field, val);
- }
-=20
-+static u32 isp1760_udc_read_raw(struct isp1760_udc *udc, u16 reg)
-+{
-+	u32 val;
-+
-+	regmap_raw_read(udc->regs, reg, &val, 4);
-+
-+	return le32_to_cpu(val);
-+}
-+
-+static u16 isp1760_udc_read_raw16(struct isp1760_udc *udc, u16 reg)
-+{
-+	u16 val;
-+
-+	regmap_raw_read(udc->regs, reg, &val, 2);
-+
-+	return le16_to_cpu(val);
-+}
-+
-+static void isp1760_udc_write_raw(struct isp1760_udc *udc, u16 reg, u32=
 val)
-+{
-+	val =3D cpu_to_le32(val);
-+
-+	regmap_raw_write(udc->regs, reg, &val, 4);
-+}
-+
-+static void isp1760_udc_write_raw16(struct isp1760_udc *udc, u16 reg, u=
16 val)
-+{
-+	val =3D cpu_to_le16(val);
-+
-+	regmap_raw_write(udc->regs, reg, &val, 2);
-+}
-+
-+static void isp1760_udc_set(struct isp1760_udc *udc, u32 field)
-+{
-+	isp1760_udc_write(udc, field, 0xFFFFFFFF);
-+}
-+
-+static void isp1760_udc_clear(struct isp1760_udc *udc, u32 field)
-+{
-+	isp1760_udc_write(udc, field, 0);
-+}
-+
-+static bool isp1760_udc_is_set(struct isp1760_udc *udc, u32 field)
-+{
-+	return !!isp1760_udc_read(udc, field);
-+}
- /* --------------------------------------------------------------------=
---------
-  * Endpoint Management
-  */
-@@ -75,11 +121,15 @@ static struct isp1760_ep *isp1760_udc_find_ep(struc=
t isp1760_udc *udc,
- 	return NULL;
- }
-=20
--static void __isp1760_udc_select_ep(struct isp1760_ep *ep, int dir)
-+static void __isp1760_udc_select_ep(struct isp1760_udc *udc,
-+				    struct isp1760_ep *ep, int dir)
- {
--	isp1760_udc_write(ep->udc, DC_EPINDEX,
--			  DC_ENDPIDX(ep->addr & USB_ENDPOINT_NUMBER_MASK) |
--			  (dir =3D=3D USB_DIR_IN ? DC_EPDIR : 0));
-+	isp1760_udc_write(udc, DC_ENDPIDX, ep->addr & USB_ENDPOINT_NUMBER_MASK=
);
-+
-+	if (dir =3D=3D USB_DIR_IN)
-+		isp1760_udc_set(udc, DC_EPDIR);
-+	else
-+		isp1760_udc_clear(udc, DC_EPDIR);
- }
-=20
- /**
-@@ -93,9 +143,10 @@ static void __isp1760_udc_select_ep(struct isp1760_e=
p *ep, int dir)
-  *
-  * Called with the UDC spinlock held.
-  */
--static void isp1760_udc_select_ep(struct isp1760_ep *ep)
-+static void isp1760_udc_select_ep(struct isp1760_udc *udc,
-+				  struct isp1760_ep *ep)
- {
--	__isp1760_udc_select_ep(ep, ep->addr & USB_ENDPOINT_DIR_MASK);
-+	__isp1760_udc_select_ep(udc, ep, ep->addr & USB_ENDPOINT_DIR_MASK);
- }
-=20
- /* Called with the UDC spinlock held. */
-@@ -108,9 +159,13 @@ static void isp1760_udc_ctrl_send_status(struct isp=
1760_ep *ep, int dir)
- 	 * the direction opposite to the data stage data packets, we thus need
- 	 * to select the OUT/IN endpoint for IN/OUT transfers.
- 	 */
--	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) |
--			  (dir =3D=3D USB_DIR_IN ? 0 : DC_EPDIR));
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STATUS);
-+	if (dir =3D=3D USB_DIR_IN)
-+		isp1760_udc_clear(udc, DC_EPDIR);
-+	else
-+		isp1760_udc_set(udc, DC_EPDIR);
-+
-+	isp1760_udc_write(udc, DC_ENDPIDX, 1);
-+	isp1760_udc_set(udc, DC_STATUS);
-=20
- 	/*
- 	 * The hardware will terminate the request automatically and go back t=
o
-@@ -157,10 +212,10 @@ static void isp1760_udc_ctrl_send_stall(struct isp=
1760_ep *ep)
- 	spin_lock_irqsave(&udc->lock, flags);
-=20
- 	/* Stall both the IN and OUT endpoints. */
--	__isp1760_udc_select_ep(ep, USB_DIR_OUT);
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
--	__isp1760_udc_select_ep(ep, USB_DIR_IN);
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_STALL);
-+	__isp1760_udc_select_ep(udc, ep, USB_DIR_OUT);
-+	isp1760_udc_set(udc, DC_STALL);
-+	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
-+	isp1760_udc_set(udc, DC_STALL);
-=20
- 	/* A protocol stall completes the control transaction. */
- 	udc->ep0_state =3D ISP1760_CTRL_SETUP;
-@@ -181,8 +236,8 @@ static bool isp1760_udc_receive(struct isp1760_ep *e=
p,
- 	u32 *buf;
- 	int i;
-=20
--	isp1760_udc_select_ep(ep);
--	len =3D isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
-+	isp1760_udc_select_ep(udc, ep);
-+	len =3D isp1760_udc_read(udc, DC_BUFLEN);
-=20
- 	dev_dbg(udc->isp->dev, "%s: received %u bytes (%u/%u done)\n",
- 		__func__, len, req->req.actual, req->req.length);
-@@ -198,7 +253,7 @@ static bool isp1760_udc_receive(struct isp1760_ep *e=
p,
- 		 * datasheet doesn't clearly document how this should be
- 		 * handled.
- 		 */
--		isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
-+		isp1760_udc_set(udc, DC_CLBUF);
- 		return false;
- 	}
-=20
-@@ -209,9 +264,9 @@ static bool isp1760_udc_receive(struct isp1760_ep *e=
p,
- 	 * the next packet might be removed from the FIFO.
- 	 */
- 	for (i =3D len; i > 2; i -=3D 4, ++buf)
--		*buf =3D le32_to_cpu(isp1760_udc_read(udc, DC_DATAPORT));
-+		*buf =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
- 	if (i > 0)
--		*(u16 *)buf =3D le16_to_cpu(readw(udc->regs + DC_DATAPORT));
-+		*(u16 *)buf =3D isp1760_udc_read_raw16(udc, ISP176x_DC_DATAPORT);
-=20
- 	req->req.actual +=3D len;
-=20
-@@ -253,7 +308,7 @@ static void isp1760_udc_transmit(struct isp1760_ep *=
ep,
- 		__func__, req->packet_size, req->req.actual,
- 		req->req.length);
-=20
--	__isp1760_udc_select_ep(ep, USB_DIR_IN);
-+	__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
-=20
- 	if (req->packet_size)
- 		isp1760_udc_write(udc, DC_BUFLEN, req->packet_size);
-@@ -265,14 +320,14 @@ static void isp1760_udc_transmit(struct isp1760_ep=
 *ep,
- 	 * the FIFO for this kind of conditions, but doesn't seem to work.
- 	 */
- 	for (i =3D req->packet_size; i > 2; i -=3D 4, ++buf)
--		isp1760_udc_write(udc, DC_DATAPORT, cpu_to_le32(*buf));
-+		isp1760_udc_write_raw(udc, ISP176x_DC_DATAPORT, *buf);
- 	if (i > 0)
--		writew(cpu_to_le16(*(u16 *)buf), udc->regs + DC_DATAPORT);
-+		isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, *(u16 *)buf);
-=20
- 	if (ep->addr =3D=3D 0)
--		isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
-+		isp1760_udc_set(udc, DC_DSEN);
- 	if (!req->packet_size)
--		isp1760_udc_write(udc, DC_CTRLFUNC, DC_VENDP);
-+		isp1760_udc_set(udc, DC_VENDP);
- }
-=20
- static void isp1760_ep_rx_ready(struct isp1760_ep *ep)
-@@ -408,19 +463,24 @@ static int __isp1760_udc_set_halt(struct isp1760_e=
p *ep, bool halt)
- 		return -EINVAL;
- 	}
-=20
--	isp1760_udc_select_ep(ep);
--	isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
-+	isp1760_udc_select_ep(udc, ep);
-+
-+	if (halt)
-+		isp1760_udc_set(udc, DC_STALL);
-+	else
-+		isp1760_udc_clear(udc, DC_STALL);
-=20
- 	if (ep->addr =3D=3D 0) {
- 		/* When halting the control endpoint, stall both IN and OUT. */
--		__isp1760_udc_select_ep(ep, USB_DIR_IN);
--		isp1760_udc_write(udc, DC_CTRLFUNC, halt ? DC_STALL : 0);
-+		__isp1760_udc_select_ep(udc, ep, USB_DIR_IN);
-+		if (halt)
-+			isp1760_udc_set(udc, DC_STALL);
-+		else
-+			isp1760_udc_clear(udc, DC_STALL);
- 	} else if (!halt) {
- 		/* Reset the data PID by cycling the endpoint enable bit. */
--		u16 eptype =3D isp1760_udc_read(udc, DC_EPTYPE);
--
--		isp1760_udc_write(udc, DC_EPTYPE, eptype & ~DC_EPENABLE);
--		isp1760_udc_write(udc, DC_EPTYPE, eptype);
-+		isp1760_udc_clear(udc, DC_EPENABLE);
-+		isp1760_udc_set(udc, DC_EPENABLE);
-=20
- 		/*
- 		 * Disabling the endpoint emptied the transmit FIFO, fill it
-@@ -479,12 +539,14 @@ static int isp1760_udc_get_status(struct isp1760_u=
dc *udc,
- 		return -EINVAL;
- 	}
-=20
--	isp1760_udc_write(udc, DC_EPINDEX, DC_ENDPIDX(0) | DC_EPDIR);
-+	isp1760_udc_set(udc, DC_EPDIR);
-+	isp1760_udc_write(udc, DC_ENDPIDX, 1);
-+
- 	isp1760_udc_write(udc, DC_BUFLEN, 2);
-=20
--	writew(cpu_to_le16(status), udc->regs + DC_DATAPORT);
-+	isp1760_udc_write_raw16(udc, ISP176x_DC_DATAPORT, status);
-=20
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
-+	isp1760_udc_set(udc, DC_DSEN);
-=20
- 	dev_dbg(udc->isp->dev, "%s: status 0x%04x\n", __func__, status);
-=20
-@@ -508,7 +570,8 @@ static int isp1760_udc_set_address(struct isp1760_ud=
c *udc, u16 addr)
- 	usb_gadget_set_state(&udc->gadget, addr ? USB_STATE_ADDRESS :
- 			     USB_STATE_DEFAULT);
-=20
--	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN | addr);
-+	isp1760_udc_write(udc, DC_DEVADDR, addr);
-+	isp1760_udc_set(udc, DC_DEVEN);
-=20
- 	spin_lock(&udc->lock);
- 	isp1760_udc_ctrl_send_status(&udc->ep[0], USB_DIR_OUT);
-@@ -650,9 +713,9 @@ static void isp1760_ep0_setup(struct isp1760_udc *ud=
c)
-=20
- 	spin_lock(&udc->lock);
-=20
--	isp1760_udc_write(udc, DC_EPINDEX, DC_EP0SETUP);
-+	isp1760_udc_set(udc, DC_EP0SETUP);
-=20
--	count =3D isp1760_udc_read(udc, DC_BUFLEN) & DC_DATACOUNT_MASK;
-+	count =3D isp1760_udc_read(udc, DC_BUFLEN);
- 	if (count !=3D sizeof(req)) {
- 		spin_unlock(&udc->lock);
-=20
-@@ -663,8 +726,8 @@ static void isp1760_ep0_setup(struct isp1760_udc *ud=
c)
- 		return;
- 	}
-=20
--	req.data[0] =3D isp1760_udc_read(udc, DC_DATAPORT);
--	req.data[1] =3D isp1760_udc_read(udc, DC_DATAPORT);
-+	req.data[0] =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
-+	req.data[1] =3D isp1760_udc_read_raw(udc, ISP176x_DC_DATAPORT);
-=20
- 	if (udc->ep0_state !=3D ISP1760_CTRL_SETUP) {
- 		spin_unlock(&udc->lock);
-@@ -732,13 +795,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
-=20
- 	switch (usb_endpoint_type(desc)) {
- 	case USB_ENDPOINT_XFER_ISOC:
--		type =3D DC_ENDPTYP_ISOC;
-+		type =3D ISP176x_DC_ENDPTYP_ISOC;
- 		break;
- 	case USB_ENDPOINT_XFER_BULK:
--		type =3D DC_ENDPTYP_BULK;
-+		type =3D ISP176x_DC_ENDPTYP_BULK;
- 		break;
- 	case USB_ENDPOINT_XFER_INT:
--		type =3D DC_ENDPTYP_INTERRUPT;
-+		type =3D ISP176x_DC_ENDPTYP_INTERRUPT;
- 		break;
- 	case USB_ENDPOINT_XFER_CONTROL:
- 	default:
-@@ -755,10 +818,13 @@ static int isp1760_ep_enable(struct usb_ep *ep,
- 	uep->halted =3D false;
- 	uep->wedged =3D false;
-=20
--	isp1760_udc_select_ep(uep);
--	isp1760_udc_write(udc, DC_EPMAXPKTSZ, uep->maxpacket);
-+	isp1760_udc_select_ep(udc, uep);
-+
-+	isp1760_udc_write(udc, DC_FFOSZ, uep->maxpacket);
- 	isp1760_udc_write(udc, DC_BUFLEN, uep->maxpacket);
--	isp1760_udc_write(udc, DC_EPTYPE, DC_EPENABLE | type);
-+
-+	isp1760_udc_write(udc, DC_ENDPTYP, type);
-+	isp1760_udc_set(udc, DC_EPENABLE);
-=20
- 	spin_unlock_irqrestore(&udc->lock, flags);
-=20
-@@ -786,8 +852,9 @@ static int isp1760_ep_disable(struct usb_ep *ep)
- 	uep->desc =3D NULL;
- 	uep->maxpacket =3D 0;
-=20
--	isp1760_udc_select_ep(uep);
--	isp1760_udc_write(udc, DC_EPTYPE, 0);
-+	isp1760_udc_select_ep(udc, uep);
-+	isp1760_udc_clear(udc, DC_EPENABLE);
-+	isp1760_udc_clear(udc, DC_ENDPTYP);
-=20
- 	/* TODO Synchronize with the IRQ handler */
-=20
-@@ -864,8 +931,8 @@ static int isp1760_ep_queue(struct usb_ep *ep, struc=
t usb_request *_req,
-=20
- 		case ISP1760_CTRL_DATA_OUT:
- 			list_add_tail(&req->queue, &uep->queue);
--			__isp1760_udc_select_ep(uep, USB_DIR_OUT);
--			isp1760_udc_write(udc, DC_CTRLFUNC, DC_DSEN);
-+			__isp1760_udc_select_ep(udc, uep, USB_DIR_OUT);
-+			isp1760_udc_set(udc, DC_DSEN);
- 			break;
-=20
- 		case ISP1760_CTRL_STATUS:
-@@ -1025,14 +1092,14 @@ static void isp1760_ep_fifo_flush(struct usb_ep =
*ep)
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
-=20
--	isp1760_udc_select_ep(uep);
-+	isp1760_udc_select_ep(udc, uep);
-=20
- 	/*
- 	 * Set the CLBUF bit twice to flush both buffers in case double
- 	 * buffering is enabled.
- 	 */
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
--	isp1760_udc_write(udc, DC_CTRLFUNC, DC_CLBUF);
-+	isp1760_udc_set(udc, DC_CLBUF);
-+	isp1760_udc_set(udc, DC_CLBUF);
-=20
- 	spin_unlock_irqrestore(&udc->lock, flags);
- }
-@@ -1091,19 +1158,30 @@ static void isp1760_udc_init_hw(struct isp1760_u=
dc *udc)
- 	 * ACK tokens only (and NYET for the out pipe). The default
- 	 * configuration also generates an interrupt on the first NACK token.
- 	 */
--	isp1760_udc_write(udc, DC_INTCONF, DC_CDBGMOD_ACK | DC_DDBGMODIN_ACK |
--			  DC_DDBGMODOUT_ACK_NYET);
--
--	isp1760_udc_write(udc, DC_INTENABLE, DC_IEPRXTX(7) | DC_IEPRXTX(6) |
--			  DC_IEPRXTX(5) | DC_IEPRXTX(4) | DC_IEPRXTX(3) |
--			  DC_IEPRXTX(2) | DC_IEPRXTX(1) | DC_IEPRXTX(0) |
--			  DC_IEP0SETUP | DC_IEVBUS | DC_IERESM | DC_IESUSP |
--			  DC_IEHS_STA | DC_IEBRST);
-+	isp1760_udc_set(udc, DC_CDBGMOD_ACK);
-+	isp1760_udc_set(udc, DC_DDBGMODIN_ACK);
-+	isp1760_udc_set(udc, DC_DDBGMODOUT_ACK);
-+
-+	isp1760_udc_set(udc, DC_IEPRXTX_7);
-+	isp1760_udc_set(udc, DC_IEPRXTX_6);
-+	isp1760_udc_set(udc, DC_IEPRXTX_5);
-+	isp1760_udc_set(udc, DC_IEPRXTX_4);
-+	isp1760_udc_set(udc, DC_IEPRXTX_3);
-+	isp1760_udc_set(udc, DC_IEPRXTX_2);
-+	isp1760_udc_set(udc, DC_IEPRXTX_1);
-+	isp1760_udc_set(udc, DC_IEPRXTX_0);
-+
-+	isp1760_udc_set(udc, DC_IEP0SETUP);
-+	isp1760_udc_set(udc, DC_IEVBUS);
-+	isp1760_udc_set(udc, DC_IERESM);
-+	isp1760_udc_set(udc, DC_IESUSP);
-+	isp1760_udc_set(udc, DC_IEHS_STA);
-+	isp1760_udc_set(udc, DC_IEBRST);
-=20
- 	if (udc->connected)
- 		isp1760_set_pullup(udc->isp, true);
-=20
--	isp1760_udc_write(udc, DC_ADDRESS, DC_DEVEN);
-+	isp1760_udc_set(udc, DC_DEVEN);
- }
-=20
- static void isp1760_udc_reset(struct isp1760_udc *udc)
-@@ -1152,7 +1230,7 @@ static int isp1760_udc_get_frame(struct usb_gadget=
 *gadget)
- {
- 	struct isp1760_udc *udc =3D gadget_to_udc(gadget);
-=20
--	return isp1760_udc_read(udc, DC_FRAMENUM) & ((1 << 11) - 1);
-+	return isp1760_udc_read(udc, DC_FRAMENUM);
- }
-=20
- static int isp1760_udc_wakeup(struct usb_gadget *gadget)
-@@ -1219,7 +1297,7 @@ static int isp1760_udc_start(struct usb_gadget *ga=
dget,
- 	usb_gadget_set_state(&udc->gadget, USB_STATE_ATTACHED);
-=20
- 	/* DMA isn't supported yet, don't enable the DMA clock. */
--	isp1760_udc_write(udc, DC_MODE, DC_GLINTENA);
-+	isp1760_udc_set(udc, DC_GLINTENA);
-=20
- 	isp1760_udc_init_hw(udc);
-=20
-@@ -1238,7 +1316,7 @@ static int isp1760_udc_stop(struct usb_gadget *gad=
get)
-=20
- 	del_timer_sync(&udc->vbus_timer);
-=20
--	isp1760_udc_write(udc, DC_MODE, 0);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
- 	udc->driver =3D NULL;
-@@ -1266,9 +1344,9 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
- 	unsigned int i;
- 	u32 status;
-=20
--	status =3D isp1760_udc_read(udc, DC_INTERRUPT)
--	       & isp1760_udc_read(udc, DC_INTENABLE);
--	isp1760_udc_write(udc, DC_INTERRUPT, status);
-+	status =3D isp1760_reg_read(udc->regs, ISP176x_DC_INTERRUPT)
-+	       & isp1760_reg_read(udc->regs, ISP176x_DC_INTENABLE);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_INTERRUPT, status);
-=20
- 	if (status & DC_IEVBUS) {
- 		dev_dbg(udc->isp->dev, "%s(VBUS)\n", __func__);
-@@ -1313,7 +1391,7 @@ static irqreturn_t isp1760_udc_irq(int irq, void *=
dev)
- 		dev_dbg(udc->isp->dev, "%s(SUSP)\n", __func__);
-=20
- 		spin_lock(&udc->lock);
--		if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
-+		if (!isp1760_udc_is_set(udc, DC_VBUSSTAT))
- 			isp1760_udc_disconnect(udc);
- 		else
- 			isp1760_udc_suspend(udc);
-@@ -1335,7 +1413,7 @@ static void isp1760_udc_vbus_poll(struct timer_lis=
t *t)
-=20
- 	spin_lock_irqsave(&udc->lock, flags);
-=20
--	if (!(isp1760_udc_read(udc, DC_MODE) & DC_VBUSSTAT))
-+	if (!(isp1760_udc_is_set(udc, DC_VBUSSTAT)))
- 		isp1760_udc_disconnect(udc);
- 	else if (udc->gadget.state >=3D USB_STATE_POWERED)
- 		mod_timer(&udc->vbus_timer,
-@@ -1412,9 +1490,9 @@ static int isp1760_udc_init(struct isp1760_udc *ud=
c)
- 	 * register, and reading the scratch register value back. The chip ID
- 	 * and scratch register contents must match the expected values.
- 	 */
--	isp1760_udc_write(udc, DC_SCRATCH, 0xbabe);
--	chipid =3D isp1760_udc_read(udc, DC_CHIPID);
--	scratch =3D isp1760_udc_read(udc, DC_SCRATCH);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_SCRATCH, 0xbabe);
-+	chipid =3D isp1760_reg_read(udc->regs, ISP176x_DC_CHIPID);
-+	scratch =3D isp1760_reg_read(udc->regs, ISP176x_DC_SCRATCH);
-=20
- 	if (scratch !=3D 0xbabe) {
- 		dev_err(udc->isp->dev,
-@@ -1429,9 +1507,9 @@ static int isp1760_udc_init(struct isp1760_udc *ud=
c)
- 	}
-=20
- 	/* Reset the device controller. */
--	isp1760_udc_write(udc, DC_MODE, DC_SFRESET);
-+	isp1760_udc_set(udc, DC_SFRESET);
- 	usleep_range(10000, 11000);
--	isp1760_udc_write(udc, DC_MODE, 0);
-+	isp1760_reg_write(udc->regs, ISP176x_DC_MODE, 0);
- 	usleep_range(10000, 11000);
-=20
- 	return 0;
-@@ -1445,7 +1523,6 @@ int isp1760_udc_register(struct isp1760_device *is=
p, int irq,
-=20
- 	udc->irq =3D -1;
- 	udc->isp =3D isp;
--	udc->regs =3D isp->regs;
-=20
- 	spin_lock_init(&udc->lock);
- 	timer_setup(&udc->vbus_timer, isp1760_udc_vbus_poll, 0);
-diff --git a/drivers/usb/isp1760/isp1760-udc.h b/drivers/usb/isp1760/isp=
1760-udc.h
-index 2d0b88747701..12626bf2fe4d 100644
---- a/drivers/usb/isp1760/isp1760-udc.h
-+++ b/drivers/usb/isp1760/isp1760-udc.h
-@@ -17,6 +17,8 @@
- #include <linux/timer.h>
- #include <linux/usb/gadget.h>
-=20
-+#include "isp1760-regs.h"
-+
- struct isp1760_device;
- struct isp1760_udc;
-=20
-@@ -48,7 +50,7 @@ struct isp1760_ep {
-  * struct isp1760_udc - UDC state information
-  * irq: IRQ number
-  * irqname: IRQ name (as passed to request_irq)
-- * regs: Base address of the UDC registers
-+ * regs: regmap for UDC registers
-  * driver: Gadget driver
-  * gadget: Gadget device
-  * lock: Protects driver, vbus_timer, ep, ep0_*, DC_EPINDEX register
-@@ -59,12 +61,13 @@ struct isp1760_ep {
-  * connected: Tracks gadget driver bus connection state
-  */
- struct isp1760_udc {
--#ifdef CONFIG_USB_ISP1761_UDC
- 	struct isp1760_device *isp;
-=20
- 	int irq;
- 	char *irqname;
--	void __iomem *regs;
-+
-+	struct regmap *regs;
-+	struct regmap_field *fields[DC_FIELD_MAX];
-=20
- 	struct usb_gadget_driver *driver;
- 	struct usb_gadget gadget;
-@@ -81,7 +84,6 @@ struct isp1760_udc {
- 	bool connected;
-=20
- 	unsigned int devstatus;
--#endif
- };
-=20
- #ifdef CONFIG_USB_ISP1761_UDC
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0019-usb=
-isp1760-hcd-refactor-mempool-config-and-setup.patch b/meta-arm-bsp/recip=
es-kernel/linux/files/corstone700/0019-usb-isp1760-hcd-refactor-mempool-c=
onfig-and-setup.patch
deleted file mode 100644
index 0f376f66..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0019-usb-isp176=
0-hcd-refactor-mempool-config-and-setup.patch
+++ /dev/null
@@ -1,302 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From a2d7a69e994ea67583bbd766a85b2c89f35b45b5 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Fri, 26 Jun 2020 16:37:30 +0100
-Subject: [PATCH 19/20] usb: isp1760: hcd: refactor mempool config and se=
tup
-
-In preparation to support other family member IP, which may have
-different memory layout. Drop macros and setup a configuration
-struct.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-core.c | 21 ++++++++
- drivers/usb/isp1760/isp1760-hcd.c  | 83 ++++++++++++++++++++----------
- drivers/usb/isp1760/isp1760-hcd.h  | 37 ++++++-------
- 3 files changed, 92 insertions(+), 49 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index f7f680046a15..88f233c11397 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -102,6 +102,25 @@ void isp1760_set_pullup(struct isp1760_device *isp,=
 bool enable)
- 		isp1760_field_set(udc->fields, HW_DP_PULLUP_CLEAR);
- }
-=20
-+/*
-+ * 60kb divided in:
-+ * - 32 blocks @ 256  bytes
-+ * - 20 blocks @ 1024 bytes
-+ * -  4 blocks @ 8192 bytes
-+ */
-+static const struct isp1760_memory_layout isp176x_memory_conf =3D {
-+	.blocks[0]		=3D 32,
-+	.blocks_size[0]		=3D 256,
-+	.blocks[1]		=3D 20,
-+	.blocks_size[1]		=3D 1024,
-+	.blocks[2]		=3D 4,
-+	.blocks_size[2]		=3D 8192,
-+
-+	.ptd_num		=3D 32,
-+	.payload_blocks		=3D 32 + 20 + 4,
-+	.payload_area_size	=3D 0xf000,
-+};
-+
- static const struct regmap_config isp1760_hc_regmap_conf =3D {
- 	.name =3D "isp1760-hc",
- 	.reg_bits =3D 16,
-@@ -183,6 +202,8 @@ int isp1760_register(struct resource *mem, int irq, =
unsigned long irqflags,
- 		udc->fields[i] =3D f;
- 	}
-=20
-+	hcd->memory_layout =3D &isp176x_memory_conf;
-+
- 	isp1760_init_core(isp);
-=20
- 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 76fed6e062ed..0f54a989dbed 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -354,39 +354,29 @@ static void ptd_write(void __iomem *base, u32 ptd_=
offset, u32 slot,
- /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
- static void init_memory(struct isp1760_hcd *priv)
- {
--	int i, curr;
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int i, j, curr;
- 	u32 payload_addr;
-=20
- 	payload_addr =3D PAYLOAD_OFFSET;
--	for (i =3D 0; i < BLOCK_1_NUM; i++) {
--		priv->memory_pool[i].start =3D payload_addr;
--		priv->memory_pool[i].size =3D BLOCK_1_SIZE;
--		priv->memory_pool[i].free =3D 1;
--		payload_addr +=3D priv->memory_pool[i].size;
--	}
--
--	curr =3D i;
--	for (i =3D 0; i < BLOCK_2_NUM; i++) {
--		priv->memory_pool[curr + i].start =3D payload_addr;
--		priv->memory_pool[curr + i].size =3D BLOCK_2_SIZE;
--		priv->memory_pool[curr + i].free =3D 1;
--		payload_addr +=3D priv->memory_pool[curr + i].size;
--	}
-=20
--	curr =3D i;
--	for (i =3D 0; i < BLOCK_3_NUM; i++) {
--		priv->memory_pool[curr + i].start =3D payload_addr;
--		priv->memory_pool[curr + i].size =3D BLOCK_3_SIZE;
--		priv->memory_pool[curr + i].free =3D 1;
--		payload_addr +=3D priv->memory_pool[curr + i].size;
-+	for (i =3D 0, curr =3D 0; i < ARRAY_SIZE(mem->blocks); i++) {
-+		for (j =3D 0; j < mem->blocks[i]; j++, curr++) {
-+			priv->memory_pool[curr + j].start =3D payload_addr;
-+			priv->memory_pool[curr + j].size =3D mem->blocks_size[i];
-+			priv->memory_pool[curr + j].free =3D 1;
-+			payload_addr +=3D priv->memory_pool[curr + j].size;
-+		}
- 	}
-=20
--	WARN_ON(payload_addr - priv->memory_pool[0].start > PAYLOAD_AREA_SIZE)=
;
-+	WARN_ON(payload_addr - priv->memory_pool[0].start >
-+		mem->payload_area_size);
- }
-=20
- static void alloc_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int i;
-=20
- 	WARN_ON(qtd->payload_addr);
-@@ -394,7 +384,7 @@ static void alloc_mem(struct usb_hcd *hcd, struct is=
p1760_qtd *qtd)
- 	if (!qtd->length)
- 		return;
-=20
--	for (i =3D 0; i < BLOCKS; i++) {
-+	for (i =3D 0; i < mem->payload_blocks; i++) {
- 		if (priv->memory_pool[i].size >=3D qtd->length &&
- 				priv->memory_pool[i].free) {
- 			priv->memory_pool[i].free =3D 0;
-@@ -407,12 +397,13 @@ static void alloc_mem(struct usb_hcd *hcd, struct =
isp1760_qtd *qtd)
- static void free_mem(struct usb_hcd *hcd, struct isp1760_qtd *qtd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int i;
-=20
- 	if (!qtd->payload_addr)
- 		return;
-=20
--	for (i =3D 0; i < BLOCKS; i++) {
-+	for (i =3D 0; i < mem->payload_blocks; i++) {
- 		if (priv->memory_pool[i].start =3D=3D qtd->payload_addr) {
- 			WARN_ON(priv->memory_pool[i].free);
- 			priv->memory_pool[i].free =3D 1;
-@@ -1403,8 +1394,6 @@ static int qtd_fill(struct isp1760_qtd *qtd, void =
*databuffer, size_t len)
- {
- 	qtd->data_buffer =3D databuffer;
-=20
--	if (len > MAX_PAYLOAD_SIZE)
--		len =3D MAX_PAYLOAD_SIZE;
- 	qtd->length =3D len;
-=20
- 	return qtd->length;
-@@ -1428,6 +1417,8 @@ static void qtd_list_free(struct list_head *qtd_li=
st)
- static void packetize_urb(struct usb_hcd *hcd,
- 		struct urb *urb, struct list_head *head, gfp_t flags)
- {
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	struct isp1760_qtd *qtd;
- 	void *buf;
- 	int len, maxpacketsize;
-@@ -1480,6 +1471,10 @@ static void packetize_urb(struct usb_hcd *hcd,
- 		qtd =3D qtd_alloc(flags, urb, packet_type);
- 		if (!qtd)
- 			goto cleanup;
-+
-+		if (len > mem->blocks_size[ISP176x_BLOCK_NUM - 1])
-+			len =3D mem->blocks_size[ISP176x_BLOCK_NUM - 1];
-+
- 		this_qtd_len =3D qtd_fill(qtd, buf, len);
- 		list_add_tail(&qtd->qtd_list, head);
-=20
-@@ -2209,6 +2204,7 @@ int isp1760_hcd_register(struct isp1760_hcd *priv,=
 struct resource *mem,
- 			 int irq, unsigned long irqflags,
- 			 struct device *dev)
- {
-+	const struct isp1760_memory_layout *mem_layout =3D priv->memory_layout=
;
- 	struct usb_hcd *hcd;
- 	int ret;
-=20
-@@ -2220,6 +2216,28 @@ int isp1760_hcd_register(struct isp1760_hcd *priv=
, struct resource *mem,
-=20
- 	priv->hcd =3D hcd;
-=20
-+	priv->memory_pool =3D kcalloc(mem_layout->payload_blocks,
-+				    sizeof(struct isp1760_memory_chunk),
-+				    GFP_KERNEL);
-+	if (!priv->memory_pool) {
-+		ret =3D -ENOMEM;
-+		goto put_hcd;
-+	}
-+
-+	priv->atl_slots =3D kcalloc(mem_layout->ptd_num,
-+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
-+	if (!priv->atl_slots) {
-+		ret =3D -ENOMEM;
-+		goto free_mem_pool;
-+	}
-+
-+	priv->int_slots =3D kcalloc(mem_layout->ptd_num,
-+				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
-+	if (!priv->int_slots) {
-+		ret =3D -ENOMEM;
-+		goto free_atl_slots;
-+	}
-+
- 	init_memory(priv);
-=20
- 	hcd->irq =3D irq;
-@@ -2231,13 +2249,19 @@ int isp1760_hcd_register(struct isp1760_hcd *pri=
v, struct resource *mem,
-=20
- 	ret =3D usb_add_hcd(hcd, irq, irqflags);
- 	if (ret)
--		goto error;
-+		goto free_int_slots;
-=20
- 	device_wakeup_enable(hcd->self.controller);
-=20
- 	return 0;
-=20
--error:
-+free_int_slots:
-+	kfree(priv->int_slots);
-+free_atl_slots:
-+	kfree(priv->atl_slots);
-+free_mem_pool:
-+	kfree(priv->memory_pool);
-+put_hcd:
- 	usb_put_hcd(hcd);
- 	return ret;
- }
-@@ -2249,4 +2273,7 @@ void isp1760_hcd_unregister(struct isp1760_hcd *pr=
iv)
-=20
- 	usb_remove_hcd(priv->hcd);
- 	usb_put_hcd(priv->hcd);
-+	kfree(priv->atl_slots);
-+	kfree(priv->int_slots);
-+	kfree(priv->memory_pool);
- }
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-index 7a1f4f2607be..e5e784b9046b 100644
---- a/drivers/usb/isp1760/isp1760-hcd.h
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -12,24 +12,6 @@ struct isp1760_qtd;
- struct resource;
- struct usb_hcd;
-=20
--/*
-- * 60kb divided in:
-- * - 32 blocks @ 256  bytes
-- * - 20 blocks @ 1024 bytes
-- * -  4 blocks @ 8192 bytes
-- */
--
--#define BLOCK_1_NUM 32
--#define BLOCK_2_NUM 20
--#define BLOCK_3_NUM 4
--
--#define BLOCK_1_SIZE 256
--#define BLOCK_2_SIZE 1024
--#define BLOCK_3_SIZE 8192
--#define BLOCKS (BLOCK_1_NUM + BLOCK_2_NUM + BLOCK_3_NUM)
--#define MAX_PAYLOAD_SIZE BLOCK_3_SIZE
--#define PAYLOAD_AREA_SIZE 0xf000
--
- struct isp1760_slotinfo {
- 	struct isp1760_qh *qh;
- 	struct isp1760_qtd *qtd;
-@@ -37,6 +19,17 @@ struct isp1760_slotinfo {
- };
-=20
- /* chip memory management */
-+#define ISP176x_BLOCK_NUM 3
-+
-+struct isp1760_memory_layout {
-+	unsigned int blocks[ISP176x_BLOCK_NUM];
-+	unsigned int blocks_size[ISP176x_BLOCK_NUM];
-+
-+	unsigned int ptd_num;
-+	unsigned int payload_blocks;
-+	unsigned int payload_area_size;
-+};
-+
- struct isp1760_memory_chunk {
- 	unsigned int start;
- 	unsigned int size;
-@@ -59,12 +52,14 @@ struct isp1760_hcd {
- 	struct regmap		*regs;
- 	struct regmap_field	*fields[HC_FIELD_MAX];
-=20
-+	const struct isp1760_memory_layout	*memory_layout;
-+
- 	spinlock_t		lock;
--	struct isp1760_slotinfo	atl_slots[32];
-+	struct isp1760_slotinfo	*atl_slots;
- 	int			atl_done_map;
--	struct isp1760_slotinfo	int_slots[32];
-+	struct isp1760_slotinfo	*int_slots;
- 	int			int_done_map;
--	struct isp1760_memory_chunk memory_pool[BLOCKS];
-+	struct isp1760_memory_chunk *memory_pool;
- 	struct list_head	qh_list[QH_END];
-=20
- 	/* periodic schedule support */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0020-usb=
-isp1760-add-support-for-isp1763.patch b/meta-arm-bsp/recipes-kernel/linu=
x/files/corstone700/0020-usb-isp1760-add-support-for-isp1763.patch
deleted file mode 100644
index eef6abf0..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/corstone700/0020-usb-isp176=
0-add-support-for-isp1763.patch
+++ /dev/null
@@ -1,1755 +0,0 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From bc76719de2c28375274a5c529f36a405532106f0 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 15 Jul 2020 01:28:09 +0100
-Subject: [PATCH 20/20] usb: isp1760: add support for isp1763
-
-isp1763 have some differences from the isp1760, 8 bit address for
-registers and 16 bit for values, no bulk access to memory addresses,
-16 PTD's instead of 32.
-
-Following the regmap work done before add the registers, memory access
-and add the functions to support differences in setup sequences.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
----
- drivers/usb/isp1760/isp1760-core.c | 118 +++++-
- drivers/usb/isp1760/isp1760-core.h |   4 +-
- drivers/usb/isp1760/isp1760-hcd.c  | 622 ++++++++++++++++++++++-------
- drivers/usb/isp1760/isp1760-hcd.h  |   6 +-
- drivers/usb/isp1760/isp1760-if.c   |  15 +-
- drivers/usb/isp1760/isp1760-regs.h | 240 +++++++++--
- include/linux/usb/isp1760.h        |   2 +
- 7 files changed, 799 insertions(+), 208 deletions(-)
-
-diff --git a/drivers/usb/isp1760/isp1760-core.c b/drivers/usb/isp1760/is=
p1760-core.c
-index 88f233c11397..c26a586c0dca 100644
---- a/drivers/usb/isp1760/isp1760-core.c
-+++ b/drivers/usb/isp1760/isp1760-core.c
-@@ -25,7 +25,7 @@
- #include "isp1760-regs.h"
- #include "isp1760-udc.h"
-=20
--static void isp1760_init_core(struct isp1760_device *isp)
-+static int isp1760_init_core(struct isp1760_device *isp)
- {
- 	struct isp1760_hcd *hcd =3D &isp->hcd;
- 	struct isp1760_udc *udc =3D &isp->udc;
-@@ -45,8 +45,25 @@ static void isp1760_init_core(struct isp1760_device *=
isp)
- 	msleep(100);
-=20
- 	/* Setup HW Mode Control: This assumes a level active-low interrupt */
-+	if ((isp->devflags & ISP1760_FLAG_BUS_WIDTH_8) && !hcd->is_isp1763) {
-+		dev_err(isp->dev, "8bit bus width not supported\n");
-+		return -EINVAL;
-+	}
-+
-+	if ((isp->devflags & ISP1760_FLAG_BUS_WIDTH_16) && hcd->is_isp1763) {
-+		dev_err(isp->dev, "16bit bus width already the reset value\n");
-+		return -EINVAL;
-+	}
-+
-+	if ((isp->devflags & ISP1760_FLAG_ANALOG_OC) && hcd->is_isp1763) {
-+		dev_err(isp->dev, "isp1763 analog overcurrent not available\n");
-+		return -EINVAL;
-+	}
-+
- 	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_16)
- 		isp1760_field_clear(hcd->fields, HW_DATA_BUS_WIDTH);
-+	if (isp->devflags & ISP1760_FLAG_BUS_WIDTH_8)
-+		isp1760_field_set(hcd->fields, HW_DATA_BUS_WIDTH);
- 	if (isp->devflags & ISP1760_FLAG_ANALOG_OC)
- 		isp1760_field_set(hcd->fields, HW_ANA_DIGI_OC);
- 	if (isp->devflags & ISP1760_FLAG_DACK_POL_HIGH)
-@@ -78,18 +95,24 @@ static void isp1760_init_core(struct isp1760_device =
*isp)
- 	 */
- 	if ((isp->devflags & ISP1760_FLAG_ISP1761) &&
- 	    (isp->devflags & ISP1760_FLAG_OTG_EN)) {
--		isp1760_field_set(udc->fields, HW_DM_PULLDOWN);
--		isp1760_field_set(udc->fields, HW_DP_PULLDOWN);
--		isp1760_field_set(udc->fields, HW_OTG_DISABLE);
--	} else if (isp->devflags & ISP1760_FLAG_ISP1761) {
--		isp1760_field_set(udc->fields, HW_SW_SEL_HC_DC);
--		isp1760_field_set(udc->fields, HW_VBUS_DRV);
--		isp1760_field_set(udc->fields, HW_SEL_CP_EXT);
-+		isp1760_field_set(hcd->fields, HW_DM_PULLDOWN);
-+		isp1760_field_set(hcd->fields, HW_DP_PULLDOWN);
-+		isp1760_field_set(hcd->fields, HW_OTG_DISABLE);
-+	} else if (!hcd->is_isp1763){
-+		isp1760_field_set(hcd->fields, HW_SW_SEL_HC_DC);
-+		isp1760_field_set(hcd->fields, HW_VBUS_DRV);
-+		isp1760_field_set(hcd->fields, HW_SEL_CP_EXT);
- 	}
-=20
--	dev_info(isp->dev, "bus width: %u, oc: %s\n",
-+	dev_info(isp->dev, "%s bus width: %u, oc: %s\n",
-+		 hcd->is_isp1763 ? "isp1763" : "isp1760",
-+		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_8 ? 8 :
-+		 hcd->is_isp1763 ? 16 :
- 		 isp->devflags & ISP1760_FLAG_BUS_WIDTH_16 ? 16 : 32,
-+		 hcd->is_isp1763 ? "not available" :
- 		 isp->devflags & ISP1760_FLAG_ANALOG_OC ? "analog" : "digital");
-+
-+	return 0;
- }
-=20
- void isp1760_set_pullup(struct isp1760_device *isp, bool enable)
-@@ -103,6 +126,8 @@ void isp1760_set_pullup(struct isp1760_device *isp, =
bool enable)
- }
-=20
- /*
-+ * ISP1760/61:
-+ *
-  * 60kb divided in:
-  * - 32 blocks @ 256  bytes
-  * - 20 blocks @ 1024 bytes
-@@ -116,38 +141,72 @@ static const struct isp1760_memory_layout isp176x_=
memory_conf =3D {
- 	.blocks[2]		=3D 4,
- 	.blocks_size[2]		=3D 8192,
-=20
--	.ptd_num		=3D 32,
-+	.slot_num		=3D 32,
- 	.payload_blocks		=3D 32 + 20 + 4,
- 	.payload_area_size	=3D 0xf000,
- };
-=20
-+/*
-+ * ISP1763:
-+ *
-+ * 20kb divided in:
-+ * - 8 blocks @ 256  bytes
-+ * - 2 blocks @ 1024 bytes
-+ * - 4 blocks @ 4096 bytes
-+ */
-+static const struct isp1760_memory_layout isp1763_memory_conf =3D {
-+	.blocks[0]		=3D 8,
-+	.blocks_size[0]		=3D 256,
-+	.blocks[1]		=3D 2,
-+	.blocks_size[1]		=3D 1024,
-+	.blocks[2]		=3D 4,
-+	.blocks_size[2]		=3D 4096,
-+
-+	.slot_num		=3D 16,
-+	.payload_blocks		=3D 8 + 2 + 4,
-+	.payload_area_size	=3D 0x5000,
-+};
-+
- static const struct regmap_config isp1760_hc_regmap_conf =3D {
- 	.name =3D "isp1760-hc",
- 	.reg_bits =3D 16,
-+	.reg_stride =3D 4,
- 	.val_bits =3D 32,
- 	.fast_io =3D true,
--	.max_register =3D ISP176x_HC_MEMORY,
-+	.max_register =3D ISP176x_HC_OTG_CTRL_CLEAR,
- 	.volatile_table =3D &isp176x_hc_volatile_table,
- };
-=20
--static const struct regmap_config isp1760_dc_regmap_conf =3D {
--	.name =3D "isp1760-dc",
-+static const struct regmap_config isp1763_hc_regmap_conf =3D {
-+	.name =3D "isp1763-hc",
-+	.reg_bits =3D 8,
-+	.reg_stride =3D 2,
-+	.val_bits =3D 16,
-+	.fast_io =3D true,
-+	.max_register =3D ISP1763_HC_OTG_CTRL_CLEAR,
-+	.volatile_table =3D &isp1763_hc_volatile_table,
-+};
-+
-+static const struct regmap_config isp1761_dc_regmap_conf =3D {
-+	.name =3D "isp1761-dc",
- 	.reg_bits =3D 16,
-+	.reg_stride =3D 4,
- 	.val_bits =3D 32,
- 	.fast_io =3D true,
--	.max_register =3D ISP1761_DC_OTG_CTRL_CLEAR,
-+	.max_register =3D ISP176x_DC_TESTMODE,
- 	.volatile_table =3D &isp176x_dc_volatile_table,
- };
-=20
- int isp1760_register(struct resource *mem, int irq, unsigned long irqfl=
ags,
- 		     struct device *dev, unsigned int devflags)
- {
-+	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
-+	const struct regmap_config *hc_regmap;
-+	const struct reg_field *hc_reg_fields;
- 	struct isp1760_device *isp;
- 	struct isp1760_hcd *hcd;
- 	struct isp1760_udc *udc;
--	bool udc_disabled =3D !(devflags & ISP1760_FLAG_ISP1761);
- 	struct regmap_field *f;
--	void __iomem *base;
- 	int ret;
- 	int i;
-=20
-@@ -168,6 +227,16 @@ int isp1760_register(struct resource *mem, int irq,=
 unsigned long irqflags,
- 	hcd =3D &isp->hcd;
- 	udc =3D &isp->udc;
-=20
-+	hcd->is_isp1763 =3D !!(devflags & ISP1760_FLAG_ISP1763);
-+
-+	if (hcd->is_isp1763) {
-+		hc_regmap =3D &isp1763_hc_regmap_conf;
-+		hc_reg_fields =3D &isp1763_hc_reg_fields[0];
-+	} else {
-+		hc_regmap =3D &isp1760_hc_regmap_conf;
-+		hc_reg_fields =3D &isp1760_hc_reg_fields[0];
-+	}
-+
- 	isp->rst_gpio =3D devm_gpiod_get_optional(dev, NULL, GPIOD_OUT_HIGH);
- 	if (IS_ERR(isp->rst_gpio))
- 		return PTR_ERR(isp->rst_gpio);
-@@ -176,20 +245,20 @@ int isp1760_register(struct resource *mem, int irq=
, unsigned long irqflags,
- 	if (IS_ERR(hcd->base))
- 		return PTR_ERR(hcd->base);
-=20
--	hcd->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_hc_regmap_conf=
);
-+	hcd->regs =3D devm_regmap_init_mmio(dev, hcd->base, hc_regmap);
- 	if (IS_ERR(hcd->regs))
- 		return PTR_ERR(hcd->regs);
-=20
- 	for (i =3D 0; i < HC_FIELD_MAX; i++) {
--		f =3D devm_regmap_field_alloc(dev, hcd->regs,
--					    isp1760_hc_reg_fields[i]);
-+		f =3D devm_regmap_field_alloc(dev, hcd->regs, hc_reg_fields[i]);
- 		if (IS_ERR(f))
- 			return PTR_ERR(f);
-=20
- 		hcd->fields[i] =3D f;
- 	}
-=20
--	udc->regs =3D devm_regmap_init_mmio(dev, base, &isp1760_dc_regmap_conf=
);
-+	udc->regs =3D devm_regmap_init_mmio(dev, hcd->base,
-+					  &isp1761_dc_regmap_conf);
- 	if (IS_ERR(udc->regs))
- 		return PTR_ERR(udc->regs);
-=20
-@@ -202,9 +271,14 @@ int isp1760_register(struct resource *mem, int irq,=
 unsigned long irqflags,
- 		udc->fields[i] =3D f;
- 	}
-=20
--	hcd->memory_layout =3D &isp176x_memory_conf;
-+	if (hcd->is_isp1763)
-+		hcd->memory_layout =3D &isp1763_memory_conf;
-+	else
-+		hcd->memory_layout =3D &isp176x_memory_conf;
-=20
--	isp1760_init_core(isp);
-+	ret =3D isp1760_init_core(isp);
-+	if (ret < 0)
-+		return ret;
-=20
- 	if (IS_ENABLED(CONFIG_USB_ISP1760_HCD) && !usb_disabled()) {
- 		ret =3D isp1760_hcd_register(hcd, mem, irq,
-diff --git a/drivers/usb/isp1760/isp1760-core.h b/drivers/usb/isp1760/is=
p1760-core.h
-index 0cae69b4792c..70a1c56b2c5f 100644
---- a/drivers/usb/isp1760/isp1760-core.h
-+++ b/drivers/usb/isp1760/isp1760-core.h
-@@ -35,6 +35,8 @@ struct gpio_desc;
- #define ISP1760_FLAG_ISP1761		0x00000040 /* Chip is ISP1761 */
- #define ISP1760_FLAG_INTR_POL_HIGH	0x00000080 /* Interrupt polarity act=
ive high */
- #define ISP1760_FLAG_INTR_EDGE_TRIG	0x00000100 /* Interrupt edge trigge=
red */
-+#define ISP1760_FLAG_ISP1763		0x00000200 /* Chip is ISP1763 */
-+#define ISP1760_FLAG_BUS_WIDTH_8	0x00000400 /* 8-bit data bus width */
-=20
- struct isp1760_device {
- 	struct device *dev;
-@@ -62,7 +64,7 @@ inline static u32 isp1760_field_read(struct regmap_fie=
ld **fields, u32 field)
- }
-=20
- inline static void isp1760_field_write(struct regmap_field **fields, u3=
2 field,
--				u32 val)
-+				       u32 val)
- {
- 	regmap_field_write(fields[field], val);
- }
-diff --git a/drivers/usb/isp1760/isp1760-hcd.c b/drivers/usb/isp1760/isp=
1760-hcd.c
-index 0f54a989dbed..c78e007578b6 100644
---- a/drivers/usb/isp1760/isp1760-hcd.c
-+++ b/drivers/usb/isp1760/isp1760-hcd.c
-@@ -92,7 +92,7 @@ struct ptd {
- #define TO_DW2_RL(x)			((x) << 25)
- #define FROM_DW2_RL(x)			(((x) >> 25) & 0xf)
- /* DW3 */
--#define FROM_DW3_NRBYTESTRANSFERRED(x)		((x) & 0x7fff)
-+#define FROM_DW3_NRBYTESTRANSFERRED(x)		((x) & 0x3fff)
- #define FROM_DW3_SCS_NRBYTESTRANSFERRED(x)	((x) & 0x07ff)
- #define TO_DW3_NAKCOUNT(x)		((x) << 19)
- #define FROM_DW3_NAKCOUNT(x)		(((x) >> 19) & 0xf)
-@@ -119,7 +119,7 @@ struct ptd {
- /* Errata 1 */
- #define RL_COUNTER	(0)
- #define NAK_COUNTER	(0)
--#define ERR_COUNTER	(2)
-+#define ERR_COUNTER	(3)
-=20
- struct isp1760_qtd {
- 	u8 packet_type;
-@@ -171,10 +171,30 @@ static u32 isp1760_hcd_read(struct usb_hcd *hcd, u=
32 field)
- 	return isp1760_field_read(priv->fields, field);
- }
-=20
-+/*
-+* We need, in isp1763, to write directly the values to the portsc1
-+* register so it will make the other values to trigger.
-+*/
-+static void isp1760_hcd_portsc1_set_clear(struct isp1760_hcd *priv, u32=
 field,
-+					  u32 val)
-+{
-+	u32 bit =3D isp1763_hc_portsc1_fields[field];
-+	u32 temp =3D readl(priv->base + ISP1763_HC_PORTSC1);
-+
-+	if (val)
-+		writel(temp | bit, priv->base + ISP1763_HC_PORTSC1);
-+	else
-+		writel(temp & ~bit, priv->base + ISP1763_HC_PORTSC1);
-+}
-+
- static void isp1760_hcd_write(struct usb_hcd *hcd, u32 field, u32 val)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-=20
-+	if (unlikely(priv->is_isp1763 &&
-+		     (field >=3D PORT_OWNER && field <=3D PORT_CONNECT)))
-+		return isp1760_hcd_portsc1_set_clear(priv, field, val);
-+
- 	isp1760_field_write(priv->fields, field, val);
- }
-=20
-@@ -188,28 +208,40 @@ static void isp1760_hcd_clear(struct usb_hcd *hcd,=
 u32 field)
- 	isp1760_hcd_write(hcd, field, 0);
- }
-=20
--static int isp1760_hcd_set_poll_timeout(struct usb_hcd *hcd, u32 field,
--					   u32 timeout_us)
-+static int isp1760_hcd_set_and_wait(struct usb_hcd *hcd, u32 field,
-+				    u32 timeout_us)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	unsigned int val;
-+	u32 val;
-=20
- 	isp1760_hcd_set(hcd, field);
-=20
--	return regmap_field_read_poll_timeout(priv->fields[field], val, 1, 1,
--					      timeout_us);
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      val, 10, timeout_us);
- }
-=20
--static int isp1760_hcd_clear_poll_timeout(struct usb_hcd *hcd, u32 fiel=
d,
--					     u32 timeout_us)
-+static int isp1760_hcd_set_and_wait_swap(struct usb_hcd *hcd, u32 field=
,
-+					 u32 timeout_us)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
--	unsigned int val;
-+	u32 val;
-+
-+	isp1760_hcd_set(hcd, field);
-+
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      !val, 10, timeout_us);
-+}
-+
-+static int isp1760_hcd_clear_and_wait(struct usb_hcd *hcd, u32 field,
-+				      u32 timeout_us)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 val;
-=20
- 	isp1760_hcd_clear(hcd, field);
-=20
--	return regmap_field_read_poll_timeout(priv->fields[field], val, 0, 1,
--					      timeout_us);
-+	return regmap_field_read_poll_timeout(priv->fields[field], val,
-+					      !val, 10, timeout_us);
- }
-=20
- static bool isp1760_hcd_is_set(struct usb_hcd *hcd, u32 field)
-@@ -217,12 +249,32 @@ static bool isp1760_hcd_is_set(struct usb_hcd *hcd=
, u32 field)
- 	return !!isp1760_hcd_read(hcd, field);
- }
-=20
-+static bool isp1760_hcd_ppc_is_set(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (priv->is_isp1763)
-+		return true;
-+
-+	return isp1760_hcd_is_set(hcd, HCS_PPC);
-+}
-+
-+static u32 isp1760_hcd_n_ports(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (priv->is_isp1763)
-+		return 1;
-+
-+	return isp1760_hcd_read(hcd, HCS_N_PORTS);
-+}
-+
- /*
-  * Access functions for isp176x memory (offset >=3D 0x0400).
-  *
-  * bank_reads8() reads memory locations prefetched by an earlier write =
to
-  * HC_MEMORY_REG (see isp176x datasheet). Unless you want to do fancy m=
ulti-
-- * bank optimizations, you should use the more generic mem_reads8() bel=
ow.
-+ * bank optimizations, you should use the more generic mem_read() below=
.
-  *
-  * For access to ptd memory, use the specialized ptd_read() and ptd_wri=
te()
-  * below.
-@@ -277,19 +329,61 @@ static void bank_reads8(void __iomem *src_base, u3=
2 src_offset, u32 bank_addr,
- 	}
- }
-=20
--static void mem_reads8(struct usb_hcd *hcd, void __iomem *src_base,
--		       u32 src_offset, void *dst, u32 bytes)
-+static void isp1760_mem_read(struct usb_hcd *hcd, u32 src_offset, void =
*dst,
-+			     u32 bytes)
- {
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
- 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
- 	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
-+	ndelay(100);
-=20
--	ndelay(90);
-+	bank_reads8(priv->base, src_offset, ISP_BANK_0, dst, bytes);
-+}
-+
-+/*
-+ * ISP1763 does not have the banks direct host controller memory access=
,
-+ * needs to use the HC_DATA register. Add data read/write according to =
this,
-+ * and also adjust 16bit access, here is assumed that the address was a=
lready
-+ * written in the MEM_START_ADDR field.
-+ */
-+static void isp1763_mem_read(struct usb_hcd *hcd, u16 srcaddr,
-+			     u16 *dstptr, u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	/* Write the starting device address to the hcd memory register */
-+	//reg_write16(base, HC_MEMORY_REG, srcaddr);
-+	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, srcaddr);
-+	ndelay(100); /* Delay between consecutive access */
-+
-+	/* As long there are at least 16-bit to read ... */
-+	while (bytes >=3D 2) {
-+		*dstptr =3D __raw_readw(priv->base + ISP1763_HC_DATA);
-+		bytes -=3D 2;
-+		dstptr++;
-+	}
-+
-+	/* If there are no more bytes to read, return */
-+	if (bytes <=3D 0)
-+		return;
-=20
--	bank_reads8(src_base, src_offset, ISP_BANK_0, dst, bytes);
-+	*((u8 *)dstptr) =3D (u8)(readw(priv->base + ISP1763_HC_DATA) & 0xFF);
- }
-=20
--static void mem_writes8(void __iomem *dst_base, u32 dst_offset,
--						__u32 const *src, u32 bytes)
-+static void mem_read(struct usb_hcd *hcd, u32 src_offset, __u32 *dst,
-+		     u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_mem_read(hcd, src_offset, (u16 *)dst, bytes);
-+
-+	isp1763_mem_read(hcd, (u16)src_offset, (u16 *)dst, bytes);
-+}
-+
-+static void isp1760_mem_write(void __iomem *dst_base, u32 dst_offset,
-+			      __u32 const *src, u32 bytes)
- {
- 	__u32 __iomem *dst;
-=20
-@@ -323,33 +417,136 @@ static void mem_writes8(void __iomem *dst_base, u=
32 dst_offset,
- 		__raw_writel(*src, dst);
- }
-=20
-+static void isp1763_mem_write(struct usb_hcd *hcd, u16 dstaddr, u16 *sr=
c,
-+			      u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	/* Write the starting device address to the hcd memory register */
-+	isp1760_reg_write(priv->regs, ISP1763_HC_MEMORY, dstaddr);
-+	ndelay(100); /* Delay between consecutive access */
-+
-+	while (bytes >=3D 2) {
-+		/* Get and write the data; then adjust the data ptr and len */
-+		__raw_writew(*src, priv->base + ISP1763_HC_DATA);
-+		bytes -=3D 2;
-+		src++;
-+	}
-+
-+	/* If there are no more bytes to process, return */
-+	if (bytes <=3D 0)
-+		return;
-+
-+	/*
-+	 * The only way to get here is if there is a single byte left,
-+	 * get it and write it to the data reg;
-+	 */
-+	writew(*((u8 *)src), priv->base + ISP1763_HC_DATA);
-+}
-+
-+static void mem_write(struct usb_hcd *hcd, u32 dst_offset, __u32 *src,
-+		      u32 bytes)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_mem_write(priv->base, dst_offset, src, bytes);
-+
-+	isp1763_mem_write(hcd, dst_offset, (u16 *)src, bytes);
-+}
-+
-+
- /*
-  * Read and write ptds. 'ptd_offset' should be one of ISO_PTD_OFFSET,
-- * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32.
-+ * INT_PTD_OFFSET, and ATL_PTD_OFFSET. 'slot' should be less than 32/16=
.
-  */
--static void ptd_read(struct usb_hcd *hcd, void __iomem *base,
--		     u32 ptd_offset, u32 slot, struct ptd *ptd)
-+static void isp1760_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 s=
lot,
-+			     struct ptd *ptd)
- {
-+	u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
- 	isp1760_hcd_write(hcd, MEM_BANK_SEL, ISP_BANK_0);
--	isp1760_hcd_write(hcd, MEM_START_ADDR,
--			  ptd_offset + slot * sizeof(*ptd));
-+	isp1760_hcd_write(hcd, MEM_START_ADDR, src_offset);
- 	ndelay(90);
--	bank_reads8(base, ptd_offset + slot*sizeof(*ptd), ISP_BANK_0,
--						(void *) ptd, sizeof(*ptd));
-+
-+	bank_reads8(priv->base, src_offset, ISP_BANK_0, (void *) ptd,
-+		    sizeof(*ptd));
-+}
-+
-+static void isp1763_ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 s=
lot,
-+			     struct ptd *ptd)
-+{
-+	u16 src_offset =3D ptd_offset + slot * sizeof(*ptd);
-+	struct ptd le32_ptd;
-+
-+	isp1763_mem_read(hcd, src_offset, (u16 *)&le32_ptd, sizeof(le32_ptd));
-+	/* Normalize the data obtained */
-+	ptd->dw0 =3D le32_to_cpu(le32_ptd.dw0);
-+	ptd->dw1 =3D le32_to_cpu(le32_ptd.dw1);
-+	ptd->dw2 =3D le32_to_cpu(le32_ptd.dw2);
-+	ptd->dw3 =3D le32_to_cpu(le32_ptd.dw3);
-+	ptd->dw4 =3D le32_to_cpu(le32_ptd.dw4);
-+	ptd->dw5 =3D le32_to_cpu(le32_ptd.dw5);
-+	ptd->dw6 =3D le32_to_cpu(le32_ptd.dw6);
-+	ptd->dw7 =3D le32_to_cpu(le32_ptd.dw7);
-+}
-+
-+static void ptd_read(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
-+		     struct ptd *ptd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_ptd_read(hcd, ptd_offset, slot, ptd);
-+
-+	isp1763_ptd_read(hcd, ptd_offset, slot, ptd);
- }
-=20
--static void ptd_write(void __iomem *base, u32 ptd_offset, u32 slot,
--								struct ptd *ptd)
-+static void isp1763_ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 =
slot,
-+			      struct ptd *cpu_ptd)
- {
--	mem_writes8(base, ptd_offset + slot*sizeof(*ptd) + sizeof(ptd->dw0),
--						&ptd->dw1, 7*sizeof(ptd->dw1));
--	/* Make sure dw0 gets written last (after other dw's and after payload=
)
--	   since it contains the enable bit */
-+	u16 dst_offset =3D ptd_offset + slot * sizeof(*cpu_ptd);
-+	struct ptd ptd;
-+
-+	ptd.dw0 =3D cpu_to_le32(cpu_ptd->dw0);
-+	ptd.dw1 =3D cpu_to_le32(cpu_ptd->dw1);
-+	ptd.dw2 =3D cpu_to_le32(cpu_ptd->dw2);
-+	ptd.dw3 =3D cpu_to_le32(cpu_ptd->dw3);
-+	ptd.dw4 =3D cpu_to_le32(cpu_ptd->dw4);
-+	ptd.dw5 =3D cpu_to_le32(cpu_ptd->dw5);
-+	ptd.dw6 =3D cpu_to_le32(cpu_ptd->dw6);
-+	ptd.dw7 =3D cpu_to_le32(cpu_ptd->dw7);
-+
-+	isp1763_mem_write(hcd, dst_offset,  (u16 *)&ptd.dw0,
-+			  8 * sizeof(ptd.dw0));
-+}
-+
-+static void isp1760_ptd_write(void __iomem *base, u32 ptd_offset, u32 s=
lot,
-+			      struct ptd *ptd)
-+{
-+	u32 dst_offset =3D ptd_offset + slot * sizeof(*ptd);
-+
-+	/*
-+	 * Make sure dw0 gets written last (after other dw's and after payload=
)
-+	 *  since it contains the enable bit
-+	 */
-+	isp1760_mem_write(base, dst_offset + sizeof(ptd->dw0), &ptd->dw1,
-+			  7 * sizeof(ptd->dw1));
- 	wmb();
--	mem_writes8(base, ptd_offset + slot*sizeof(*ptd), &ptd->dw0,
--							sizeof(ptd->dw0));
-+	isp1760_mem_write(base, dst_offset, &ptd->dw0, sizeof(ptd->dw0));
- }
-=20
-+static void ptd_write(struct usb_hcd *hcd, u32 ptd_offset, u32 slot,
-+		      struct ptd *ptd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+
-+	if (!priv->is_isp1763)
-+		return isp1760_ptd_write(priv->base, ptd_offset, slot, ptd);
-+
-+	isp1763_ptd_write(hcd, ptd_offset, slot, ptd);
-+}
-=20
- /* memory management of the 60kb on the chip from 0x1000 to 0xffff */
- static void init_memory(struct isp1760_hcd *priv)
-@@ -426,7 +623,7 @@ static int ehci_reset(struct usb_hcd *hcd)
- 	hcd->state =3D HC_STATE_HALT;
- 	priv->next_statechange =3D jiffies;
-=20
--	return isp1760_hcd_set_poll_timeout(hcd, CMD_RESET, 250 * 1000);
-+	return isp1760_hcd_set_and_wait_swap(hcd, CMD_RESET, 250 * 1000);
- }
-=20
- static struct isp1760_qh *qh_alloc(gfp_t flags)
-@@ -457,7 +654,6 @@ static int priv_init(struct usb_hcd *hcd)
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	u32 isoc_cache;
- 	u32 isoc_thres;
--
- 	int i;
-=20
- 	spin_lock_init(&priv->lock);
-@@ -471,9 +667,14 @@ static int priv_init(struct usb_hcd *hcd)
- 	 */
- 	priv->periodic_size =3D DEFAULT_I_TDPS;
-=20
-+	if (priv->is_isp1763) {
-+		priv->i_thresh =3D 2;
-+		return 0;
-+	}
-+
- 	/* controllers may cache some of the periodic schedule ... */
--	isoc_cache =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_CACHE);
--	isoc_thres =3D isp1760_hcd_read(hcd->regs, HCC_ISOC_THRES);
-+	isoc_cache =3D isp1760_hcd_read(hcd, HCC_ISOC_CACHE);
-+	isoc_thres =3D isp1760_hcd_read(hcd, HCC_ISOC_THRES);
-=20
- 	/* full frame cache */
- 	if (isoc_cache)
-@@ -487,15 +688,22 @@ static int priv_init(struct usb_hcd *hcd)
- static int isp1760_hc_setup(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	u32 atx_reset;
- 	int result;
- 	u32 scratch;
-+	u32 pattern;
-=20
--	isp1760_reg_write(priv->regs, ISP176x_HC_SCRATCH, 0xdeadbabe);
-+	if (priv->is_isp1763)
-+		pattern =3D 0xdead;
-+	else
-+		pattern =3D 0xdeadbeef;
-+
-+	isp1760_hcd_write(hcd, HC_SCRATCH, pattern);
-=20
- 	/* Change bus pattern */
--	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
--	scratch =3D isp1760_reg_read(priv->regs, ISP176x_HC_SCRATCH);
--	if (scratch !=3D 0xdeadbabe) {
-+	scratch =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	scratch =3D isp1760_hcd_read(hcd, HC_SCRATCH);
-+	if (scratch !=3D pattern) {
- 		dev_err(hcd->self.controller, "Scratch test failed.\n");
- 		return -ENODEV;
- 	}
-@@ -508,13 +716,13 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	 * the host controller through the EHCI USB Command register. The devi=
ce
- 	 * has been reset in core code anyway, so this shouldn't matter.
- 	 */
--	isp1760_reg_write(priv->regs, ISP176x_HC_BUFFER_STATUS, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
--			  NO_TRANSFER_ACTIVE);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
--			  NO_TRANSFER_ACTIVE);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP,
--			  NO_TRANSFER_ACTIVE);
-+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
-+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
-+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-=20
- 	result =3D ehci_reset(hcd);
- 	if (result)
-@@ -523,11 +731,27 @@ static int isp1760_hc_setup(struct usb_hcd *hcd)
- 	/* Step 11 passed */
-=20
- 	/* ATL reset */
--	isp1760_hcd_set(hcd, ALL_ATX_RESET);
-+	if (priv->is_isp1763)
-+		atx_reset =3D SW_RESET_RESET_ATX;
-+	else
-+		atx_reset =3D ALL_ATX_RESET;
-+
-+	isp1760_hcd_set(hcd, atx_reset);
- 	mdelay(10);
--	isp1760_hcd_clear(hcd, ALL_ATX_RESET);
-+	isp1760_hcd_clear(hcd, atx_reset);
-=20
--	isp1760_hcd_set(hcd, HC_INT_ENABLE);
-+	if (priv->is_isp1763) {
-+		isp1760_hcd_set(hcd, HW_OTG_DISABLE);
-+		isp1760_hcd_set(hcd, HW_SW_SEL_HC_DC_CLEAR);
-+		isp1760_hcd_set(hcd, HW_HC_2_DIS_CLEAR);
-+		mdelay(10);
-+
-+		isp1760_hcd_set(hcd, HW_INTF_LOCK);
-+	}
-+
-+
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
-=20
- 	return priv_init(hcd);
- }
-@@ -747,45 +971,45 @@ static void start_bus_transfer(struct usb_hcd *hcd=
, u32 ptd_offset, int slot,
- 				struct ptd *ptd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int skip_map;
-=20
--	WARN_ON((slot < 0) || (slot > 31));
-+	WARN_ON((slot < 0) || (slot > mem->slot_num - 1));
- 	WARN_ON(qtd->length && !qtd->payload_addr);
- 	WARN_ON(slots[slot].qtd);
- 	WARN_ON(slots[slot].qh);
- 	WARN_ON(qtd->status !=3D QTD_PAYLOAD_ALLOC);
-=20
-+	if (priv->is_isp1763)
-+		ndelay(100);
-+
- 	/* Make sure done map has not triggered from some unlinked transfer */
- 	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
--						ISP176x_HC_ATL_PTD_DONEMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP,
-+				  skip_map | (1 << slot));
-+		priv->atl_done_map |=3D isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
- 		priv->atl_done_map &=3D ~(1 << slot);
- 	} else {
--		priv->int_done_map |=3D isp1760_reg_read(priv->regs,
--					       ISP176x_HC_INT_PTD_DONEMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP,
-+				  skip_map | (1 << slot));
-+		priv->int_done_map |=3D isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
- 		priv->int_done_map &=3D ~(1 << slot);
- 	}
-=20
-+	skip_map &=3D ~(1 << slot);
- 	qh->slot =3D slot;
- 	qtd->status =3D QTD_XFER_STARTED;
- 	slots[slot].timestamp =3D jiffies;
- 	slots[slot].qtd =3D qtd;
- 	slots[slot].qh =3D qh;
--	ptd_write(priv->base, ptd_offset, slot, ptd);
-+	ptd_write(hcd, ptd_offset, slot, ptd);
-=20
--	if (ptd_offset =3D=3D ATL_PTD_OFFSET) {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_ATL_PTD_SKIPMAP);
--		skip_map &=3D ~(1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
--				  skip_map);
--	} else {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_INT_PTD_SKIPMAP);
--		skip_map &=3D ~(1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
--				  skip_map);
--	}
-+	if (ptd_offset =3D=3D ATL_PTD_OFFSET)
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+	else
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
- }
-=20
- static int is_short_bulk(struct isp1760_qtd *qtd)
-@@ -797,7 +1021,6 @@ static int is_short_bulk(struct isp1760_qtd *qtd)
- static void collect_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh,
- 						struct list_head *urb_list)
- {
--	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	struct isp1760_qtd *qtd, *qtd_next;
- 	struct urb_listitem *urb_listitem;
- 	int last_qtd;
-@@ -815,10 +1038,9 @@ static void collect_qtds(struct usb_hcd *hcd, stru=
ct isp1760_qh *qh,
- 			if (qtd->actual_length) {
- 				switch (qtd->packet_type) {
- 				case IN_PID:
--					mem_reads8(hcd, priv->base,
--						   qtd->payload_addr,
--						   qtd->data_buffer,
--						   qtd->actual_length);
-+					mem_read(hcd, qtd->payload_addr,
-+						 qtd->data_buffer,
-+						 qtd->actual_length);
- 					/* Fall through */
- 				case OUT_PID:
- 					qtd->urb->actual_length +=3D
-@@ -862,6 +1084,8 @@ static void collect_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh,
- static void enqueue_qtds(struct usb_hcd *hcd, struct isp1760_qh *qh)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
-+	int slot_num =3D mem->slot_num;
- 	int ptd_offset;
- 	struct isp1760_slotinfo *slots;
- 	int curr_slot, free_slot;
-@@ -888,7 +1112,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh)
- 	}
-=20
- 	free_slot =3D -1;
--	for (curr_slot =3D 0; curr_slot < 32; curr_slot++) {
-+	for (curr_slot =3D 0; curr_slot < slot_num; curr_slot++) {
- 		if ((free_slot =3D=3D -1) && (slots[curr_slot].qtd =3D=3D NULL))
- 			free_slot =3D curr_slot;
- 		if (slots[curr_slot].qh =3D=3D qh)
-@@ -906,8 +1130,8 @@ static void enqueue_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh)
- 			if ((qtd->length) &&
- 			    ((qtd->packet_type =3D=3D SETUP_PID) ||
- 			     (qtd->packet_type =3D=3D OUT_PID))) {
--				mem_writes8(priv->base, qtd->payload_addr,
--						qtd->data_buffer, qtd->length);
-+				mem_write(hcd, qtd->payload_addr,
-+					  qtd->data_buffer, qtd->length);
- 			}
-=20
- 			qtd->status =3D QTD_PAYLOAD_ALLOC;
-@@ -920,7 +1144,7 @@ static void enqueue_qtds(struct usb_hcd *hcd, struc=
t isp1760_qh *qh)
- 					"available for transfer\n", __func__);
- */
- 			/* Start xfer for this endpoint if not already done */
--			if ((curr_slot > 31) && (free_slot > -1)) {
-+			if ((curr_slot > slot_num - 1) && (free_slot > -1)) {
- 				if (usb_pipeint(qtd->urb->pipe))
- 					create_ptd_int(qh, qtd, &ptd);
- 				else
-@@ -1107,9 +1331,9 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 	int modified;
- 	int skip_map;
-=20
--	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP);
-+	skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
- 	priv->int_done_map &=3D ~skip_map;
--	skip_map =3D isp1760_reg_read(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP);
-+	skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
- 	priv->atl_done_map &=3D ~skip_map;
-=20
- 	modified =3D priv->int_done_map || priv->atl_done_map;
-@@ -1127,7 +1351,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D INT_PTD_OFFSET;
--			ptd_read(hcd, priv->base, INT_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, INT_PTD_OFFSET, slot, &ptd);
- 			state =3D check_int_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		} else {
-@@ -1142,7 +1366,7 @@ static void handle_done_ptds(struct usb_hcd *hcd)
- 				continue;
- 			}
- 			ptd_offset =3D ATL_PTD_OFFSET;
--			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
- 			state =3D check_atl_transfer(hcd, &ptd,
- 							slots[slot].qtd->urb);
- 		}
-@@ -1243,19 +1467,18 @@ static irqreturn_t isp1760_irq(struct usb_hcd *h=
cd)
- 	if (!(hcd->state & HC_STATE_RUNNING))
- 		goto leave;
-=20
--	imask =3D isp1760_reg_read(priv->regs, ISP176x_HC_INTERRUPT);
-+	imask =3D isp1760_hcd_read(hcd, HC_INTERRUPT);
- 	if (unlikely(!imask))
- 		goto leave;
--	isp1760_reg_write(priv->regs, ISP176x_HC_INTERRUPT, imask); /* Clear *=
/
-+	isp1760_reg_write(priv->regs, ISP1763_HC_INTERRUPT, imask);
-=20
--	priv->int_done_map |=3D isp1760_reg_read(priv->regs,
--					       ISP176x_HC_INT_PTD_DONEMAP);
--	priv->atl_done_map |=3D isp1760_reg_read(priv->regs,
--					       ISP176x_HC_ATL_PTD_DONEMAP);
-+	priv->int_done_map |=3D isp1760_hcd_read(hcd, HC_INT_PTD_DONEMAP);
-+	priv->atl_done_map |=3D isp1760_hcd_read(hcd, HC_ATL_PTD_DONEMAP);
-=20
- 	handle_done_ptds(hcd);
-=20
- 	irqret =3D IRQ_HANDLED;
-+
- leave:
- 	spin_unlock(&priv->lock);
-=20
-@@ -1296,17 +1519,18 @@ static void errata2_function(struct timer_list *=
unused)
- {
- 	struct usb_hcd *hcd =3D errata2_timer_hcd;
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	const struct isp1760_memory_layout *mem =3D priv->memory_layout;
- 	int slot;
- 	struct ptd ptd;
- 	unsigned long spinflags;
-=20
- 	spin_lock_irqsave(&priv->lock, spinflags);
-=20
--	for (slot =3D 0; slot < 32; slot++)
-+	for (slot =3D 0; slot < mem->slot_num; slot++)
- 		if (priv->atl_slots[slot].qh && time_after(jiffies,
- 					priv->atl_slots[slot].timestamp +
- 					msecs_to_jiffies(SLOT_TIMEOUT))) {
--			ptd_read(hcd, priv->base, ATL_PTD_OFFSET, slot, &ptd);
-+			ptd_read(hcd, ATL_PTD_OFFSET, slot, &ptd);
- 			if (!FROM_DW0_VALID(ptd.dw0) &&
- 					!FROM_DW3_ACTIVE(ptd.dw3))
- 				priv->atl_done_map |=3D 1 << slot;
-@@ -1321,23 +1545,114 @@ static void errata2_function(struct timer_list =
*unused)
- 	add_timer(&errata2_timer);
- }
-=20
-+static int isp1763_run(struct usb_hcd *hcd)
-+{
-+	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
-+	int retval;
-+	u32 chipid_h;
-+	u32 chipid_l;
-+	u32 chip_rev;
-+	u32 ptd_atl_int;
-+	u32 ptd_iso;
-+
-+	hcd->uses_new_polling =3D 1;
-+	hcd->state =3D HC_STATE_RUNNING;
-+
-+	chipid_h =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	chipid_l =3D isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
-+	chip_rev =3D isp1760_hcd_read(hcd, HC_CHIP_REV);
-+	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n"=
,
-+					chipid_h, chipid_l, chip_rev);
-+
-+	isp1760_hcd_clear(hcd, ISO_BUF_FILL);
-+	isp1760_hcd_clear(hcd, INT_BUF_FILL);
-+	isp1760_hcd_clear(hcd, ATL_BUF_FILL);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-+	ndelay(100);
-+	isp1760_hcd_clear(hcd, HC_ATL_PTD_DONEMAP);
-+	isp1760_hcd_clear(hcd, HC_INT_PTD_DONEMAP);
-+	isp1760_hcd_clear(hcd, HC_ISO_PTD_DONEMAP);
-+
-+
-+	isp1760_hcd_set(hcd, HW_OTG_DISABLE);
-+	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, (1 << 7));
-+	isp1760_reg_write(priv->regs, ISP1763_HC_OTG_CTRL_CLEAR, (1 << 15));
-+	mdelay(10);
-+
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_ENABLE);
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_ENABLE);
-+
-+	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-+
-+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
-+
-+	ptd_atl_int =3D 0x8000;
-+	ptd_iso =3D 0x0001;
-+
-+	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
-+
-+	isp1760_hcd_set(hcd, ATL_BUF_FILL);
-+	isp1760_hcd_set(hcd, INT_BUF_FILL);
-+
-+	isp1760_hcd_clear(hcd, CMD_LRESET);
-+	isp1760_hcd_clear(hcd, CMD_RESET);
-+
-+	retval =3D isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
-+	if (retval)
-+		return retval;
-+
-+	down_write(&ehci_cf_port_reset_rwsem);
-+	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
-+	up_write(&ehci_cf_port_reset_rwsem);
-+	retval =3D 0;
-+	if (retval)
-+		return retval;
-+
-+	return 0;
-+}
-+
- static int isp1760_run(struct usb_hcd *hcd)
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	int retval;
--	u32 chipid;
-+	u32 chipid_h;
-+	u32 chipid_l;
-+	u32 chip_rev;
-+	u32 ptd_atl_int;
-+	u32 ptd_iso;
-+
-+	/*
-+	 * ISP1763 have some differences in the setup and order to enable
-+	 * the ports, disable otg, setup buffers, and ATL, INT, ISO status.
-+	 * So, just handle it a separate sequence.
-+	 */
-+	if (priv->is_isp1763)
-+		return isp1763_run(hcd);
-=20
- 	hcd->uses_new_polling =3D 1;
-=20
- 	hcd->state =3D HC_STATE_RUNNING;
-=20
- 	/* Set PTD interrupt AND & OR maps */
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_AND, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_IRQ_MASK_OR, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_AND, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_IRQ_MASK_OR, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_AND, 0);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_IRQ_MASK_OR, 0xffffffff);
-+	isp1760_hcd_clear(hcd, HC_ATL_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_INT_IRQ_MASK_AND);
-+	isp1760_hcd_clear(hcd, HC_ISO_IRQ_MASK_AND);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_INT_IRQ_MASK_OR);
-+	isp1760_hcd_set(hcd, HC_ISO_IRQ_MASK_OR);
-+
- 	/* step 23 passed */
-=20
- 	isp1760_hcd_set(hcd, HW_GLOBAL_INTR_EN);
-@@ -1345,7 +1660,7 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	isp1760_hcd_clear(hcd, CMD_LRESET);
- 	isp1760_hcd_clear(hcd, CMD_RESET);
-=20
--	retval =3D isp1760_hcd_set_poll_timeout(hcd, CMD_RUN, 250 * 1000);
-+	retval =3D isp1760_hcd_set_and_wait(hcd, CMD_RUN, 250 * 1000);
- 	if (retval)
- 		return retval;
-=20
-@@ -1356,7 +1671,7 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	 */
- 	down_write(&ehci_cf_port_reset_rwsem);
-=20
--	retval =3D isp1760_hcd_set_poll_timeout(hcd, FLAG_CF, 250 * 1000);
-+	retval =3D isp1760_hcd_set_and_wait(hcd, FLAG_CF, 250 * 1000);
- 	up_write(&ehci_cf_port_reset_rwsem);
- 	if (retval)
- 		return retval;
-@@ -1366,19 +1681,25 @@ static int isp1760_run(struct usb_hcd *hcd)
- 	errata2_timer.expires =3D jiffies + msecs_to_jiffies(SLOT_CHECK_PERIOD=
);
- 	add_timer(&errata2_timer);
-=20
--	chipid =3D isp1760_reg_read(priv->regs, ISP176x_HC_CHIP_ID);
--	dev_info(hcd->self.controller, "USB ISP %04x HW rev. %d started\n",
--					chipid & 0xffff, chipid >> 16);
-+	chipid_h =3D isp1760_hcd_read(hcd, HC_CHIP_ID_HIGH);
-+	chipid_l =3D isp1760_hcd_read(hcd, HC_CHIP_ID_LOW);
-+	chip_rev =3D isp1760_hcd_read(hcd, HC_CHIP_REV);
-+	dev_info(hcd->self.controller, "USB ISP %02x%02x HW rev. %d started\n"=
,
-+					chipid_h, chipid_l, chip_rev);
-=20
- 	/* PTD Register Init Part 2, Step 28 */
-=20
- 	/* Setup registers controlling PTD checking */
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_LASTPTD, 0x80000000);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_LASTPTD, 0x80000000);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_LASTPTD, 0x00000001);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP, 0xffffffff);
--	isp1760_reg_write(priv->regs, ISP176x_HC_ISO_PTD_SKIPMAP, 0xffffffff);
-+	ptd_atl_int =3D 0x80000000;
-+	ptd_iso =3D 0x00000001;
-+
-+	isp1760_hcd_write(hcd, HC_ATL_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_INT_PTD_LASTPTD, ptd_atl_int);
-+	isp1760_hcd_write(hcd, HC_ISO_PTD_LASTPTD, ptd_iso);
-+
-+	isp1760_hcd_set(hcd, HC_ATL_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_INT_PTD_SKIPMAP);
-+	isp1760_hcd_set(hcd, HC_ISO_PTD_SKIPMAP);
-=20
- 	isp1760_hcd_set(hcd, ATL_BUF_FILL);
- 	isp1760_hcd_set(hcd, INT_BUF_FILL);
-@@ -1619,19 +1940,16 @@ static void kill_transfer(struct usb_hcd *hcd, s=
truct urb *urb,
- 	/* We need to forcefully reclaim the slot since some transfers never
- 	   return, e.g. interrupt transfers and NAKed bulk transfers. */
- 	if (usb_pipecontrol(urb->pipe) || usb_pipebulk(urb->pipe)) {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_ATL_PTD_SKIPMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_ATL_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_ATL_PTD_SKIPMAP,
--				  skip_map);
-+		isp1760_hcd_write(hcd, HC_ATL_PTD_SKIPMAP, skip_map);
-+		ndelay(100);
- 		priv->atl_slots[qh->slot].qh =3D NULL;
- 		priv->atl_slots[qh->slot].qtd =3D NULL;
- 	} else {
--		skip_map =3D isp1760_reg_read(priv->regs,
--					    ISP176x_HC_INT_PTD_SKIPMAP);
-+		skip_map =3D isp1760_hcd_read(hcd, HC_INT_PTD_SKIPMAP);
- 		skip_map |=3D (1 << qh->slot);
--		isp1760_reg_write(priv->regs, ISP176x_HC_INT_PTD_SKIPMAP,
--				  skip_map);
-+		isp1760_hcd_write(hcd, HC_INT_PTD_SKIPMAP, skip_map);
- 		priv->int_slots[qh->slot].qh =3D NULL;
- 		priv->int_slots[qh->slot].qtd =3D NULL;
- 	}
-@@ -1787,7 +2105,7 @@ static void isp1760_hub_descriptor(struct isp1760_=
hcd *priv,
- 	int ports;
- 	u16 temp;
-=20
--	ports =3D isp1760_hcd_read(priv->hcd, HCS_N_PORTS);
-+	ports =3D isp1760_hcd_n_ports(priv->hcd);
-=20
- 	desc->bDescriptorType =3D USB_DT_HUB;
- 	/* priv 1.0, 2.3.9 says 20ms max */
-@@ -1804,7 +2122,7 @@ static void isp1760_hub_descriptor(struct isp1760_=
hcd *priv,
-=20
- 	/* per-port overcurrent reporting */
- 	temp =3D HUB_CHAR_INDV_PORT_OCPM;
--	if (isp1760_hcd_is_set(priv->hcd, HCS_PPC))
-+	if (isp1760_hcd_ppc_is_set(priv->hcd))
- 		/* per-port power control */
- 		temp |=3D HUB_CHAR_INDV_PORT_LPSM;
- 	else
-@@ -1841,11 +2159,12 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- {
- 	struct isp1760_hcd *priv =3D hcd_to_priv(hcd);
- 	u32 status;
-+	u32 temp;
- 	unsigned long flags;
- 	int retval =3D 0;
- 	int ports;
-=20
--	ports =3D isp1760_hcd_read(hcd, HCS_N_PORTS);
-+	ports =3D isp1760_hcd_n_ports(hcd);
-=20
- 	/*
- 	 * FIXME:  support SetPortFeatures USB_PORT_FEAT_INDICATOR.
-@@ -1904,7 +2223,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			/* we auto-clear this feature */
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+			if (isp1760_hcd_ppc_is_set(hcd))
- 				isp1760_hcd_clear(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_C_CONNECTION:
-@@ -1919,7 +2238,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		default:
- 			goto error;
- 		}
--		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
-+		isp1760_hcd_read(hcd, CMD_RUN);
- 		break;
- 	case GetHubDescriptor:
- 		isp1760_hub_descriptor(priv, (struct usb_hub_descriptor *)
-@@ -1939,7 +2258,6 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		if (isp1760_hcd_is_set(hcd, PORT_CSC))
- 			status |=3D USB_PORT_STAT_C_CONNECTION << 16;
-=20
--
- 		/* whoever resumes must GetPortStatus to complete it!! */
- 		if (isp1760_hcd_is_set(hcd, PORT_RESUME)) {
- 			dev_err(hcd->self.controller, "Port resume should be skipped.\n");
-@@ -1962,7 +2280,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 				/* stop resume signaling */
- 				isp1760_hcd_clear(hcd, PORT_CSC);
-=20
--				retval =3D isp1760_hcd_clear_poll_timeout(hcd,
-+				retval =3D isp1760_hcd_clear_and_wait(hcd,
- 							  PORT_RESUME, 2000);
- 				if (retval !=3D 0) {
- 					dev_err(hcd->self.controller,
-@@ -1983,9 +2301,8 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			/* REVISIT:  some hardware needs 550+ usec to clear
- 			 * this bit; seems too long to spin routinely...
- 			 */
--			retval =3D isp1760_hcd_clear_poll_timeout(hcd,
--								  PORT_RESET,
--								  750);
-+			retval =3D isp1760_hcd_clear_and_wait(hcd, PORT_RESET,
-+							    750);
- 			if (retval !=3D 0) {
- 				dev_err(hcd->self.controller, "port %d reset error %d\n",
- 						wIndex + 1, retval);
-@@ -2036,6 +2353,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 		if (!wIndex || wIndex > ports)
- 			goto error;
- 		wIndex--;
-+
- 		if (isp1760_hcd_is_set(hcd, PORT_OWNER))
- 			break;
-=20
-@@ -2052,7 +2370,7 @@ static int isp1760_hub_control(struct usb_hcd *hcd=
, u16 typeReq,
- 			isp1760_hcd_set(hcd, PORT_SUSPEND);
- 			break;
- 		case USB_PORT_FEAT_POWER:
--			if (isp1760_hcd_is_set(hcd, HCS_PPC))
-+			if (isp1760_hcd_ppc_is_set(hcd))
- 				isp1760_hcd_set(hcd, PORT_POWER);
- 			break;
- 		case USB_PORT_FEAT_RESET:
-@@ -2067,21 +2385,44 @@ static int isp1760_hub_control(struct usb_hcd *h=
cd, u16 typeReq,
- 			    (isp1760_hcd_read(hcd, PORT_LSTATUS) =3D=3D 1)) {
- 				isp1760_hcd_set(hcd, PORT_OWNER);
- 			} else {
--				isp1760_hcd_set(hcd, PORT_RESET);
--				isp1760_hcd_clear(hcd, PORT_PE);
-+				temp =3D isp1760_reg_read(priv->regs, ISP1763_HC_PORTSC1);
-+				//isp1760_hcd_set(hcd, PORT_RESET);
-+				//isp1760_hcd_clear(hcd, PORT_PE);
-+				temp |=3D (1 << 8);
-+				temp &=3D ~(1 << 2);
-=20
-+				writel(temp, priv->base + ISP1763_HC_PORTSC1);
- 				/*
- 				 * caller must wait, then call GetPortStatus
- 				 * usb 2.0 spec says 50 ms resets on root
- 				 */
- 				priv->reset_done =3D jiffies +
- 					msecs_to_jiffies(50);
-+
-+				mdelay(50);
-+
-+				temp &=3D ~(1 << 8);
-+				writel(temp, priv->base + ISP1763_HC_PORTSC1);
-+
-+				while (readl(priv->base + ISP1763_HC_PORTSC1) & (1 << 8))
-+					continue;
-+
-+				temp |=3D (1 << 2);
-+				writel(temp, priv->base + ISP1763_HC_PORTSC1);
-+				/*retval =3D isp1760_hcd_clear_and_wait(hcd,
-+								    PORT_RESET,
-+								    90000);
-+				if (retval)
-+					goto error;
-+
-+				isp1760_hcd_set(hcd, PORT_PE);
-+				*/
- 			}
- 			break;
- 		default:
- 			goto error;
- 		}
--		isp1760_reg_read(priv->regs, ISP176x_HC_USBCMD);
-+		isp1760_reg_read(priv->regs, ISP1763_HC_USBCMD);
- 		break;
-=20
- 	default:
-@@ -2216,22 +2557,14 @@ int isp1760_hcd_register(struct isp1760_hcd *pri=
v, struct resource *mem,
-=20
- 	priv->hcd =3D hcd;
-=20
--	priv->memory_pool =3D kcalloc(mem_layout->payload_blocks,
--				    sizeof(struct isp1760_memory_chunk),
--				    GFP_KERNEL);
--	if (!priv->memory_pool) {
--		ret =3D -ENOMEM;
--		goto put_hcd;
--	}
--
--	priv->atl_slots =3D kcalloc(mem_layout->ptd_num,
-+	priv->atl_slots =3D kcalloc(mem_layout->slot_num,
- 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
- 	if (!priv->atl_slots) {
- 		ret =3D -ENOMEM;
--		goto free_mem_pool;
-+		goto put_hcd;
- 	}
-=20
--	priv->int_slots =3D kcalloc(mem_layout->ptd_num,
-+	priv->int_slots =3D kcalloc(mem_layout->slot_num,
- 				  sizeof(struct isp1760_slotinfo), GFP_KERNEL);
- 	if (!priv->int_slots) {
- 		ret =3D -ENOMEM;
-@@ -2259,8 +2592,6 @@ int isp1760_hcd_register(struct isp1760_hcd *priv,=
 struct resource *mem,
- 	kfree(priv->int_slots);
- free_atl_slots:
- 	kfree(priv->atl_slots);
--free_mem_pool:
--	kfree(priv->memory_pool);
- put_hcd:
- 	usb_put_hcd(hcd);
- 	return ret;
-@@ -2275,5 +2606,4 @@ void isp1760_hcd_unregister(struct isp1760_hcd *pr=
iv)
- 	usb_put_hcd(priv->hcd);
- 	kfree(priv->atl_slots);
- 	kfree(priv->int_slots);
--	kfree(priv->memory_pool);
- }
-diff --git a/drivers/usb/isp1760/isp1760-hcd.h b/drivers/usb/isp1760/isp=
1760-hcd.h
-index e5e784b9046b..e20a46ae9dbe 100644
---- a/drivers/usb/isp1760/isp1760-hcd.h
-+++ b/drivers/usb/isp1760/isp1760-hcd.h
-@@ -19,13 +19,14 @@ struct isp1760_slotinfo {
- };
-=20
- /* chip memory management */
-+#define ISP176x_BLOCK_MAX 32 + 20 + 4
- #define ISP176x_BLOCK_NUM 3
-=20
- struct isp1760_memory_layout {
- 	unsigned int blocks[ISP176x_BLOCK_NUM];
- 	unsigned int blocks_size[ISP176x_BLOCK_NUM];
-=20
--	unsigned int ptd_num;
-+	unsigned int slot_num;
- 	unsigned int payload_blocks;
- 	unsigned int payload_area_size;
- };
-@@ -52,6 +53,7 @@ struct isp1760_hcd {
- 	struct regmap		*regs;
- 	struct regmap_field	*fields[HC_FIELD_MAX];
-=20
-+	bool			is_isp1763;
- 	const struct isp1760_memory_layout	*memory_layout;
-=20
- 	spinlock_t		lock;
-@@ -59,7 +61,7 @@ struct isp1760_hcd {
- 	int			atl_done_map;
- 	struct isp1760_slotinfo	*int_slots;
- 	int			int_done_map;
--	struct isp1760_memory_chunk *memory_pool;
-+	struct isp1760_memory_chunk memory_pool[ISP176x_BLOCK_MAX];
- 	struct list_head	qh_list[QH_END];
-=20
- 	/* periodic schedule support */
-diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1=
760-if.c
-index abfba9f5ec23..306a047d5227 100644
---- a/drivers/usb/isp1760/isp1760-if.c
-+++ b/drivers/usb/isp1760/isp1760-if.c
-@@ -209,10 +209,15 @@ static int isp1760_plat_probe(struct platform_devi=
ce *pdev)
- 		if (of_device_is_compatible(dp, "nxp,usb-isp1761"))
- 			devflags |=3D ISP1760_FLAG_ISP1761;
-=20
-+		if (of_device_is_compatible(dp, "nxp,usb-isp1763"))
-+			devflags |=3D ISP1760_FLAG_ISP1763;
-+
- 		/* Some systems wire up only 16 of the 32 data lines */
- 		of_property_read_u32(dp, "bus-width", &bus_width);
--		if (bus_width =3D=3D 16)
-+		if (bus_width =3D=3D 16 && !(devflags & ISP1760_FLAG_ISP1763))
- 			devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
-+		else if (bus_width =3D=3D 8)
-+			devflags |=3D ISP1760_FLAG_BUS_WIDTH_8;
-=20
- 		if (of_property_read_bool(dp, "port1-otg"))
- 			devflags |=3D ISP1760_FLAG_OTG_EN;
-@@ -231,8 +236,13 @@ static int isp1760_plat_probe(struct platform_devic=
e *pdev)
-=20
- 		if (pdata->is_isp1761)
- 			devflags |=3D ISP1760_FLAG_ISP1761;
--		if (pdata->bus_width_16)
-+		else if (pdata->is_isp1763)
-+			devflags |=3D ISP1760_FLAG_ISP1763;
-+
-+		if (pdata->bus_width_16 && !pdata->is_isp1763)
- 			devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
-+		else if (pdata->bus_width_8)
-+			devflags |=3D ISP1760_FLAG_BUS_WIDTH_8;
- 		if (pdata->port1_otg)
- 			devflags |=3D ISP1760_FLAG_OTG_EN;
- 		if (pdata->analog_oc)
-@@ -263,6 +273,7 @@ static int isp1760_plat_remove(struct platform_devic=
e *pdev)
- static const struct of_device_id isp1760_of_match[] =3D {
- 	{ .compatible =3D "nxp,usb-isp1760", },
- 	{ .compatible =3D "nxp,usb-isp1761", },
-+	{ .compatible =3D "nxp,usb-isp1763", },
- 	{ },
- };
- MODULE_DEVICE_TABLE(of, isp1760_of_match);
-diff --git a/drivers/usb/isp1760/isp1760-regs.h b/drivers/usb/isp1760/is=
p1760-regs.h
-index 4e835e9665bd..313cb1fff1b3 100644
---- a/drivers/usb/isp1760/isp1760-regs.h
-+++ b/drivers/usb/isp1760/isp1760-regs.h
-@@ -19,8 +19,8 @@
-  * Host Controller
-  */
-=20
-+/* ISP1760/31 */
- /* EHCI capability registers */
--#define ISP176x_HC_CAPLENGTH		0x000
- #define ISP176x_HC_VERSION		0x002
- #define ISP176x_HC_HCSPARAMS		0x004
- #define ISP176x_HC_HCCPARAMS		0x008
-@@ -61,11 +61,13 @@
- #define ISP176x_HC_INT_IRQ_MASK_AND	0x328
- #define ISP176x_HC_ATL_IRQ_MASK_AND	0x32c
-=20
-+#define ISP176x_HC_OTG_CTRL_SET		0x374
-+#define ISP176x_HC_OTG_CTRL_CLEAR	0x376
-=20
- static const struct regmap_range isp176x_hc_volatile_ranges[] =3D {
- 	regmap_reg_range(ISP176x_HC_USBCMD, ISP176x_HC_ATL_PTD_LASTPTD),
- 	regmap_reg_range(ISP176x_HC_BUFFER_STATUS, ISP176x_HC_MEMORY),
--	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_ATL_IRQ_MASK_AND),
-+	regmap_reg_range(ISP176x_HC_INTERRUPT, ISP176x_HC_OTG_CTRL_CLEAR),
- };
-=20
- static const struct regmap_access_table isp176x_hc_volatile_table =3D {
-@@ -74,6 +76,9 @@ static const struct regmap_access_table isp176x_hc_vol=
atile_table =3D {
- };
-=20
- enum isp176x_host_controller_fields {
-+	/* HC_PORTSC1 */
-+	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
-+	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
- 	/* HC_HCSPARAMS */
- 	HCS_PPC, HCS_N_PORTS,
- 	/* HC_HCCPARAMS */
-@@ -86,21 +91,40 @@ enum isp176x_host_controller_fields {
- 	HC_FRINDEX,
- 	/* HC_CONFIGFLAG */
- 	FLAG_CF,
--	/* HC_PORTSC1 */
--	PORT_OWNER, PORT_POWER, PORT_LSTATUS, PORT_RESET, PORT_SUSPEND,
--	PORT_RESUME, PORT_PE, PORT_CSC, PORT_CONNECT,
-+	/* ISO/INT/ATL PTD */
-+	HC_ISO_PTD_DONEMAP, HC_ISO_PTD_SKIPMAP, HC_ISO_PTD_LASTPTD,
-+	HC_INT_PTD_DONEMAP, HC_INT_PTD_SKIPMAP, HC_INT_PTD_LASTPTD,
-+	HC_ATL_PTD_DONEMAP, HC_ATL_PTD_SKIPMAP, HC_ATL_PTD_LASTPTD,
- 	/* HC_HW_MODE_CTRL */
- 	ALL_ATX_RESET, HW_ANA_DIGI_OC, HW_DEV_DMA, HW_COMN_IRQ, HW_COMN_DMA,
- 	HW_DATA_BUS_WIDTH, HW_DACK_POL_HIGH, HW_DREQ_POL_HIGH, HW_INTR_HIGH_AC=
T,
--	HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	HW_INTF_LOCK, HW_INTR_EDGE_TRIG, HW_GLOBAL_INTR_EN,
-+	/* HC_CHIP_ID */
-+	HC_CHIP_ID_HIGH, HC_CHIP_ID_LOW, HC_CHIP_REV,
-+	/* HC_SCRATCH */
-+	HC_SCRATCH,
- 	/* HC_RESET */
--	SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
-+	SW_RESET_RESET_ATX, SW_RESET_RESET_HC, SW_RESET_RESET_ALL,
- 	/* HC_BUFFER_STATUS */
--	INT_BUF_FILL, ATL_BUF_FILL,
-+	ISO_BUF_FILL, INT_BUF_FILL, ATL_BUF_FILL,
- 	/* HC_MEMORY */
- 	MEM_BANK_SEL, MEM_START_ADDR,
-+	/* HC_DATA */
-+	HC_DATA,
-+	/* HC_INTERRUPT */
-+	HC_INTERRUPT,
- 	/* HC_INTERRUPT_ENABLE */
--	HC_INT_ENABLE,
-+	HC_INT_IRQ_ENABLE, HC_ATL_IRQ_ENABLE,
-+	/* INTERRUPT MASKS */
-+	HC_ISO_IRQ_MASK_OR, HC_INT_IRQ_MASK_OR, HC_ATL_IRQ_MASK_OR,
-+	HC_ISO_IRQ_MASK_AND, HC_INT_IRQ_MASK_AND, HC_ATL_IRQ_MASK_AND,
-+	/* HW_OTG_CTRL_SET */
-+	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
-+	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP, HW_HC_2_DIS,
-+	/* HW_OTG_CTRL_CLR */
-+	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
-+	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
-+	HW_DP_PULLUP_CLEAR, HW_HC_2_DIS_CLEAR,
- 	/* Last element */
- 	HC_FIELD_MAX,
- };
-@@ -116,6 +140,15 @@ static const struct reg_field isp1760_hc_reg_fields=
[] =3D {
- 	[STS_PCD]		=3D REG_FIELD(ISP176x_HC_USBSTS, 2, 2),
- 	[HC_FRINDEX]		=3D REG_FIELD(ISP176x_HC_FRINDEX, 0, 13),
- 	[FLAG_CF]		=3D REG_FIELD(ISP176x_HC_CONFIGFLAG, 0, 0),
-+	[HC_ISO_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_DONEMAP, 0, 31),
-+	[HC_ISO_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_SKIPMAP, 0, 31),
-+	[HC_ISO_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_ISO_PTD_LASTPTD, 0, 31),
-+	[HC_INT_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_INT_PTD_DONEMAP, 0, 31),
-+	[HC_INT_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_INT_PTD_SKIPMAP, 0, 31),
-+	[HC_INT_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_INT_PTD_LASTPTD, 0, 31),
-+	[HC_ATL_PTD_DONEMAP]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_DONEMAP, 0, 31),
-+	[HC_ATL_PTD_SKIPMAP]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_SKIPMAP, 0, 31),
-+	[HC_ATL_PTD_LASTPTD]	=3D REG_FIELD(ISP176x_HC_ATL_PTD_LASTPTD, 0, 31),
- 	[PORT_OWNER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 13, 13),
- 	[PORT_POWER]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 12, 12),
- 	[PORT_LSTATUS]		=3D REG_FIELD(ISP176x_HC_PORTSC1, 10, 11),
-@@ -134,12 +167,174 @@ static const struct reg_field isp1760_hc_reg_fiel=
ds[] =3D {
- 	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 2, 2),
- 	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 1, 1),
- 	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP176x_HC_HW_MODE_CTRL, 0, 0),
-+	[HC_CHIP_REV]		=3D REG_FIELD(ISP176x_HC_CHIP_ID, 16, 31),
-+	[HC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP176x_HC_CHIP_ID, 8, 15),
-+	[HC_CHIP_ID_LOW]	=3D REG_FIELD(ISP176x_HC_CHIP_ID, 0, 7),
-+	[HC_SCRATCH]		=3D REG_FIELD(ISP176x_HC_SCRATCH, 0, 31),
- 	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP176x_HC_RESET, 0, 0),
-+	[ISO_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 2, 2),
- 	[INT_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 1, 1),
- 	[ATL_BUF_FILL]		=3D REG_FIELD(ISP176x_HC_BUFFER_STATUS, 0, 0),
- 	[MEM_BANK_SEL]		=3D REG_FIELD(ISP176x_HC_MEMORY, 16, 17),
- 	[MEM_START_ADDR]	=3D REG_FIELD(ISP176x_HC_MEMORY, 0, 15),
--	[HC_INT_ENABLE]		=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 8),
-+	[HC_INTERRUPT]		=3D REG_FIELD(ISP176x_HC_INTERRUPT, 0, 9),
-+	[HC_ATL_IRQ_ENABLE]	=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 8, 8),
-+	[HC_INT_IRQ_ENABLE]	=3D REG_FIELD(ISP176x_HC_INTERRUPT_ENABLE, 7, 7),
-+	[HC_ISO_IRQ_MASK_OR]	=3D REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_OR, 0, 31),
-+	[HC_INT_IRQ_MASK_OR]	=3D REG_FIELD(ISP176x_HC_INT_IRQ_MASK_OR, 0, 31),
-+	[HC_ATL_IRQ_MASK_OR]	=3D REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_OR, 0, 31),
-+	[HC_ISO_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_ISO_IRQ_MASK_AND, 0, 31=
),
-+	[HC_INT_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_INT_IRQ_MASK_AND, 0, 31=
),
-+	[HC_ATL_IRQ_MASK_AND]	=3D REG_FIELD(ISP176x_HC_ATL_IRQ_MASK_AND, 0, 31=
),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP176x_HC_OTG_CTRL_SET, 0, 0),
-+	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 10, 10=
),
-+	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 7, 7)=
,
-+	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 4, 4),
-+	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 3, 3),
-+	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 2, 2),
-+	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 1, 1),
-+	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP176x_HC_OTG_CTRL_CLEAR, 0, 0),
-+};
-+
-+/* ISP1763 */
-+/* EHCI operational registers */
-+#define ISP1763_HC_USBCMD		0x8c
-+#define ISP1763_HC_USBSTS		0x90
-+#define ISP1763_HC_FRINDEX		0x98
-+
-+#define ISP1763_HC_CONFIGFLAG		0x9c
-+#define ISP1763_HC_PORTSC1		0xa0
-+
-+#define ISP1763_HC_ISO_PTD_DONEMAP	0xa4
-+#define ISP1763_HC_ISO_PTD_SKIPMAP	0xa6
-+#define ISP1763_HC_ISO_PTD_LASTPTD	0xa8
-+#define ISP1763_HC_INT_PTD_DONEMAP	0xaa
-+#define ISP1763_HC_INT_PTD_SKIPMAP	0xac
-+#define ISP1763_HC_INT_PTD_LASTPTD	0xae
-+#define ISP1763_HC_ATL_PTD_DONEMAP	0xb0
-+#define ISP1763_HC_ATL_PTD_SKIPMAP	0xb2
-+#define ISP1763_HC_ATL_PTD_LASTPTD	0xb4
-+
-+/* Configuration Register */
-+#define ISP1763_HC_HW_MODE_CTRL		0xb6
-+#define ISP1763_HC_CHIP_REV		0x70
-+#define ISP1763_HC_CHIP_ID		0x72
-+#define ISP1763_HC_SCRATCH		0x78
-+#define ISP1763_HC_RESET		0xb8
-+#define ISP1763_HC_BUFFER_STATUS	0xba
-+#define ISP1763_HC_MEMORY		0xc4
-+#define ISP1763_HC_DATA			0xc6
-+
-+/* Interrupt Register */
-+#define ISP1763_HC_INTERRUPT		0xd4
-+#define ISP1763_HC_INTERRUPT_ENABLE	0xd6
-+#define ISP1763_HC_ISO_IRQ_MASK_OR	0xd8
-+#define ISP1763_HC_INT_IRQ_MASK_OR	0xda
-+#define ISP1763_HC_ATL_IRQ_MASK_OR	0xdc
-+#define ISP1763_HC_ISO_IRQ_MASK_AND	0xde
-+#define ISP1763_HC_INT_IRQ_MASK_AND	0xe0
-+#define ISP1763_HC_ATL_IRQ_MASK_AND	0xe2
-+
-+#define ISP1763_HC_OTG_CTRL_SET		0xe4
-+#define ISP1763_HC_OTG_CTRL_CLEAR	0xe6
-+
-+static const struct reg_field isp1763_hc_reg_fields[] =3D {
-+	[CMD_LRESET]		=3D REG_FIELD(ISP1763_HC_USBCMD, 7, 7),
-+	[CMD_RESET]		=3D REG_FIELD(ISP1763_HC_USBCMD, 1, 1),
-+	[CMD_RUN]		=3D REG_FIELD(ISP1763_HC_USBCMD, 0, 0),
-+	[STS_PCD]		=3D REG_FIELD(ISP1763_HC_USBSTS, 2, 2),
-+	[HC_FRINDEX]		=3D REG_FIELD(ISP1763_HC_FRINDEX, 0, 13),
-+	[FLAG_CF]		=3D REG_FIELD(ISP1763_HC_CONFIGFLAG, 0, 0),
-+	[HC_ISO_PTD_DONEMAP]	=3D REG_FIELD(ISP1763_HC_ISO_PTD_DONEMAP, 0, 15),
-+	[HC_ISO_PTD_SKIPMAP]	=3D REG_FIELD(ISP1763_HC_ISO_PTD_SKIPMAP, 0, 15),
-+	[HC_ISO_PTD_LASTPTD]	=3D REG_FIELD(ISP1763_HC_ISO_PTD_LASTPTD, 0, 15),
-+	[HC_INT_PTD_DONEMAP]	=3D REG_FIELD(ISP1763_HC_INT_PTD_DONEMAP, 0, 15),
-+	[HC_INT_PTD_SKIPMAP]	=3D REG_FIELD(ISP1763_HC_INT_PTD_SKIPMAP, 0, 15),
-+	[HC_INT_PTD_LASTPTD]	=3D REG_FIELD(ISP1763_HC_INT_PTD_LASTPTD, 0, 15),
-+	[HC_ATL_PTD_DONEMAP]	=3D REG_FIELD(ISP1763_HC_ATL_PTD_DONEMAP, 0, 15),
-+	[HC_ATL_PTD_SKIPMAP]	=3D REG_FIELD(ISP1763_HC_ATL_PTD_SKIPMAP, 0, 15),
-+	[HC_ATL_PTD_LASTPTD]	=3D REG_FIELD(ISP1763_HC_ATL_PTD_LASTPTD, 0, 15),
-+	[PORT_OWNER]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 13, 13),
-+	[PORT_POWER]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 12, 12),
-+	[PORT_LSTATUS]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 10, 11),
-+	[PORT_RESET]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 8, 8),
-+	[PORT_SUSPEND]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 7, 7),
-+	[PORT_RESUME]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 6, 6),
-+	[PORT_PE]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 2, 2),
-+	[PORT_CSC]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 1, 1),
-+	[PORT_CONNECT]		=3D REG_FIELD(ISP1763_HC_PORTSC1, 0, 0),
-+	[HW_DATA_BUS_WIDTH]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 4, 4),
-+	[HW_DACK_POL_HIGH]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 6, 6),
-+	[HW_DREQ_POL_HIGH]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 5, 5),
-+	[HW_INTF_LOCK]		=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 3, 3),
-+	[HW_INTR_HIGH_ACT]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 2, 2),
-+	[HW_INTR_EDGE_TRIG]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 1, 1),
-+	[HW_GLOBAL_INTR_EN]	=3D REG_FIELD(ISP1763_HC_HW_MODE_CTRL, 0, 0),
-+	[SW_RESET_RESET_ATX]	=3D REG_FIELD(ISP1763_HC_RESET, 3, 3),
-+	[SW_RESET_RESET_ALL]	=3D REG_FIELD(ISP1763_HC_RESET, 0, 0),
-+	[HC_CHIP_ID_HIGH]	=3D REG_FIELD(ISP1763_HC_CHIP_ID, 0, 15),
-+	[HC_CHIP_ID_LOW]	=3D REG_FIELD(ISP1763_HC_CHIP_REV, 8, 15),
-+	[HC_CHIP_REV]		=3D REG_FIELD(ISP1763_HC_CHIP_REV, 0, 7),
-+	[HC_SCRATCH]		=3D REG_FIELD(ISP1763_HC_SCRATCH, 0, 15),
-+	[ISO_BUF_FILL]		=3D REG_FIELD(ISP1763_HC_BUFFER_STATUS, 2, 2),
-+	[INT_BUF_FILL]		=3D REG_FIELD(ISP1763_HC_BUFFER_STATUS, 1, 1),
-+	[ATL_BUF_FILL]		=3D REG_FIELD(ISP1763_HC_BUFFER_STATUS, 0, 0),
-+	[MEM_START_ADDR]	=3D REG_FIELD(ISP1763_HC_MEMORY, 0, 15),
-+	[HC_DATA]		=3D REG_FIELD(ISP1763_HC_DATA, 0, 15),
-+	[HC_INTERRUPT]		=3D REG_FIELD(ISP1763_HC_INTERRUPT, 0, 10),
-+	[HC_ATL_IRQ_ENABLE]	=3D REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 8, 8),
-+	[HC_INT_IRQ_ENABLE]	=3D REG_FIELD(ISP1763_HC_INTERRUPT_ENABLE, 7, 7),
-+	[HC_ISO_IRQ_MASK_OR]	=3D REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_OR, 0, 15),
-+	[HC_INT_IRQ_MASK_OR]	=3D REG_FIELD(ISP1763_HC_INT_IRQ_MASK_OR, 0, 15),
-+	[HC_ATL_IRQ_MASK_OR]	=3D REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_OR, 0, 15),
-+	[HC_ISO_IRQ_MASK_AND]	=3D REG_FIELD(ISP1763_HC_ISO_IRQ_MASK_AND, 0, 15=
),
-+	[HC_INT_IRQ_MASK_AND]	=3D REG_FIELD(ISP1763_HC_INT_IRQ_MASK_AND, 0, 15=
),
-+	[HC_ATL_IRQ_MASK_AND]	=3D REG_FIELD(ISP1763_HC_ATL_IRQ_MASK_AND, 0, 15=
),
-+	[HW_HC_2_DIS]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 15, 15),
-+	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 10, 10),
-+	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 7, 7),
-+	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 4, 4),
-+	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 3, 3),
-+	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 2, 2),
-+	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 1, 1),
-+	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1763_HC_OTG_CTRL_SET, 0, 0),
-+	[HW_HC_2_DIS_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 15, 15),
-+	[HW_OTG_DISABLE_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 10, 10=
),
-+	[HW_SW_SEL_HC_DC_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 7, 7)=
,
-+	[HW_VBUS_DRV_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 4, 4),
-+	[HW_SEL_CP_EXT_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 3, 3),
-+	[HW_DM_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 2, 2),
-+	[HW_DP_PULLDOWN_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 1, 1),
-+	[HW_DP_PULLUP_CLEAR]	=3D REG_FIELD(ISP1763_HC_OTG_CTRL_CLEAR, 0, 0),
-+};
-+
-+static const struct regmap_range isp1763_hc_volatile_ranges[] =3D {
-+	regmap_reg_range(ISP1763_HC_USBCMD, ISP1763_HC_ATL_PTD_LASTPTD),
-+	regmap_reg_range(ISP1763_HC_BUFFER_STATUS, ISP1763_HC_DATA),
-+	regmap_reg_range(ISP1763_HC_INTERRUPT, ISP1763_HC_OTG_CTRL_CLEAR),
-+};
-+
-+static const struct regmap_access_table isp1763_hc_volatile_table =3D {
-+	.yes_ranges	=3D isp1763_hc_volatile_ranges,
-+	.n_yes_ranges	=3D ARRAY_SIZE(isp1763_hc_volatile_ranges),
-+};
-+
-+static const u32 isp1763_hc_portsc1_fields[] =3D {
-+	[PORT_OWNER]		=3D BIT(13),
-+	[PORT_POWER]		=3D BIT(12),
-+	[PORT_LSTATUS]		=3D BIT(10),
-+	[PORT_RESET]		=3D BIT(8),
-+	[PORT_SUSPEND]		=3D BIT(7),
-+	[PORT_RESUME]		=3D BIT(6),
-+	[PORT_PE]		=3D BIT(2),
-+	[PORT_CSC]		=3D BIT(1),
-+	[PORT_CONNECT]		=3D BIT(0),
- };
-=20
- /* --------------------------------------------------------------------=
---------
-@@ -172,9 +367,6 @@ static const struct reg_field isp1760_hc_reg_fields[=
] =3D {
- #define ISP176x_DC_CTRLFUNC			0x0228
- #define ISP176x_DC_EPINDEX			0x022c
-=20
--#define ISP1761_DC_OTG_CTRL_SET			0x374
--#define ISP1761_DC_OTG_CTRL_CLEAR		0x376
--
- /* DMA Registers */
- #define ISP176x_DC_DMACMD			0x0230
- #define ISP176x_DC_DMATXCOUNT			0x0234
-@@ -197,7 +389,6 @@ static const struct reg_field isp1760_hc_reg_fields[=
] =3D {
- static const struct regmap_range isp176x_dc_volatile_ranges[] =3D {
- 	regmap_reg_range(ISP176x_DC_EPMAXPKTSZ, ISP176x_DC_EPTYPE),
- 	regmap_reg_range(ISP176x_DC_BUFLEN, ISP176x_DC_EPINDEX),
--	regmap_reg_range(ISP1761_DC_OTG_CTRL_SET, ISP1761_DC_OTG_CTRL_CLEAR),
- };
-=20
- static const struct regmap_access_table isp176x_dc_volatile_table =3D {
-@@ -228,13 +419,6 @@ enum isp176x_device_controller_fields {
- 	DC_EPENABLE, DC_ENDPTYP,
- 	/* DC_FRAMENUM */
- 	DC_FRAMENUM, DC_UFRAMENUM,
--	/* HW_OTG_CTRL_SET */
--	HW_OTG_DISABLE, HW_SW_SEL_HC_DC, HW_VBUS_DRV, HW_SEL_CP_EXT,
--	HW_DM_PULLDOWN, HW_DP_PULLDOWN, HW_DP_PULLUP,
--	/* HW_OTG_CTRL_CLR */
--	HW_OTG_DISABLE_CLEAR, HW_SW_SEL_HC_DC_CLEAR, HW_VBUS_DRV_CLEAR,
--	HW_SEL_CP_EXT_CLEAR, HW_DM_PULLDOWN_CLEAR, HW_DP_PULLDOWN_CLEAR,
--	HW_DP_PULLUP_CLEAR,
- 	/* Last element */
- 	DC_FIELD_MAX,
- };
-@@ -277,20 +461,6 @@ static const struct reg_field isp1761_dc_reg_fields=
[] =3D {
- 	[DC_ENDPTYP]		=3D REG_FIELD(ISP176x_DC_EPTYPE, 0, 1),
- 	[DC_UFRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 11, 13),
- 	[DC_FRAMENUM]		=3D REG_FIELD(ISP176x_DC_FRAMENUM, 0, 10),
--	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 10, 10),
--	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 7, 7),
--	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 4, 4),
--	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 3, 3),
--	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 2, 2),
--	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 1, 1),
--	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_SET, 0, 0),
--	[HW_OTG_DISABLE]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 10, 10),
--	[HW_SW_SEL_HC_DC]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 7, 7),
--	[HW_VBUS_DRV]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 4, 4),
--	[HW_SEL_CP_EXT]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 3, 3),
--	[HW_DM_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 2, 2),
--	[HW_DP_PULLDOWN]	=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 1, 1),
--	[HW_DP_PULLUP]		=3D REG_FIELD(ISP1761_DC_OTG_CTRL_CLEAR, 0, 0),
- };
-=20
- #endif
-diff --git a/include/linux/usb/isp1760.h b/include/linux/usb/isp1760.h
-index b75ded28db81..84c8ca9d5b90 100644
---- a/include/linux/usb/isp1760.h
-+++ b/include/linux/usb/isp1760.h
-@@ -9,7 +9,9 @@
-=20
- struct isp1760_platform_data {
- 	unsigned is_isp1761:1;			/* Chip is ISP1761 */
-+	unsigned is_isp1763:1;			/* Chip is ISP1763 */
- 	unsigned bus_width_16:1;		/* 16/32-bit data bus width */
-+	unsigned bus_width_8:1;			/* 8/16-bit data bus width */
- 	unsigned port1_otg:1;			/* Port 1 supports OTG */
- 	unsigned analog_oc:1;			/* Analog overcurrent */
- 	unsigned dack_polarity_high:1;		/* DACK active high */
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 1e09da34..418ea3dd 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -13,7 +13,6 @@ ARMBSPFILESPATHS :=3D "${THISDIR}:${THISDIR}/files:"
=20
 # Arm platforms kmeta
 SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-pl=
atforms-kmeta;destsuffix=3Darm-platforms-kmeta"
-SRC_URI:append:corstone700 =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-base =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-base-arm32 =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-baser-aemv8r64 =3D " ${SRC_URI_KMETA}"
@@ -30,58 +29,6 @@ KMACHINE:corstone500 =3D "corstone500"
 KBUILD_DEFCONFIG:corstone500  =3D "multi_v7_defconfig"
 KCONFIG_MODE:corstone500 =3D "--alldefconfig"
=20
-#
-# Corstone-700 Machines
-#
-COMPATIBLE_MACHINE:corstone700 =3D "${MACHINE}"
-KMACHINE:corstone700 =3D "corstone700"
-KERNEL_IMAGETYPE:corstone700  =3D "xipImage"
-KCONFIG_MODE:corstone700  =3D "--alldefconfig"
-FILESEXTRAPATHS:prepend:corstone700 :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:corstone700 =3D " \
-           file://0001-arm-support-for-a-single-ARMv7-A-based-platform.p=
atch       \
-           file://0002-arm-Add-tiny-vexpress-machine.patch              =
           \
-           file://0003-arm-introduce-corstone700_defconfig.patch        =
           \
-           file://0004-add-driver-of-mailbox-handling-unit-controller-ve=
rsi.patch  \
-           file://0005-add-rpmsg-based-on-rpmsg-char-driver-using-mailbo=
x.patch    \
-           file://0006-enable-arm-MHU-driver-and-RPMSG-char-driver.patch=
           \
-           file://0007-allow-creation-of-multiple-arm-rpmsg-channels.pat=
ch         \
-           file://0008-mailbox-enable-combined-receiver-interrupt-when-u=
sin.patch  \
-           file://0009-misc-arm-add-corstone700-external-system-harness-=
dri.patch  \
-           file://0010-arm-containerize-endpoint-and-mailbox-information=
.patch     \
-           file://0011-arm-couple-mailbox-channel-ownership-to-rpmsg-end=
poi.patch  \
-           file://0012-mailbox-arm_mhu_v2-add-new-AMBA-ID-to-support-MHU=
-v2.patch  \
-           file://0013-mailbox-arm_mhu_v2-dynamic-allocation-of-channels=
.patch     \
-           file://0014-defconfig-adjust-XIP-physical-address-to-3MB-offs=
et.patch   \
-           file://0015-arm-Kconfig-disable-ARM_VIRT-extension-if-XIP_KER=
NEL.patch  \
-           file://0016-corstone700_defconfig-use-DDR-address-instead-of-=
sha.patch  \
-           file://0017-corstone700_defconfig-enable-configs-for-cramfs-x=
ip.patch   \
-           file://0018-usb-isp1760-move-to-regmap-for-register-access.pa=
tch        \
-           file://0019-usb-isp1760-hcd-refactor-mempool-config-and-setup=
.patch     \
-           file://0020-usb-isp1760-add-support-for-isp1763.patch        =
           \
-           "
-
-KERNEL_FEATURES:append:corstone700 =3D " bsp/arm-platforms/corstone700-b=
sp.scc"
-KERNEL_FEATURES:append:corstone700-fvp =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES', \
-                         'eth_lan91c111', \
-                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline=
.cfg \
-                          bsp/arm-platforms/corstone700/eth_lan91c111.sc=
c', \
-                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg'=
, \
-                          d)}"
-KERNEL_FEATURES:append:corstone700-mps3 =3D " \
-    ${@bb.utils.contains('MACHINE_FEATURES', \
-                         'eth_lan9115', \
-                         'bsp/arm-platforms/corstone700/xip_dhcp_cmdline=
.cfg \
-                          bsp/arm-platforms/corstone700/eth_lan9115.scc'=
, \
-                         'bsp/arm-platforms/corstone700/xip_cmdline.cfg'=
, \
-                          d)} \
-    ${@bb.utils.contains('MACHINE_FEATURES', \
-                         'usb_host', \
-                         'bsp/arm-platforms/corstone700/usb_host.cfg', \
-                         '', \
-                          d)}"
-
 #
 # Corstone1000 KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-t=
est-app_1.0.bb b/meta-arm-bsp/recipes-test/corstone700-test-app/corstone7=
00-test-app_1.0.bb
deleted file mode 100644
index 8bd71ac4..00000000
--- a/meta-arm-bsp/recipes-test/corstone700-test-app/corstone700-test-app=
_1.0.bb
+++ /dev/null
@@ -1,21 +0,0 @@
-SUMMARY =3D "CORSTONE700 systems communications tests"
-DESCRIPTION =3D "This is a Linux userspace tool to test the communicatio=
n between Corstone700 cores"
-HOMEPAGE =3D "https://git.linaro.org/landing-teams/working/arm/test-apps=
.git"
-LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://license.md;md5=3De44b2531cd6ffe9dece394dbe9=
88d9a0"
-
-SRC_URI =3D "git://git.linaro.org/landing-teams/working/arm/test-apps.gi=
t;protocol=3Dhttps;branch=3Dmaster"
-SRCREV =3D "ecd93a275d11cf08f670a97783110bd698250963"
-PV .=3D "~git${SRCPV}"
-
-COMPATIBLE_MACHINE =3D "(corstone700)"
-
-S =3D "${WORKDIR}/git"
-
-do_compile() {
-    ${CC} ${S}/test-app.c ${CFLAGS} ${LDFLAGS} -o ${S}/test-app
-}
-
-do_install() {
-    install -D -p -m 0755 ${S}/test-app ${D}${bindir}/test-app
-}
diff --git a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks b/meta-=
arm-bsp/wic/arm-reference-image.corstone700.wks
deleted file mode 100644
index af03b058..00000000
--- a/meta-arm-bsp/wic/arm-reference-image.corstone700.wks
+++ /dev/null
@@ -1,22 +0,0 @@
-# WIC partitioning for corstone700
-# Layout and maximum sizes:
-#
-# SPITOC: 1 KB
-# SE Ram FW: 32 KB
-# FIP image: 991 KB (composed of FIPTOC, BL32 and DTB)
-# XIP Cramfs rootfs: 2 MB
-# XIP Linux kernel: 3 MB
-#
-
-part --source rawcopy --sourceparams=3D"file=3Dspitoc.bin" --no-table --=
align 1 --fixed-size 1k
-
-part --source rawcopy --sourceparams=3D"file=3Dse_ramfw.bin" --no-table =
--align 1 --fixed-size 32k
-
-# Rawcopy of the FIP binary
-part --source rawcopy --sourceparams=3D"file=3Dfip.bin-corstone700" --no=
-table --align 1 --fixed-size 991k
-
-# Rawcopy of the rootfs
-part --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/arm-refer=
ence-image-${MACHINE}.cramfs-xip" --no-table --fixed-size 2
-
-# Rawcopy of the kernel binary
-part --source rawcopy --sourceparams=3D"file=3DxipImage" --no-table --fi=
xed-size 4
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone700.bb b/meta-arm/=
recipes-devtools/fvp/fvp-corstone700.bb
deleted file mode 100644
index bda96a6b..00000000
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone700.bb
+++ /dev/null
@@ -1,9 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "Corstone-700"
-MODEL_CODE =3D "FVP_Corstone_700"
-PV =3D "11.10.47"
-
-# Temporary SRC_URI as the URL structure is unconventional
-SRC_URI =3D "https://developer.arm.com/-/media/Arm%20Developer%20Communi=
ty/Downloads/OSS/FVP/${MODEL}/Corstone-700-updated-11-10-47/${MODEL_CODE}=
_${PV_URL}.tgz;subdir=3D${BP}"
-SRC_URI[sha256sum] =3D "255207771864edeca2610958811d30e458c03a2db0195035=
5a455513bad782ec"
--=20
2.25.1


