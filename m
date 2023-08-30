Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54D10C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 18:37:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2589.1693420665112007392
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 11:37:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B24B2F4
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 11:38:24 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DF323F64C
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 11:37:44 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/corstone500: removal of support
Date: Wed, 30 Aug 2023 13:37:39 -0500
Message-Id: <20230830183739.3694370-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 18:37:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5006

corstone500 is End-of-life'd (EOL'ed).  Remove support for it from the
tree.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |   8 -
 ci/corstone500.yml                            |  12 -
 ci/fvps.yml                                   |   1 -
 ci/jobs-to-kas                                |   2 +-
 kas/corstone500.yml                           |  50 ---
 meta-arm-bsp/conf/machine/corstone500.conf    |  49 ---
 meta-arm-bsp/documentation/corstone500.md     |  28 --
 .../trusted-firmware-a-corstone500.inc        |  17 -
 .../trusted-firmware-a_%.bbappend             |   1 -
 ...ng-generic-timer-access-through-MMIO.patch | 120 -------
 ...0002-board-arm-add-corstone500-board.patch | 297 ------------------
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   7 -
 .../linux/linux-arm-platforms.inc             |   7 -
 .../wic/core-image-minimal.corstone500.wks    |  12 -
 .../recipes-devtools/fvp/fvp-corstone500.bb   |  10 -
 15 files changed, 1 insertion(+), 620 deletions(-)
 delete mode 100644 ci/corstone500.yml
 delete mode 100644 kas/corstone500.yml
 delete mode 100644 meta-arm-bsp/conf/machine/corstone500.conf
 delete mode 100644 meta-arm-bsp/documentation/corstone500.md
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-corstone500.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/00=
01-armv7-adding-generic-timer-access-through-MMIO.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/00=
02-board-arm-add-corstone500-board.patch
 delete mode 100644 meta-arm-bsp/wic/core-image-minimal.corstone500.wks
 delete mode 100644 meta-arm/recipes-devtools/fvp/fvp-corstone500.bb

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 4a786f63..548b8e76 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -104,14 +104,6 @@ update-repos:
 #  VIRT: [none, xen]
 #  TESTING: testimage
=20
-corstone500:
-  extends: .build
-  parallel:
-    matrix:
-      - TESTING: testimage
-  tags:
-    - x86_64
-
 corstone1000-fvp:
   extends: .build
   parallel:
diff --git a/ci/corstone500.yml b/ci/corstone500.yml
deleted file mode 100644
index 2172bc1f..00000000
--- a/ci/corstone500.yml
+++ /dev/null
@@ -1,12 +0,0 @@
-header:
-  version: 14
-  includes:
-    - ci/base.yml
-    - ci/fvp.yml
-    - ci/poky-tiny.yml
-
-local_conf_header:
-  fvp-config: |
-    IMAGE_FEATURES:remove =3D " ssh-server-dropbear"
-
-machine: corstone500
diff --git a/ci/fvps.yml b/ci/fvps.yml
index cf4103ed..1bced299 100644
--- a/ci/fvps.yml
+++ b/ci/fvps.yml
@@ -15,7 +15,6 @@ local_conf_header:
=20
 target:
   - nativesdk-fvp-base-a-aem
-  - nativesdk-fvp-corstone500
   - nativesdk-fvp-corstone1000
   - nativesdk-fvp-n1-edge
   - nativesdk-fvp-sgi575
diff --git a/ci/jobs-to-kas b/ci/jobs-to-kas
index b8615a5f..eea6e463 100755
--- a/ci/jobs-to-kas
+++ b/ci/jobs-to-kas
@@ -3,7 +3,7 @@
 # This script is expecting an input of machine name, optionally followed=
 by a
 # colon and a list of one or more parameters separated by commas between
 # brackets.  For example, the following are acceptable:
-# corstone500
+# corstone1000-mps3
 # fvp-base: [testimage]
 # qemuarm64-secureboot: [clang, glibc, testimage]
 #
