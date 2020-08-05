Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by mx.groups.io with SMTP id smtpd.web11.4446.1596623823501365158
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 03:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@andersdellien.se header.s=20191106 header.b=lY3mFddq;
 spf=none, err=permanent DNS error (domain: andersdellien.se, ip: 46.30.210.182, mailfrom: anders@andersdellien.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=andersdellien.se; s=20191106;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:date:subject:cc:to:from:from;
	bh=YI+xZSVIw8cGj292USemzecz6y73VW2ZJKUskFKvtUs=;
	b=lY3mFddqOr/9zw7XOxJ7m2G7Th4CV1t6yeTNqx93as1knKMKNgR9A3XJadTRQgqWdigEaignKAcJ+
	 0EPtG+D+ySX6Mzf7XG0hIWzaabhJuDErg4NoYrNDYmjeasO5c350qJnTJaD3/eZRTmrfgYH428SgQg
	 cL1Pq/vvRIvRh4ijQyrKPhU4UcmtmooLctDm0BFSOz5k8sGwWfwwdAYX1omNhZqaBjU4c1LgRMjJkp
	 gsoJnkO1u4W4Md7s4tCcW47UUeguQ1JPC4fzvTmmQa6MT3y2nwSwKq7/xjKCTtlFNK56OhxXgkJL01
	 i1+9N+f9C3awsL0clYI8NyIH3+XfFnA==
X-HalOne-Cookie: ad9a7fa6b63d752a81a0584cedcae144f45887ae
X-HalOne-ID: 980233ac-d707-11ea-b2e9-d0431ea8a283
Received: from e110568.arm.com (unknown [90.255.41.247])
	by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 980233ac-d707-11ea-b2e9-d0431ea8a283;
	Wed, 05 Aug 2020 10:37:00 +0000 (UTC)
From: "Anders Dellien" <anders@andersdellien.se>
To: meta-arm@lists.yoctoproject.org
Cc: Anders Dellien <anders.dellien@arm.com>
Subject: [PATCH v2 3/3] arm-bsp: Introduce 32-bit FVP-BASE platform and BSP
Date: Wed,  5 Aug 2020 11:36:13 +0100
Message-Id: <20200805103613.544-3-anders@andersdellien.se>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200805103613.544-1-anders@andersdellien.se>
References: <20200805103613.544-1-anders@andersdellien.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Anders Dellien <anders.dellien@arm.com>

Also refactor fvp-common.inc to contain definitions shared
between fvp-base, fvp-base-arm32 and foundation-armv8

Change-Id: I3634c3fefa8d793d0bcf5fcfd7458e6dbd2a6622
Signed-off-by: Anders Dellien <anders.dellien@arm.com>
---
 .../conf/machine/foundation-armv8.conf        |  13 +-
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf |  17 +
 meta-arm-bsp/conf/machine/fvp-base.conf       |  13 +-
 meta-arm-bsp/conf/machine/fvp-common.inc      |  17 +-
 meta-arm-bsp/documentation/fvp-base-arm32.md  |  61 ++
 .../bsp/arm-platforms/fvp-arm32-standard.scc  |   7 +
 .../bsp/arm-platforms/fvp-arm32.scc           |  16 +
 .../0001-ARM-vexpress-enable-GICv3.patch      |  31 +
 .../bsp/arm-platforms/fvp-arm32/fvp-board.cfg |  12 +
 .../arm-platforms/fvp-arm32/fvp-features.cfg  |  25 +
 .../bsp/arm-platforms/fvp/fvp-net.cfg         |   1 +
 .../linux/files/fvp-base-arm32-dts.patch      | 580 ++++++++++++++++++
 .../linux/linux-arm-platforms.inc             |   8 +
 13 files changed, 781 insertions(+), 20 deletions(-)
 create mode 100644 meta-arm-bsp/conf/machine/fvp-base-arm32.conf
 create mode 100644 meta-arm-bsp/documentation/fvp-base-arm32.md
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-board.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-bsp/conf/machine/foundation-armv8.conf
index 0ff1060..0ec6ecd 100644
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ b/meta-arm-bsp/conf/machine/foundation-armv8.conf
@@ -5,10 +5,13 @@
 #@DESCRIPTION: Machine configuration for Armv8-A Foundation Platform model
 
 require conf/machine/fvp-common.inc
+require conf/machine/include/arm/arch-armv8a.inc
 
-KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
+TUNE_FEATURES = "aarch64"
+
+# FVP u-boot configuration
+UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
 
-# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
-# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
-PACKAGE_EXCLUDE_append = " rng-tools"
-MACHINE_EXTRA_RRECOMMENDS += "haveged"
+KERNEL_IMAGETYPE = "Image"
+
+KERNEL_DEVICETREE = "arm/foundation-v8-gicv3-psci.dtb"
diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
new file mode 100644
index 0000000..3c3e5ac
--- /dev/null
+++ b/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
@@ -0,0 +1,17 @@
+# Configuration for Armv7-A Base Platform FVP
+
+#@TYPE: Machine
+#@NAME: Armv7-A Base Platform FVP machine
+#@DESCRIPTION: Machine configuration for Armv7-A Base Platform FVP model
+
+require conf/machine/fvp-common.inc
+require conf/machine/include/arm/arch-armv7a.inc
+
+KERNEL_IMAGETYPE = "zImage"
+
+PREFERRED_VERSION_trusted-firmware-a ?= "2.2%"
+
+# FVP u-boot configuration
+UBOOT_MACHINE = "vexpress_aemv8a_aarch32_defconfig"
+
+KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/machine/fvp-base.conf
index 321b5d5..4bccdb6 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -5,10 +5,13 @@
 #@DESCRIPTION: Machine configuration for Armv8-A Base Platform FVP model
 
 require conf/machine/fvp-common.inc
+require conf/machine/include/arm/arch-armv8a.inc
 
-KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
+TUNE_FEATURES = "aarch64"
+
+# FVP u-boot configuration
+UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
 
-# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
-# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
-PACKAGE_EXCLUDE_append = " rng-tools"
-MACHINE_EXTRA_RRECOMMENDS += "haveged"
+KERNEL_IMAGETYPE = "Image"
+
+KERNEL_DEVICETREE = "arm/fvp-base-gicv3-psci-custom.dtb"
diff --git a/meta-arm-bsp/conf/machine/fvp-common.inc b/meta-arm-bsp/conf/machine/fvp-common.inc
index 08f8b15..2279338 100644
--- a/meta-arm-bsp/conf/machine/fvp-common.inc
+++ b/meta-arm-bsp/conf/machine/fvp-common.inc
@@ -1,18 +1,12 @@
 # FVP common parameters
 
 #
-# Capturing FVP common configurations (Armv8-A Base Platform FVP and
-# Armv8-A Foundation Platform).
+# Capturing FVP common configurations (Armv8-A Base Platform FVP,
+# Armv8-A Foundation Platform and Armv7-A Base Platform FVP).
 #
 
-TUNE_FEATURES = "aarch64"
-
-require conf/machine/include/arm/arch-armv8a.inc
-
 MACHINE_FEATURES = "optee"
 
-KERNEL_IMAGETYPE = "Image"
-
 IMAGE_CLASSES += "image_types_disk_img"
 IMAGE_FSTYPES += "disk.img"
 
@@ -39,5 +33,8 @@ PREFERRED_VERSION_linux-yocto ?= "5.4%"
 
 EXTRA_IMAGEDEPENDS += "virtual/trusted-firmware-a u-boot"
 
-# FVP u-boot configuration
-UBOOT_MACHINE = "vexpress_aemv8a_semi_defconfig"
+# Use haveged as a source of entropy instead of rng-tools (Needed for ssh).
+# rngd (Part of rng-tools) takes ~7 mins to init resulting in a slow boot time.
+PACKAGE_EXCLUDE_append = " rng-tools"
+MACHINE_EXTRA_RRECOMMENDS += "haveged"
+
diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/documentation/fvp-base-arm32.md
new file mode 100644
index 0000000..363e6b2
--- /dev/null
+++ b/meta-arm-bsp/documentation/fvp-base-arm32.md
@@ -0,0 +1,61 @@
+# Armv7-A Base Platform FVP Support in meta-arm-platforms
+
+## How to build and run
+
+### Configuration:
+In the local.conf file, MACHINE should be set as follows:
+MACHINE ?= "fvp-base-arm32"
+
+### Build:
+```bash$ bitbake core-image-minimal```
+
+### Run:
+To Run the Fixed Virtual Platform simulation tool you must download "Armv8-A
+Base Platform FVP" from Arm developer (This might require the user to
+register) from this address:
+https://developer.arm.com/tools-and-software/simulation-models/fixed-virtual-platforms
+and install it on your host PC.
+
+Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
+https://developer.arm.com/docs/100966/latest
+
+Armv8‑A Foundation Platform User Guide:
+https://developer.arm.com/docs/100961/latest/
+
+
+Once done, do the following to build and run an image:
+```bash$ bitbake core-image-minimal```
+```bash$ export YOCTO_DEPLOY_IMGS_DIR="<yocto-build-dir/tmp/deploy/images/fvp-base-arm32>"```
+```bash$ cd <path-to-Base_RevC_AEMv8A_pkg-dir/models/Linux64_GCC-X.X/>```
+```
+bash$ ./FVP_Base_RevC-2xAEMv8A -C bp.virtio_net.enabled=1 \
+         -C cache_state_modelled=0 \
+         -C bp.secureflashloader.fname=${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin \
+         -C bp.flashloader0.fname=${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin \
+         --data cluster0.cpu0=${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
+         -C bp.virtioblockdevice.image_path=${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fvp-base-arm32.disk.img \
+         -C cluster0.cpu0.CONFIG64=0 \
+         -C cluster0.cpu1.CONFIG64=0 \
+         -C cluster0.cpu2.CONFIG64=0 \
+         -C cluster0.cpu3.CONFIG64=0 \
+         -C cluster1.cpu0.CONFIG64=0 \
+         -C cluster1.cpu1.CONFIG64=0 \
+         -C cluster1.cpu2.CONFIG64=0 \
+         -C cluster1.cpu3.CONFIG64=0 \
+
+```
+
+
+If you have built a configuration without a ramdisk, you can use the following
+command in U-boot to start Linux:
+```fvp32# bootz 0x80080000 - 0x82000000```
+
+## Devices supported in the kernel
+- serial
+- virtio disk
+- network
+- watchdog
+- rtc
+
+## Devices not supported or not functional
+None
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
new file mode 100644
index 0000000..a92d945
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
@@ -0,0 +1,7 @@
+define KMACHINE fvp-arm32
+define KTYPE standard
+define KARCH arm
+define KMETA_EXTERNAL_BSP t
+
+include fvp-arm32.scc
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
new file mode 100644
index 0000000..f95b036
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32.scc
@@ -0,0 +1,16 @@
+include features/input/input.scc
+include cfg/timer/no_hz.scc
+
+patch fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
+
+kconf hardware fvp-arm32/fvp-board.cfg
+kconf hardware fvp-arm32/fvp-features.cfg
+kconf hardware fvp/fvp-net.cfg
+kconf hardware fvp/fvp-rtc.cfg
+kconf hardware fvp/fvp-serial.cfg
+kconf hardware fvp/fvp-virtio.cfg
+kconf hardware fvp/fvp-cfi.cfg
+kconf hardware fvp/fvp-drm.cfg
+kconf hardware fvp/fvp-timer.cfg
+kconf hardware fvp/fvp-virtio.cfg
+kconf hardware fvp/fvp-watchdog.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
new file mode 100644
index 0000000..d0a05c2
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/0001-ARM-vexpress-enable-GICv3.patch
@@ -0,0 +1,31 @@
+From 5dbb6c4267b1e46ed08359be363d8bc9b6a79397 Mon Sep 17 00:00:00 2001
+From: Ryan Harkin <ryan.harkin@linaro.org>
+Date: Wed, 16 Nov 2016 14:43:02 +0000
+Subject: [PATCH] ARM: vexpress: enable GICv3
+
+Upstream-Status: Pending
+
+ARMv8 targets such as ARM's FVP Cortex-A32 model can run the 32-bit
+ARMv7 kernel.  And these targets often contain GICv3.
+
+Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
+Signed-off-by: Jon Medhurst <tixy@linaro.org>
+---
+ arch/arm/mach-vexpress/Kconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-vexpress/Kconfig b/arch/arm/mach-vexpress/Kconfig
+index 7c728ebc0b33..ed579382d41f 100644
+--- a/arch/arm/mach-vexpress/Kconfig
++++ b/arch/arm/mach-vexpress/Kconfig
+@@ -4,6 +4,7 @@ menuconfig ARCH_VEXPRESS
+ 	select ARCH_SUPPORTS_BIG_ENDIAN
+ 	select ARM_AMBA
+ 	select ARM_GIC
++	select ARM_GIC_V3
+ 	select ARM_GLOBAL_TIMER
+ 	select ARM_TIMER_SP804
+ 	select COMMON_CLK_VERSATILE
+-- 
+2.17.1
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-board.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-board.cfg
new file mode 100644
index 0000000..e49a1e3
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-board.cfg
@@ -0,0 +1,12 @@
+CONFIG_ARM=y
+
+CONFIG_ARCH_VEXPRESS=y
+CONFIG_SMP=y
+CONFIG_NR_CPUS=8
+CONFIG_HOTPLUG_CPU=y
+
+CONFIG_REGULATOR=y
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+
+CONFIG_CPU_IDLE=y
+CONFIG_ARM_CPUIDLE=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
new file mode 100644
index 0000000..f2164f7
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
@@ -0,0 +1,25 @@
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_EXT4_FS=y
+CONFIG_BINFMT_SCRIPT=y
+CONFIG_BINFMT_MISC=y
+CONFIG_PRINTK_TIME=y
+CONFIG_HIGHMEM=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_TMPFS_XATTR=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_DEBUG_FS=y
+CONFIG_GENERIC_SCHED_CLOCK=y
+CONFIG_CLKDEV_LOOKUP=y
+CONFIG_NET=y
+CONFIG_NETDEVICES=y
+CONFIG_UNIX=y
+CONFIG_ETHERNET=y
+CONFIG_VFP=y
+CONFIG_VFPv3=y
+CONFIG_NEON=y
+CONFIG_KERNEL_MODE_NEON=y
+
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-net.cfg b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-net.cfg
index 54e3686..20cc408 100644
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-net.cfg
+++ b/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platforms/fvp/fvp-net.cfg
@@ -1,2 +1,3 @@
+CONFIG_NET_VENDOR_SMSC=y
 CONFIG_SMSC911X=y
 CONFIG_SMC91X=y
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
new file mode 100644
index 0000000..de7b752
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32-dts.patch
@@ -0,0 +1,580 @@
+These DTS files are the same as the ones provided for fvp-base.
+They will be temporarily provided here until we can use the DTS files from TF-A.
+So, no need to upstream.
+
+Upstream-Status: Inappropriate
+Signed-off-by: Anders Dellien <anders.dellien@arm.com>
+
+diff --git a/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
+new file mode 100644
+index 000000000000..f4601c7f99f8
+--- /dev/null
++++ b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-common-custom.dtsi
+@@ -0,0 +1,264 @@
++/*
++ * Copyright (c) 2017-2018, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/memreserve/ 0x80000000 0x00010000;
++
++/include/ "rtsm_ve-motherboard-nomap.dtsi"
++
++/ {
++       model = "FVP Base";
++       compatible = "arm,vfp-base", "arm,vexpress";
++       interrupt-parent = <&gic>;
++       #address-cells = <2>;
++       #size-cells = <2>;
++
++       aliases {
++               serial0 = &v2m_serial0;
++               serial1 = &v2m_serial1;
++               serial2 = &v2m_serial2;
++               serial3 = &v2m_serial3;
++       };
++
++       psci {
++               compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";
++               method = "smc";
++               cpu_suspend = <0xc4000001>;
++               cpu_off = <0x84000002>;
++               cpu_on = <0xc4000003>;
++               sys_poweroff = <0x84000008>;
++               sys_reset = <0x84000009>;
++       };
++
++       cpus {
++               #address-cells = <2>;
++               #size-cells = <0>;
++
++               cpu-map {
++                       cluster0 {
++                               core0 {
++                                       cpu = <&CPU0>;
++                               };
++                               core1 {
++                                       cpu = <&CPU1>;
++                               };
++                               core2 {
++                                       cpu = <&CPU2>;
++                               };
++                               core3 {
++                                       cpu = <&CPU3>;
++                               };
++                       };
++
++                       cluster1 {
++                               core0 {
++                                       cpu = <&CPU4>;
++                               };
++                               core1 {
++                                       cpu = <&CPU5>;
++                               };
++                               core2 {
++                                       cpu = <&CPU6>;
++                               };
++                               core3 {
++                                       cpu = <&CPU7>;
++                               };
++                       };
++               };
++
++               idle-states {
++                       entry-method = "arm,psci";
++
++                       CPU_SLEEP_0: cpu-sleep-0 {
++                               compatible = "arm,idle-state";
++                               local-timer-stop;
++                               arm,psci-suspend-param = <0x0010000>;
++                               entry-latency-us = <40>;
++                               exit-latency-us = <100>;
++                               min-residency-us = <150>;
++                       };
++
++                       CLUSTER_SLEEP_0: cluster-sleep-0 {
++                               compatible = "arm,idle-state";
++                               local-timer-stop;
++                               arm,psci-suspend-param = <0x1010000>;
++                               entry-latency-us = <500>;
++                               exit-latency-us = <1000>;
++                               min-residency-us = <2500>;
++                       };
++               };
++
++               CPU0:cpu@0 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x0>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU1:cpu@1 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x1>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU2:cpu@2 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x2>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU3:cpu@3 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x3>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU4:cpu@100 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x100>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU5:cpu@101 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x101>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU6:cpu@102 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x102>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               CPU7:cpu@103 {
++                       device_type = "cpu";
++                       compatible = "arm,armv8";
++                       reg = <0x0 0x103>;
++                       enable-method = "psci";
++                       cpu-idle-states = <&CPU_SLEEP_0 &CLUSTER_SLEEP_0>;
++                       next-level-cache = <&L2_0>;
++               };
++
++               L2_0: l2-cache0 {
++                       compatible = "cache";
++               };
++       };
++
++       memory@80000000 {
++               device_type = "memory";
++               reg = <0x00000000 0x80000000 0 0x7F000000>,
++                     <0x00000008 0x80000000 0 0x80000000>;
++       };
++
++       gic: interrupt-controller@2f000000 {
++               compatible = "arm,gic-v3";
++               #interrupt-cells = <3>;
++               #address-cells = <2>;
++               #size-cells = <2>;
++               ranges;
++               interrupt-controller;
++               reg = <0x0 0x2f000000 0 0x10000>,       // GICD
++                     <0x0 0x2f100000 0 0x200000>,      // GICR
++                     <0x0 0x2c000000 0 0x2000>,        // GICC
++                     <0x0 0x2c010000 0 0x2000>,        // GICH
++                     <0x0 0x2c02f000 0 0x2000>;        // GICV
++               interrupts = <1 9 4>;
++
++               its: its@2f020000 {
++                       compatible = "arm,gic-v3-its";
++                       msi-controller;
++                       reg = <0x0 0x2f020000 0x0 0x20000>; // GITS
++               };
++       };
++
++       timer {
++               compatible = "arm,armv8-timer";
++               interrupts = <1 13 0xff01>,
++                            <1 14 0xff01>,
++                            <1 11 0xff01>,
++                            <1 10 0xff01>;
++               clock-frequency = <100000000>;
++       };
++
++       timer@2a810000 {
++                       compatible = "arm,armv7-timer-mem";
++                       reg = <0x0 0x2a810000 0x0 0x10000>;
++                       clock-frequency = <100000000>;
++                       #address-cells = <2>;
++                       #size-cells = <2>;
++                       ranges;
++                       frame@2a830000 {
++                               frame-number = <1>;
++                               interrupts = <0 26 4>;
++                               reg = <0x0 0x2a830000 0x0 0x10000>;
++                       };
++       };
++
++       pmu {
++               compatible = "arm,armv8-pmuv3";
++               interrupts = <0 60 4>,
++                            <0 61 4>,
++                            <0 62 4>,
++                            <0 63 4>;
++       };
++
++       smb@8000000 {
++               compatible = "simple-bus";
++
++               #address-cells = <2>;
++               #size-cells = <1>;
++               ranges = <0 0 0 0x08000000 0x04000000>,
++                        <1 0 0 0x14000000 0x04000000>,
++                        <2 0 0 0x18000000 0x04000000>,
++                        <3 0 0 0x1c000000 0x04000000>,
++                        <4 0 0 0x0c000000 0x04000000>,
++                        <5 0 0 0x10000000 0x04000000>;
++       };
++
++       panels {
++               panel {
++                       compatible      = "panel";
++                       mode            = "XVGA";
++                       refresh         = <60>;
++                       xres            = <1024>;
++                       yres            = <768>;
++                       pixclock        = <15748>;
++                       left_margin     = <152>;
++                       right_margin    = <48>;
++                       upper_margin    = <23>;
++                       lower_margin    = <3>;
++                       hsync_len       = <104>;
++                       vsync_len       = <4>;
++                       sync            = <0>;
++                       vmode           = "FB_VMODE_NONINTERLACED";
++                       tim2            = "TIM2_BCD", "TIM2_IPC";
++                       cntl            = "CNTL_LCDTFT", "CNTL_BGR", "CNTL_LCDVCOMP(1)";
++                       caps            = "CLCD_CAP_5551", "CLCD_CAP_565", "CLCD_CAP_888";
++                       bpp             = <16>;
++               };
++       };
++
++};
+diff --git a/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-custom.dts b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-custom.dts
+new file mode 100644
+index 000000000000..984dbca90126
+--- /dev/null
++++ b/arch/arm/boot/dts/arm/fvp-base-gicv3-psci-custom.dts
+@@ -0,0 +1,9 @@
++/*
++ * Copyright (c) 2013-2017, ARM Limited and Contributors. All rights reserved.
++ *
++ * SPDX-License-Identifier: BSD-3-Clause
++ */
++
++/dts-v1/;
++
++/include/ "fvp-base-gicv3-psci-common-custom.dtsi"
+diff --git a/arch/arm/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi b/arch/arm/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi
+new file mode 100644
+index 000000000000..a94f7cb863a2
+--- /dev/null
++++ b/arch/arm/boot/dts/arm/rtsm_ve-motherboard-nomap.dtsi
+@@ -0,0 +1,282 @@
++// SPDX-License-Identifier: GPL-2.0
++/*
++ * ARM Ltd. Fast Models
++ *
++ * Versatile Express (VE) system model
++ * Motherboard component
++ *
++ * VEMotherBoard.lisa
++ *
++ * This is a duplicate of rtsm_ve-motherboard.dtsi but not
++ * using interrupt-map as this is not properly supported in
++ * xen right now
++ */
++/ {
++       smb@8000000 {
++               motherboard {
++                       arm,v2m-memory-map = "rs1";
++                       compatible = "arm,vexpress,v2m-p1", "simple-bus";
++                       #address-cells = <2>; /* SMB chipselect number and offset */
++                       #size-cells = <1>;
++                       ranges;
++
++                       flash@0,00000000 {
++                               compatible = "arm,vexpress-flash", "cfi-flash";
++                               reg = <0 0x00000000 0x04000000>,
++                                     <4 0x00000000 0x04000000>;
++                               bank-width = <4>;
++                       };
++
++                       v2m_video_ram: vram@2,00000000 {
++                               compatible = "arm,vexpress-vram";
++                               reg = <2 0x00000000 0x00800000>;
++                       };
++
++                       ethernet@2,02000000 {
++                               compatible = "smsc,lan91c111";
++                               reg = <2 0x02000000 0x10000>;
++                               interrupts = <0 15 4>;
++                       };
++
++                       v2m_clk24mhz: clk24mhz {
++                               compatible = "fixed-clock";
++                               #clock-cells = <0>;
++                               clock-frequency = <24000000>;
++                               clock-output-names = "v2m:clk24mhz";
++                       };
++
++                       v2m_refclk1mhz: refclk1mhz {
++                               compatible = "fixed-clock";
++                               #clock-cells = <0>;
++                               clock-frequency = <1000000>;
++                               clock-output-names = "v2m:refclk1mhz";
++                       };
++
++                       v2m_refclk32khz: refclk32khz {
++                               compatible = "fixed-clock";
++                               #clock-cells = <0>;
++                               clock-frequency = <32768>;
++                               clock-output-names = "v2m:refclk32khz";
++                       };
++
++                       iofpga@3,00000000 {
++                               compatible = "simple-bus";
++                               #address-cells = <1>;
++                               #size-cells = <1>;
++                               ranges = <0 3 0 0x200000>;
++
++                               v2m_sysreg: sysreg@10000 {
++                                       compatible = "arm,vexpress-sysreg";
++                                       reg = <0x010000 0x1000>;
++                                       gpio-controller;
++                                       #gpio-cells = <2>;
++                               };
++
++                               v2m_sysctl: sysctl@20000 {
++                                       compatible = "arm,sp810", "arm,primecell";
++                                       reg = <0x020000 0x1000>;
++                                       clocks = <&v2m_refclk32khz>, <&v2m_refclk1mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "refclk", "timclk", "apb_pclk";
++                                       #clock-cells = <1>;
++                                       clock-output-names = "timerclken0", "timerclken1", "timerclken2", "timerclken3";
++                                       assigned-clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_sysctl 3>, <&v2m_sysctl 3>;
++                                       assigned-clock-parents = <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>, <&v2m_refclk1mhz>;
++                               };
++
++                               aaci@40000 {
++                                       compatible = "arm,pl041", "arm,primecell";
++                                       reg = <0x040000 0x1000>;
++                                       interrupts = <0 11 4>;
++                                       clocks = <&v2m_clk24mhz>;
++                                       clock-names = "apb_pclk";
++                               };
++
++                               mmci@50000 {
++                                       compatible = "arm,pl180", "arm,primecell";
++                                       reg = <0x050000 0x1000>;
++                                       interrupts = <0 9 4 0 10 4>;
++                                       cd-gpios = <&v2m_sysreg 0 0>;
++                                       wp-gpios = <&v2m_sysreg 1 0>;
++                                       max-frequency = <12000000>;
++                                       vmmc-supply = <&v2m_fixed_3v3>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "mclk", "apb_pclk";
++                               };
++
++                               kmi@60000 {
++                                       compatible = "arm,pl050", "arm,primecell";
++                                       reg = <0x060000 0x1000>;
++                                       interrupts = <0 12 4>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "KMIREFCLK", "apb_pclk";
++                               };
++
++                               kmi@70000 {
++                                       compatible = "arm,pl050", "arm,primecell";
++                                       reg = <0x070000 0x1000>;
++                                       interrupts = <0 13 4>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "KMIREFCLK", "apb_pclk";
++                               };
++
++                               v2m_serial0: uart@90000 {
++                                       compatible = "arm,pl011", "arm,primecell";
++                                       reg = <0x090000 0x1000>;
++                                       interrupts = <0 5 4>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "uartclk", "apb_pclk";
++                               };
++
++                               v2m_serial1: uart@a0000 {
++                                       compatible = "arm,pl011", "arm,primecell";
++                                       reg = <0x0a0000 0x1000>;
++                                       interrupts = <0 6 4>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "uartclk", "apb_pclk";
++                               };
++
++                               v2m_serial2: uart@b0000 {
++                                       compatible = "arm,pl011", "arm,primecell";
++                                       reg = <0x0b0000 0x1000>;
++                                       interrupts = <0 7 4>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "uartclk", "apb_pclk";
++                               };
++
++                               v2m_serial3: uart@c0000 {
++                                       compatible = "arm,pl011", "arm,primecell";
++                                       reg = <0x0c0000 0x1000>;
++                                       interrupts = <0 8 4>;
++                                       clocks = <&v2m_clk24mhz>, <&v2m_clk24mhz>;
++                                       clock-names = "uartclk", "apb_pclk";
++                               };
++
++                               wdt@f0000 {
++                                       compatible = "arm,sp805", "arm,primecell";
++                                       reg = <0x0f0000 0x1000>;
++                                       interrupts = <0 0 4>;
++                                       clocks = <&v2m_refclk32khz>, <&v2m_clk24mhz>;
++                                       clock-names = "wdogclk", "apb_pclk";
++                               };
++
++                               v2m_timer01: timer@110000 {
++                                       compatible = "arm,sp804", "arm,primecell";
++                                       reg = <0x110000 0x1000>;
++                                       interrupts = <0 2 4>;
++                                       clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&v2m_clk24mhz>;
++                                       clock-names = "timclken1", "timclken2", "apb_pclk";
++                               };
++
++                               v2m_timer23: timer@120000 {
++                                       compatible = "arm,sp804", "arm,primecell";
++                                       reg = <0x120000 0x1000>;
++                                       interrupts = <0 3 4>;
++                                       clocks = <&v2m_sysctl 2>, <&v2m_sysctl 3>, <&v2m_clk24mhz>;
++                                       clock-names = "timclken1", "timclken2", "apb_pclk";
++                               };
++
++                               rtc@170000 {
++                                       compatible = "arm,pl031", "arm,primecell";
++                                       reg = <0x170000 0x1000>;
++                                       interrupts = <0 4 4>;
++                                       clocks = <&v2m_clk24mhz>;
++                                       clock-names = "apb_pclk";
++                               };
++
++                               clcd@1f0000 {
++                                       compatible = "arm,pl111", "arm,primecell";
++                                       reg = <0x1f0000 0x1000>;
++                                       interrupt-names = "combined";
++                                       interrupts = <0 14 4>;
++                                       clocks = <&v2m_oscclk1>, <&v2m_clk24mhz>;
++                                       clock-names = "clcdclk", "apb_pclk";
++                                       arm,pl11x,framebuffer = <0x18000000 0x00180000>;
++                                       memory-region = <&v2m_video_ram>;
++                                       max-memory-bandwidth = <130000000>; /* 16bpp @ 63.5MHz */
++
++                                       port {
++                                               v2m_clcd_pads: endpoint {
++                                                       remote-endpoint = <&v2m_clcd_panel>;
++                                                       arm,pl11x,tft-r0g0b0-pads = <0 8 16>;
++                                               };
++                                       };
++
++                                       panel {
++                                               compatible = "panel-dpi";
++
++                                               port {
++                                                       v2m_clcd_panel: endpoint {
++                                                               remote-endpoint = <&v2m_clcd_pads>;
++                                                       };
++                                               };
++
++                                               panel-timing {
++                                                       clock-frequency = <63500127>;
++                                                       hactive = <1024>;
++                                                       hback-porch = <152>;
++                                                       hfront-porch = <48>;
++                                                       hsync-len = <104>;
++                                                       vactive = <768>;
++                                                       vback-porch = <23>;
++                                                       vfront-porch = <3>;
++                                                       vsync-len = <4>;
++                                               };
++                                       };
++                               };
++
++                               virtio-block@130000 {
++                                       compatible = "virtio,mmio";
++                                       reg = <0x130000 0x200>;
++                                       interrupts = <0 42 4>;
++                               };
++                       };
++
++                       v2m_fixed_3v3: v2m-3v3 {
++                               compatible = "regulator-fixed";
++                               regulator-name = "3V3";
++                               regulator-min-microvolt = <3300000>;
++                               regulator-max-microvolt = <3300000>;
++                               regulator-always-on;
++                       };
++
++                       mcc {
++                               compatible = "arm,vexpress,config-bus";
++                               arm,vexpress,config-bridge = <&v2m_sysreg>;
++
++                               v2m_oscclk1: oscclk1 {
++                                       /* CLCD clock */
++                                       compatible = "arm,vexpress-osc";
++                                       arm,vexpress-sysreg,func = <1 1>;
++                                       freq-range = <23750000 63500000>;
++                                       #clock-cells = <0>;
++                                       clock-output-names = "v2m:oscclk1";
++                               };
++
++                               reset {
++                                       compatible = "arm,vexpress-reset";
++                                       arm,vexpress-sysreg,func = <5 0>;
++                               };
++
++                               muxfpga {
++                                       compatible = "arm,vexpress-muxfpga";
++                                       arm,vexpress-sysreg,func = <7 0>;
++                               };
++
++                               shutdown {
++                                       compatible = "arm,vexpress-shutdown";
++                                       arm,vexpress-sysreg,func = <8 0>;
++                               };
++
++                               reboot {
++                                       compatible = "arm,vexpress-reboot";
++                                       arm,vexpress-sysreg,func = <9 0>;
++                               };
++
++                               dvimode {
++                                       compatible = "arm,vexpress-dvimode";
++                                       arm,vexpress-sysreg,func = <11 0>;
++                               };
++                       };
++               };
++       };
++};
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index afb597d..4e5635a 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -11,6 +11,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}:${THISDIR}/files:"
 SRC_URI_KMETA = "file://arm-platforms-kmeta;type=kmeta;name=arm-platforms-kmeta;destsuffix=arm-platforms-kmeta"
 SRC_URI_append_foundation-armv8 = " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base = " ${SRC_URI_KMETA}"
+SRC_URI_append_fvp-base-arm32 = " ${SRC_URI_KMETA}"
 SRC_URI_append_juno = " ${SRC_URI_KMETA}"
 SRC_URI_append_gem5-arm64 = " ${SRC_URI_KMETA}"
 SRCREV_arm-platforms-kmeta = "6147e82375aa9df8f2a162d42ea6406c79c854c5"
@@ -34,6 +35,13 @@ COMPATIBLE_MACHINE_fvp-base = "fvp-base"
 KMACHINE_fvp-base = "fvp"
 SRC_URI_append_fvp-base = " file://fvp-base-dts.patch"
 
+#
+# FVP BASE ARM32 KMACHINE
+#
+COMPATIBLE_MACHINE_fvp-base-arm32 = "fvp-base-arm32"
+KMACHINE_fvp-base-arm32 = "fvp-arm32"
+SRC_URI_append_fvp-base-arm32 = " file://fvp-base-arm32-dts.patch"
+
 #
 # Juno KMACHINE
 #
-- 
2.17.1

