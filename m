Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862D6C43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 18:58:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.2046.1654109880451464323
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 11:58:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E791480
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Jun 2022 11:57:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A627A3F73D
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Jun 2022 11:57:59 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/3] arm-bsp: add u-boot v2022.01 support
Date: Wed,  1 Jun 2022 14:57:52 -0400
Message-Id: <20220601185752.31915-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601185752.31915-1-jon.mason@arm.com>
References: <20220601185752.31915-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Jun 2022 18:58:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3467

Upstream has updated u-boot to v2022.04, but the update is causing
problems with some machines.  Temporarily add a v2022.01 recipe until
the issues can be resolved.

u-boot and zephyr hacking

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 meta-arm-bsp/conf/machine/fvp-base.conf       |  2 ++
 .../conf/machine/fvp-baser-aemv8r64.conf      |  1 +
 ...ng-generic-timer-access-through-MMIO.patch | 20 +++++++------
 ...0002-board-arm-add-corstone500-board.patch | 28 ++++++++++---------
 .../recipes-bsp/u-boot/u-boot_2022.01.bb      | 26 +++++++++++++++++
 6 files changed, 56 insertions(+), 23 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/conf/machine/corstone500.conf
index 526fff78..6a3b36ee 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES = "115200;ttyAMA0"
 UBOOT_MACHINE = "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT = "0x84000000"
 UBOOT_IMAGE_LOADADDRESS = "0x84000000"
-PREFERRED_VERSION_u-boot ?= "2022.01"
+PREFERRED_VERSION_u-boot ?= "2022.04"
 
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append = " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index d0152024..91b3f443 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,6 +9,8 @@ require conf/machine/include/arm/arch-armv8a.inc
 
 TUNE_FEATURES = "aarch64"
 
+PREFERRED_VERSION_u-boot ?= "2022.01"
+
 # FVP u-boot configuration
 UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
 
diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 7e45ff81..d5e46850 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -11,6 +11,7 @@ EXTRA_IMAGEDEPENDS += "boot-wrapper-aarch64"
 PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?= "5.15%"
 PREFERRED_VERSION_linux-yocto-rt ?= "5.15%"
+PREFERRED_VERSION_u-boot ?= "2022.01"
 
 KERNEL_IMAGETYPE = "Image"
 KERNEL_DEVICETREE = "arm/fvp-baser-aemv8r64.dtb"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
index 79c812da..8a98f9de 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-through-MMIO.patch
@@ -1,11 +1,11 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 3d991cd405ecffec480c12689fc02670aeb5ec53 Mon Sep 17 00:00:00 2001
+From fff63cfd7d9654dc9ed0c106f29d3a7ad01b0502 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
 Subject: [PATCH 1/2] armv7: adding generic timer access through MMIO
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
 This driver enables the ARMv7 generic timer.
 
 The access to the timer registers is through memory mapping (MMIO).
@@ -19,6 +19,8 @@ the u-boot initcall level (timer_init) before u-boot relocation.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
+%% original patch: 0001-armv7-adding-generic-timer-access-through-MMIO.patch
 ---
  arch/arm/cpu/armv7/Makefile     |  1 +
  arch/arm/cpu/armv7/mmio_timer.c | 75 +++++++++++++++++++++++++++++++++
@@ -27,7 +29,7 @@ Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
  create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
 
 diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index bfbd85ae64ef..1a0a24e53110 100644
+index bfbd85ae64..1a0a24e531 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
 @@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+= psci.o psci-common.o
@@ -40,7 +42,7 @@ index bfbd85ae64ef..1a0a24e53110 100644
  obj-y += s5p-common/
 diff --git a/arch/arm/cpu/armv7/mmio_timer.c b/arch/arm/cpu/armv7/mmio_timer.c
 new file mode 100644
-index 000000000000..edd806e06e42
+index 0000000000..edd806e06e
 --- /dev/null
 +++ b/arch/arm/cpu/armv7/mmio_timer.c
 @@ -0,0 +1,75 @@
@@ -120,10 +122,10 @@ index 000000000000..edd806e06e42
 +	return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index b9c1c61e13dc..881cd0c51e78 100644
+index a6bc234f51..8d5cd67ace 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -2234,6 +2234,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -1524,6 +1524,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
@@ -132,5 +134,5 @@ index b9c1c61e13dc..881cd0c51e78 100644
  CONFIG_SYS_MONITOR_LEN
  CONFIG_SYS_MONITOR_SEC
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
index b7a70a23..29b29438 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-add-corstone500-board.patch
@@ -1,16 +1,18 @@
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
-
-From 8f315a9be2dbd9b8da4715aaaf02fab93595ca9e Mon Sep 17 00:00:00 2001
+From 73c319a1096259652853fa2538a733a8ebea96a8 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
 Subject: [PATCH 2/2] board: arm: add corstone500 board
 
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+
 Add support for the Arm corstone500 platform, with a cortex-a5
 chip, add the default configuration, initialization and
 makefile for this system.
 
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
+%% original patch: 0002-board-arm-add-corstone500-board.patch
 ---
  arch/arm/Kconfig                       |  10 +++
  board/armltd/corstone500/Kconfig       |  12 +++