diff --git a/kas/corstone500.yml b/kas/corstone500.yml
deleted file mode 100644
index c27cb5f5..00000000
--- a/kas/corstone500.yml
+++ /dev/null
@@ -1,50 +0,0 @@
-header:
-  version: 11
-  includes:
-    - kas/fvp-eula.yml
-
-env:
-  DISPLAY: ""
-
-distro: poky-tiny
-
-defaults:
-  repos:
-    refspec: master
-
-repos:
-  meta-arm:
-    layers:
-      meta-arm:
-      meta-arm-bsp:
-      meta-arm-toolchain:
-
-  poky:
-    url: https://git.yoctoproject.org/git/poky
-    refspec: master
-    layers:
-      meta:
-      meta-poky:
-      meta-yocto-bsp:
-
-  meta-openembedded:
-    url: https://git.openembedded.org/meta-openembedded
-    refspec: master
-    layers:
-      meta-oe:
-      meta-python:
-
-local_conf_header:
-  base: |
-    CONF_VERSION =3D "2"
-    PACKAGE_CLASSES =3D "package_ipk"
-    BB_NUMBER_THREADS ?=3D "16"
-    PARALLEL_MAKE ?=3D "-j16"
-    PACKAGECONFIG:append:pn-perf =3D " coresight"
-  fvp-config: |
-    IMAGE_CLASSES:append =3D " ${@bb.utils.contains('BUILD_ARCH', 'x86_6=
4', 'fvpboot', '', d)}"
-
-machine: corstone500
-
-target:
-  - core-image-minimal
diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
deleted file mode 100644
index a169b921..00000000
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ /dev/null
@@ -1,49 +0,0 @@
-#@TYPE: Machine
-#@NAME: Corstone-500 machine
-#@DESCRIPTION: Machine configuration for the Corstone-500 platform
-
-require conf/machine/include/arm/armv7a/tune-cortexa5.inc
-
-# Corstone-500 is built against poky-tiny distro.
-# poky-tiny sets PREFERRED_PROVIDER_virtual/kernel to linux-yocto-tiny.
-# Since distro config is evaluated after the machine config, we need to
-# use the strongest override possible (forcevariable) so the
-# PREFERRED_PROVIDER_virtual/kernel specified in the machine config will
-# apply.
-#
-PREFERRED_PROVIDER_virtual/kernel:forcevariable =3D "linux-yocto"
-PREFERRED_VERSION_linux-yocto ?=3D "6.1%"
-
-EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a u-boot"
-
-IMAGE_CLASSES +=3D "wic_nopt"
-IMAGE_FSTYPES:forcevariable =3D "cpio.gz squashfs wic wic.nopt"
-
-SERIAL_CONSOLES =3D "115200;ttyAMA0"
-
-# Corstone-500 u-boot configuration
-UBOOT_MACHINE =3D "corstone500_defconfig"
-UBOOT_IMAGE_ENTRYPOINT =3D "0x84000000"
-UBOOT_IMAGE_LOADADDRESS =3D "0x84000000"
-PREFERRED_VERSION_u-boot ?=3D "2023.07%"
-
-# making sure EXTRA_IMAGEDEPENDS will be used while creating the image
-WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
-
-WKS_FILE ?=3D "core-image-minimal.corstone500.wks"
-
-TEST_TARGET =3D "OEFVPTarget"
-TEST_SUITES =3D "fvp_boot"
-
-FVP_PROVIDER ?=3D "fvp-corstone500-native"
-FVP_EXE ?=3D "FVP_Corstone-500"
-FVP_CONFIG[board.flashloader0.fname] ?=3D "bl1.bin"
-FVP_DATA ?=3D "css.cluster.cpu0=3D${IMAGE_NAME}.wic.nopt@0x80000000"
-FVP_CONSOLE ?=3D "terminal_0"
-FVP_TERMINALS[css.terminal_0] ?=3D "console"
-FVP_TERMINALS[css.terminal_1] ?=3D ""
-
-# Disable openssl in kmod to shink the initramfs size
-PACKAGECONFIG:remove:pn-kmod =3D "openssl"
-
-IMAGE_NAME_SUFFIX =3D ""
diff --git a/meta-arm-bsp/documentation/corstone500.md b/meta-arm-bsp/doc=
umentation/corstone500.md
deleted file mode 100644
index 0f019611..00000000
--- a/meta-arm-bsp/documentation/corstone500.md
+++ /dev/null
@@ -1,28 +0,0 @@
-# Corstone-500 Platform Support in meta-arm-bsp
-
-## Howto Build and Run
-
-### Configuration:
-
-Use the kas
-
-### Build:
-
-``bash$ kas build kas/corstone500.yml
-
-### Run:
-
-Building using kas should have fetch the Fixed Virtual Platform for this
-platform and installed at:
-
-build/tmp/sysroots-components/x86_64/fvp-corstone500-native/usr/bin/./FV=
P_Corstone-500
-
-with this in place is possible to launch the FVP using the runfvp inside=
 the
-scripts directory:
-
-cd scripts
-
-./runfvp ../build/tmp/deploy/images/corstone500/core-image-minimal-corst=
one500.fvpconf --console
-
-this will output the console in the launching terminal
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone500.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-=
firmware-a-corstone500.inc
deleted file mode 100644
index acd9e3db..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone500.inc
+++ /dev/null
@@ -1,17 +0,0 @@
-# Corstone-500 specific TFA support
-
-COMPATIBLE_MACHINE =3D "corstone500"
-TFA_PLATFORM =3D "a5ds"
-TFA_DEBUG =3D "1"
-TFA_UBOOT =3D "1"
-TFA_BUILD_TARGET =3D "all fip"
-TFA_INSTALL_TARGET =3D "bl1.bin fip.bin"
-
-EXTRA_OEMAKE:append =3D " \
-                    ARCH=3Daarch32 \
-                    FVP_HW_CONFIG_DTS=3Dfdts/a5ds.dts \
-                    ARM_ARCH_MAJOR=3D7 \
-                    AARCH32_SP=3Dsp_min \
-                    ARM_CORTEX_A5=3Dyes \
-                    ARM_XLAT_TABLES_LIB_V1=3D1 \
-                    "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a_%.bbappend
index 220dd6e3..7fbcd3ab 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bb=
append
@@ -3,7 +3,6 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/:"
 # Machine specific TFAs
=20
 MACHINE_TFA_REQUIRE ?=3D ""