@@ -26,10 +28,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
  create mode 100644 include/configs/corstone500.h
 
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index f7f03837feb4..43249a043b5d 100644
+index 4567c183fb..66f99fdf4f 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -639,6 +639,15 @@ config ARCH_BCMSTB
+@@ -641,6 +641,15 @@ config ARCH_BCMSTB
  	  This enables support for Broadcom ARM-based set-top box
  	  chipsets, including the 7445 family of chips.
  
@@ -45,7 +47,7 @@ index f7f03837feb4..43249a043b5d 100644
  config TARGET_VEXPRESS_CA9X4
  	bool "Support vexpress_ca9x4"
  	select CPU_V7A
-@@ -2156,6 +2165,7 @@ source "board/bosch/shc/Kconfig"
+@@ -2202,6 +2211,7 @@ source "board/bosch/shc/Kconfig"
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
  source "board/Marvell/octeontx2/Kconfig"
@@ -55,7 +57,7 @@ index f7f03837feb4..43249a043b5d 100644
  source "board/cortina/presidio-asic/Kconfig"
 diff --git a/board/armltd/corstone500/Kconfig b/board/armltd/corstone500/Kconfig
 new file mode 100644
-index 000000000000..8e689bd1fdc8
+index 0000000000..8e689bd1fd
 --- /dev/null
 +++ b/board/armltd/corstone500/Kconfig
 @@ -0,0 +1,12 @@
@@ -73,7 +75,7 @@ index 000000000000..8e689bd1fdc8
 +endif
 diff --git a/board/armltd/corstone500/Makefile b/board/armltd/corstone500/Makefile
 new file mode 100644
-index 000000000000..6598fdd3ae0d
+index 0000000000..6598fdd3ae
 --- /dev/null
 +++ b/board/armltd/corstone500/Makefile
 @@ -0,0 +1,8 @@
@@ -87,7 +89,7 @@ index 000000000000..6598fdd3ae0d
 +obj-y := corstone500.o
 diff --git a/board/armltd/corstone500/corstone500.c b/board/armltd/corstone500/corstone500.c
 new file mode 100644
-index 000000000000..e878f5c6a521
+index 0000000000..e878f5c6a5
 --- /dev/null
 +++ b/board/armltd/corstone500/corstone500.c
 @@ -0,0 +1,48 @@
@@ -141,7 +143,7 @@ index 000000000000..e878f5c6a521
 +
 diff --git a/configs/corstone500_defconfig b/configs/corstone500_defconfig
 new file mode 100644
-index 000000000000..d3161a4b40d8
+index 0000000000..d3161a4b40
 --- /dev/null
 +++ b/configs/corstone500_defconfig
 @@ -0,0 +1,40 @@
@@ -187,7 +189,7 @@ index 000000000000..d3161a4b40d8
 +CONFIG_OF_LIBFDT=y
 diff --git a/include/configs/corstone500.h b/include/configs/corstone500.h
 new file mode 100644
-index 000000000000..93c397d2f515
+index 0000000000..93c397d2f5
 --- /dev/null
 +++ b/include/configs/corstone500.h
 @@ -0,0 +1,109 @@
@@ -301,5 +303,5 @@ index 000000000000..93c397d2f515
 +#define CONFIG_ENV_IS_IN_FLASH		1
 +#endif
 -- 
-2.35.1
+2.30.2
 
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb
new file mode 100644
index 00000000..4c5237c7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.01.bb
@@ -0,0 +1,26 @@
+HOMEPAGE = "http://www.denx.de/wiki/U-Boot/WebHome"
+DESCRIPTION = "U-Boot, a boot loader for Embedded boards based on PowerPC, \
+ARM, MIPS and several other processors, which can be installed in a boot \
+ROM and used to initialize and test the hardware or to download and run \
+application code."
+SECTION = "bootloaders"
+DEPENDS += "flex-native bison-native"
+
+LICENSE = "GPL-2.0-or-later"
+LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
+PE = "1"
+
+# We use the revision in order to avoid having to fetch it from the
+# repo during parse
+SRCREV = "d637294e264adfeb29f390dfc393106fd4d41b17"
+
+SRC_URI = "git://git.denx.de/u-boot.git;branch=master \
+          "
+
+S = "${WORKDIR}/git"
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+require recipes-bsp/u-boot/u-boot.inc
+
+DEPENDS += "bc-native dtc-native"
-- 
2.17.1