-MACHINE_TFA_REQUIRE:corstone500 =3D "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv=
7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-throu=
gh-MMIO.patch
deleted file mode 100644
index ff1754fb..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
+++ /dev/null
@@ -1,120 +0,0 @@
-From 1f5d48695b896fcaf913eda788117b14afe84e39 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH] armv7: adding generic timer access through MMIO
-
-This driver enables the ARMv7 generic timer.
-
-The access to the timer registers is through memory mapping (MMIO).
-
-This driver can be used by u-boot to access to the timer through MMIO
-when arch_timer is not available in the core (access using system
-instructions not possible), for example, in case of Cortex-A5.
-
-This driver configures and enables the generic timer at
-the u-boot initcall level (timer_init) before u-boot relocation.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- arch/arm/cpu/armv7/Makefile     |  1 +
- arch/arm/cpu/armv7/mmio_timer.c | 75 +++++++++++++++++++++++++++++++++
- 2 files changed, 76 insertions(+)
- create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
-
-diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index 653eef8ad79e..5859b2e2120b 100644
---- a/arch/arm/cpu/armv7/Makefile
-+++ b/arch/arm/cpu/armv7/Makefile
-@@ -27,6 +27,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+=3D psci.o psci-common.o
-=20
- obj-$(CONFIG_IPROC) +=3D iproc-common/
- obj-$(CONFIG_SYS_ARCH_TIMER) +=3D arch_timer.o
-+obj-$(CONFIG_SYS_MMIO_TIMER) +=3D mmio_timer.o
-=20
- ifneq (,$(filter s5pc1xx exynos,$(SOC)))
- obj-y +=3D s5p-common/
-diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_t=
imer.c
-new file mode 100644
-index 000000000000..edd806e06e42
---- /dev/null
-+++ b/arch/arm/cpu/armv7/mmio_timer.c
-@@ -0,0 +1,75 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * Copyright (c) 2019, Arm Limited. All rights reserved.
-+ *
-+ */
-+
-+#include <common.h>
-+#include <asm/io.h>
-+#include <div64.h>
-+#include <bootstage.h>
-+#include <asm/global_data.h>
-+
-+DECLARE_GLOBAL_DATA_PTR;
-+
-+#define CNTCTLBASE    0x1a020000UL
-+#define CNTREADBASE   0x1a030000UL
-+#define CNTEN         (1 << 0)
-+#define CNTFCREQ      (1 << 8)
-+
-+static inline uint32_t mmio_read32(uintptr_t addr)
-+{
-+	return *(volatile uint32_t*)addr;
-+}
-+
-+static inline void mmio_write32(uintptr_t addr, uint32_t data)
-+{
-+	*(volatile uint32_t*)addr =3D data;
-+}
-+
-+int timer_init(void)
-+{
-+	/* calculate the frequency in ms */
-+	gd->arch.timer_rate_hz =3D COUNTER_FREQUENCY / CONFIG_SYS_HZ;
-+
-+	/* configure CNTFID0 register: set the base frequency */
-+	mmio_write32(CNTCTLBASE + 0x20, COUNTER_FREQUENCY);
-+
-+	/*
-+	 * configure CNTCR register:
-+	 *    enable the generic counter and;
-+	 *    select the first frequency entry
-+	 */
-+	mmio_write32(CNTCTLBASE, CNTFCREQ | CNTEN);
-+
-+	return 0;
-+}
-+
-+unsigned long long get_ticks(void)
-+{
-+	return (((u64)(mmio_read32(CNTREADBASE + 0x4)) << 32) |
-+		mmio_read32(CNTREADBASE));
-+}
-+
-+ulong get_timer(ulong base)
-+{
-+	return lldiv(get_ticks(), gd->arch.timer_rate_hz) - base;
-+}
-+
-+void __udelay(unsigned long usec)
-+{
-+	unsigned long endtime;
-+
-+	endtime =3D lldiv((unsigned long long)usec * gd->arch.timer_rate_hz,
-+			1000UL);
-+
-+	endtime +=3D get_ticks();
-+
-+	while (get_ticks() < endtime)
-+		;
-+}
-+
-+ulong get_tbclk(void)
-+{
-+	return gd->arch.timer_rate_hz;
-+}
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-boar=
d-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone500/0002-board-arm-add-corstone500-board.patch
deleted file mode 100644
index b938a46d..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
+++ /dev/null
@@ -1,297 +0,0 @@
-From e296c84e276e8ccc39dd593442a4f3f8655b1f57 Mon Sep 17 00:00:00 2001
-From: Rui Miguel Silva <rui.silva@linaro.org>
-Date: Wed, 8 Jan 2020 09:48:11 +0000
-Subject: [PATCH] board: arm: add corstone500 board
-
-Add support for the Arm corstone500 platform, with a cortex-a5
-chip, add the default configuration, initialization and
-makefile for this system.
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
----
- arch/arm/Kconfig                       |  10 +++
- board/armltd/corstone500/Kconfig       |  12 +++
- board/armltd/corstone500/Makefile      |   8 ++
- board/armltd/corstone500/corstone500.c |  48 ++++++++++++
- configs/corstone500_defconfig          |  41 ++++++++++
- include/configs/corstone500.h          | 103 +++++++++++++++++++++++++
- 6 files changed, 222 insertions(+)
- create mode 100644 board/armltd/corstone500/Kconfig
- create mode 100644 board/armltd/corstone500/Makefile
- create mode 100644 board/armltd/corstone500/corstone500.c
- create mode 100644 configs/corstone500_defconfig
- create mode 100644 include/configs/corstone500.h
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 99264a64780c..522e3e549c8d 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1338,6 +1338,15 @@ config TARGET_CORSTONE1000
- 	select PL01X_SERIAL
- 	select DM
-=20
-+config TARGET_CORSTONE500
-+	bool "Support Corstone500"
-+	select CPU_V7A
-+	select SEMIHOSTING
-+	select PL01X_SERIAL
-+	help
-+	  This enables support for Corstone500 ARM which is a
-+	  Cortex-A5 system
-+
- config TARGET_TOTAL_COMPUTE
- 	bool "Support Total Compute Platform"
- 	select ARM64
-@@ -2294,6 +2303,7 @@ source "board/bosch/shc/Kconfig"
- source "board/bosch/guardian/Kconfig"
- source "board/Marvell/octeontx/Kconfig"
- source "board/Marvell/octeontx2/Kconfig"
-+source "board/armltd/corstone500/Kconfig"
- source "board/armltd/vexpress/Kconfig"
- source "board/armltd/vexpress64/Kconfig"
- source "board/cortina/presidio-asic/Kconfig"
-diff --git a/board/armltd/corstone500/Kconfig b/board/armltd/corstone500=
/Kconfig
-new file mode 100644
-index 000000000000..8e689bd1fdc8
---- /dev/null
-+++ b/board/armltd/corstone500/Kconfig
-@@ -0,0 +1,12 @@
-+if TARGET_CORSTONE500
-+
-+config SYS_BOARD
-+	default "corstone500"
-+
-+config SYS_VENDOR
-+	default "armltd"
-+
-+config SYS_CONFIG_NAME
-+	default "corstone500"
-+
-+endif
-diff --git a/board/armltd/corstone500/Makefile b/board/armltd/corstone50=
0/Makefile
-new file mode 100644
-index 000000000000..6598fdd3ae0d
---- /dev/null
-+++ b/board/armltd/corstone500/Makefile
-@@ -0,0 +1,8 @@
-+# SPDX-License-Identifier: GPL-2.0+
-+#
-+# (C) Copyright 2022 ARM Limited
-+# (C) Copyright 2022 Linaro
-+# Rui Miguel Silva <rui.silva@linaro.org>
-+#
-+
-+obj-y :=3D corstone500.o
-diff --git a/board/armltd/corstone500/corstone500.c b/board/armltd/corst=
one500/corstone500.c
-new file mode 100644
-index 000000000000..19ec5564291f
---- /dev/null
-+++ b/board/armltd/corstone500/corstone500.c
-@@ -0,0 +1,48 @@
-+// SPDX-License-Identifier: GPL-2.0+
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * (C) Copyright 2022 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ */
-+
-+#include <common.h>
-+#include <dm.h>
-+#include <dm/platform_data/serial_pl01x.h>
-+#include <malloc.h>
-+#include <asm/global_data.h>
-+
-+static const struct pl01x_serial_plat serial_platdata =3D {
-+	.base =3D V2M_UART0,
-+	.type =3D TYPE_PL011,
-+	.clock =3D CFG_PL011_CLOCK,
-+};
-+
-+U_BOOT_DRVINFO(corstone500_serials) =3D {
-+	.name =3D "serial_pl01x",
-+	.plat =3D &serial_platdata,
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
-diff --git a/configs/corstone500_defconfig b/configs/corstone500_defconf=
ig
-new file mode 100644
-index 000000000000..91661beb8d8d
---- /dev/null
-+++ b/configs/corstone500_defconfig
-@@ -0,0 +1,41 @@
-+CONFIG_ARM=3Dy
-+CONFIG_SKIP_LOWLEVEL_INIT=3Dy
-+CONFIG_TARGET_CORSTONE500=3Dy
-+CONFIG_TEXT_BASE=3D0x88000000
-+CONFIG_SYS_MALLOC_LEN=3D0x840000
-+CONFIG_NR_DRAM_BANKS=3D1
-+CONFIG_ENV_SIZE=3D0x40000
-+CONFIG_SYS_PROMPT=3D"corstone500# "
-+CONFIG_IDENT_STRING=3D" corstone500 aarch32"
-+CONFIG_SYS_LOAD_ADDR=3D0x90000000
-+CONFIG_SYS_MEMTEST_START=3D0x80000000
-+CONFIG_SYS_MEMTEST_END=3D0xff000000
-+CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
-+CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
-+CONFIG_SUPPORT_RAW_INITRD=3Dy
-+CONFIG_BOOTDELAY=3D1
-+CONFIG_USE_BOOTARGS=3Dy
-+CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1a200000 root=3D=
/dev/ram0 rw loglevel=3D9"
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_HUSH_PARSER=3Dy
-+# CONFIG_CMD_CONSOLE is not set
-+CONFIG_CMD_BOOTZ=3Dy
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_EDITENV is not set
-+# CONFIG_CMD_ENV_EXISTS is not set
-+CONFIG_CMD_MEMTEST=3Dy
-+CONFIG_CMD_ARMFLASH=3Dy
-+# CONFIG_CMD_LOADS is not set
-+# CONFIG_CMD_ITEST is not set
-+# CONFIG_CMD_SETEXPR is not set
-+CONFIG_CMD_DHCP=3Dy
-+# CONFIG_CMD_NFS is not set
-+CONFIG_CMD_MII=3Dy
-+CONFIG_CMD_PING=3Dy
-+CONFIG_CMD_CACHE=3Dy
-+CONFIG_CMD_FAT=3Dy
-+CONFIG_DM=3Dy
-+CONFIG_MTD_NOR_FLASH=3Dy
-+CONFIG_DM_SERIAL=3Dy
-+CONFIG_OF_LIBFDT=3Dy
-diff --git a/include/configs/corstone500.h b/include/configs/corstone500=
.h
-new file mode 100644
-index 000000000000..555e0e44e432
---- /dev/null
-+++ b/include/configs/corstone500.h
-@@ -0,0 +1,103 @@
-+/* SPDX-License-Identifier: GPL-2.0+ */
-+/*
-+ * (C) Copyright 2022 ARM Limited
-+ * (C) Copyright 2022 Linaro
-+ * Rui Miguel Silva <rui.silva@linaro.org>
-+ *
-+ * Configuration for Cortex-A5 Corstone500. Parts were derived from oth=
er ARM
-+ * configurations.
-+ */
-+
-+#ifndef __CORSTONE500_H
-+#define __CORSTONE500_H
-+
-+/* Generic Timer Definitions */
-+#define CONFIG_SYS_HZ_CLOCK	7500000
-+#define CONFIG_SYS_HZ		1000
-+#define COUNTER_FREQUENCY	CONFIG_SYS_HZ_CLOCK
-+
-+#ifdef CONFIG_CORSTONE500_MEMORY_MAP_EXTENDED
-+#define V2M_SRAM0		0x00010000
-+#define V2M_SRAM1		0x02200000
-+#define V2M_QSPI		0x0a800000
-+#else
-+#define V2M_SRAM0		0x00000000
-+#define V2M_SRAM1		0x02000000
-+#define V2M_QSPI		0x08000000
-+#endif
-+
-+#define V2M_DEBUG		0x10000000
-+#define V2M_BASE_PERIPH		0x1a000000
-+#define V2M_A5_PERIPH		0x1c000000
-+#define V2M_L2CC_PERIPH		0x1c010000
-+
-+#define V2M_MASTER_EXPANSION0	0x40000000
-+#define V2M_MASTER_EXPANSION1	0x60000000
-+
-+#define V2M_BASE		0x80000000
-+
-+#define V2M_PERIPH_OFFSET(x)  (x << 16)
-+
-+#define V2M_SYSID		(V2M_BASE_PERIPH)
-+#define V2M_SYCTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(1))
-+#define V2M_COUNTER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(2))
-+#define V2M_COUNTER_READ	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(3))
-+#define V2M_TIMER_CTL		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(4))
-+#define V2M_TIMER0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(5))
-+
-+#define V2M_WATCHDOG_CTL	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(16))
-+#define V2M_WATCHDOG_REFRESH	(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(17))
-+
-+#define V2M_UART0		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(32))
-+#define V2M_UART1		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(33))
-+
-+#define V2M_RTC			(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(34))
-+#define V2M_TRNG		(V2M_BASE_PERIPH + V2M_PERIPH_OFFSET(35))
-+
-+/* PL011 Serial Configuration */
-+#define CONFIG_CONS_INDEX	0
-+#define CFG_PL011_CLOCK		7500000
-+
-+/* Physical Memory Map */
-+#define PHYS_SDRAM_1		(V2M_BASE)
-+
-+/* Top 16MB reserved for secure world use */
-+#define DRAM_SEC_SIZE		0x01000000
-+#define PHYS_SDRAM_1_SIZE	(0x80000000 - DRAM_SEC_SIZE)
-+
-+/* Miscellaneous configurable options */
-+#define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
-+
-+#define CONFIG_SYS_MMIO_TIMER
-+
-+#define CFG_EXTRA_ENV_SETTINGS     \
-+				"kernel_name=3DImage\0"           \
-+				"kernel_addr=3D0x80f00000\0"      \
-+				"initrd_name=3Dramdisk.img\0"     \
-+				"initrd_addr=3D0x84000000\0"      \
-+				"fdt_name=3Ddevtree.dtb\0"        \
-+				"fdt_addr=3D0x83000000\0"         \
-+				"fdt_high=3D0xffffffff\0"         \
-+				"initrd_high=3D0xffffffff\0"
-+
-+#define CONFIG_BOOTCOMMAND	"echo copy to RAM...; " \
-+				"cp.b 0x80100000 $kernel_addr 0xb00000; " \
-+				"cp.b 0x80d00000 $initrd_addr 0x800000; " \
-+				"bootz $kernel_addr $initrd_addr:0x800000 $fdt_addr"
-+
-+/* Monitor Command Prompt */
-+#define CFG_SYS_FLASH_BASE		0x80000000
-+
-+/* Store environment at top of flash */
-+#define CONFIG_ENV_ADDR			0x0a7c0000
-+#define CONFIG_ENV_SECT_SIZE		0x0040000
-+
-+#define CONFIG_SYS_FLASH_CFI		1
-+#define CONFIG_FLASH_CFI_DRIVER		1
-+#define CONFIG_SYS_FLASH_CFI_WIDTH	FLASH_CFI_32BIT
-+#define CONFIG_SYS_MAX_FLASH_BANKS	1
-+
-+#define CONFIG_SYS_FLASH_EMPTY_INFO   /* flinfo indicates empty blocks =
*/
-+#define FLASH_MAX_SECTOR_SI		0x00040000
-+#define CONFIG_ENV_IS_IN_FLASH		1
-+#endif
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 37dcc2ef..d1dcd745 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -1,12 +1,5 @@
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
=20
-#
-# Corstone-500 MACHINE
-#
-SRC_URI:append:corstone500 =3D " \
-                   file://0001-armv7-adding-generic-timer-access-through=
-MMIO.patch \
-                   file://0002-board-arm-add-corstone500-board.patch"
-
 #
 # Corstone1000 64-bit machines
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 740976e4..b49ac800 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -19,13 +19,6 @@ SRC_URI:append:juno =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:n1sdp =3D " ${SRC_URI_KMETA}"
 SRCREV:arm-platforms-kmeta =3D "6147e82375aa9df8f2a162d42ea6406c79c854c5=
"
=20
-#
-# Corstone-500 KMACHINE
-#
-COMPATIBLE_MACHINE:corstone500 =3D "corstone500"
-KBUILD_DEFCONFIG:corstone500  =3D "multi_v7_defconfig"
-KCONFIG_MODE:corstone500 =3D "--alldefconfig"
-
 #
 # Corstone1000 KMACHINE
 #
diff --git a/meta-arm-bsp/wic/core-image-minimal.corstone500.wks b/meta-a=
rm-bsp/wic/core-image-minimal.corstone500.wks
deleted file mode 100644
index 0ab359c4..00000000
--- a/meta-arm-bsp/wic/core-image-minimal.corstone500.wks
+++ /dev/null
@@ -1,12 +0,0 @@
-# WIC partitioning for corstone500
-# Layout and maximum sizes (to be defined):
-#
-
-# Rawcopy of the FIP binary
-part --source rawcopy --sourceparams=3D"file=3Dfip.bin" --no-table --ali=
gn 1 --fixed-size 1
-
-# Rawcopy of the kernel binary
-part --source rawcopy --sourceparams=3D"file=3DzImage" --no-table --fixe=
d-size 12
-
-# Rawcopy of the rootfs
-part --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/core-imag=
e-minimal-corstone500.squashfs" --no-table
diff --git a/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb b/meta-arm/=
recipes-devtools/fvp/fvp-corstone500.bb
deleted file mode 100644
index c80b94c4..00000000
--- a/meta-arm/recipes-devtools/fvp/fvp-corstone500.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require fvp-ecosystem.inc
-
-MODEL =3D "Corstone-500"
-MODEL_CODE =3D "FVP_Corstone_500"
-PV =3D "11.12.59"
-
-SRC_URI[sha256sum] =3D "26f0fbb52de2ccdb4c7b40b6f4ddb5eabdcb8173775fdd11=
c9a12173326f8614"
-
-LIC_FILES_CHKSUM =3D "file://license_terms/license_agreement.txt;md5=3D1=
a33828e132ba71861c11688dbb0bd16 \
-                    file://license_terms/third_party_licenses.txt;md5=3D=
47473b1e04b70938cf0a7ffea8ea4cc3"
--=20
2.30.2


