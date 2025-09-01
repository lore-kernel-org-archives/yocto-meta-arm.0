Return-Path: <clement.faure@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7E1CA0FFF
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 16:46:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.56759.1756745166104522788
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Sep 2025 09:46:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: clement.faure@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22B2416A3;
	Mon,  1 Sep 2025 09:45:57 -0700 (PDT)
Received: from MGC575JXM4.arm.com (unknown [10.57.57.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AABA13F694;
	Mon,  1 Sep 2025 09:46:04 -0700 (PDT)
From: Clement Faure <clement.faure@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Clement Faure <clement.faure@arm.com>
Subject: [PATCH] arm-bsp/u-boot: corstone1000: enable OF_UPSTREAM device tree support
Date: Mon,  1 Sep 2025 18:45:57 +0200
Message-Id: <20250901164557.71670-1-clement.faure@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Sep 2025 16:46:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6686

Enable OF_UPSTREAM support for the corstone1000 platforms in U-Boot.

This patchset enables OF_UPSTREAM device tree support in U-Boot for the
corstone1000 platforms. This allows U-Boot to build using upstream
Linux kernel device tree sources instead of downstream copies.

The following changes are introduced:
- Enable OF_UPSTREAM to support upstream device tree.
- Update DEVICE_TREE naming with "arm/" prefix.
- Add device tree overlay to retain U-Boot specific device tree
nodes.
- Remove legacy device trees for corstone1000.

Signed-off-by: Clement Faure <clement.faure@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |   9 +-
 ...able-OF_UPSTREAM-device-tree-support.patch | 525 ++++++++++++++++++
 2 files changed, 532 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
038-corstone1000-enable-OF_UPSTREAM-device-tree-support.patch

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index fa98dc10..0ee616ee 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -1,8 +1,8 @@
 # Corstone1000 specific U-boot support
=20
 DEPENDS:append =3D " openssl-native efitools-native"
-CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "corstone1000-mps3"
-CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "corstone1000-fvp"
+CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "arm/corstone1000-mps3"
+CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "arm/corstone1000-fvp"
 EXTRA_OEMAKE:append =3D ' DEVICE_TREE=3D${CORSTONE1000_DEVICE_TREE}'
=20
 UBOOT_CONFIG ??=3D "EFI"
@@ -64,6 +64,11 @@ SRC_URI:append =3D " \
                          '', 'file://0037-corstone1000-purge-remoteproc-=
DTS-node.patch' , d)} \
     "
=20
+# Add OF_UPSTREAM support
+SRC_URI:append =3D " \
+    file://0038-corstone1000-enable-OF_UPSTREAM-device-tree-support.patc=
h \
+"
+
 do_configure:append() {
    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out ${B}/corstone1000_defconfig/CRT.crt -nodes -days 365
 }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-enable-OF_UPSTREAM-device-tree-support.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-enable-OF_UPSTREAM-=
device-tree-support.patch
new file mode 100644
index 00000000..426f3d9d
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
@@ -0,0 +1,525 @@
+From 59fb1656586228bb2e2fdaf1de65b1f7aabc508e Mon Sep 17 00:00:00 2001
+From: Clement Faure <clement.faure@arm.com>
+Date: Wed, 11 Jun 2025 08:38:21 +0000
+Subject: [PATCH] corstone1000: enable OF_UPSTREAM device tree support
+
+Enable OF_UPSTREAM option set for corstone1000 platform. Remove
+legacy u-boot corstone1000 device trees.
+Add device tree files for FVP and MPS3 platforms to add device
+tree nodes that are missing from the upstream.
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Clement Faure <clement.faure@arm.com>
+---
+ arch/arm/dts/Makefile                      |   3 -
+ arch/arm/dts/corstone1000-fvp-u-boot.dtsi  |  42 +++++
+ arch/arm/dts/corstone1000-fvp.dts          |  82 ---------
+ arch/arm/dts/corstone1000-mps3-u-boot.dtsi |   8 +
+ arch/arm/dts/corstone1000-mps3.dts         |  32 ----
+ arch/arm/dts/corstone1000-u-boot.dtsi      |  39 +++++
+ arch/arm/dts/corstone1000.dtsi             | 194 ---------------------
+ board/armltd/corstone1000/corstone1000.c   |   4 +-
+ configs/corstone1000_defconfig             |   5 +-
+ 9 files changed, 95 insertions(+), 314 deletions(-)
+ create mode 100644 arch/arm/dts/corstone1000-fvp-u-boot.dtsi
+ delete mode 100644 arch/arm/dts/corstone1000-fvp.dts
+ create mode 100644 arch/arm/dts/corstone1000-mps3-u-boot.dtsi
+ delete mode 100644 arch/arm/dts/corstone1000-mps3.dts
+ create mode 100644 arch/arm/dts/corstone1000-u-boot.dtsi
+ delete mode 100644 arch/arm/dts/corstone1000.dtsi
+
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 267b0179a5f..a595983f1d0 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -1221,9 +1221,6 @@ dtb-$(CONFIG_TARGET_EA_LPC3250DEVKITV2) +=3D lpc32=
50-ea3250.dtb
+=20
+ dtb-$(CONFIG_ARCH_QEMU) +=3D qemu-arm.dtb qemu-arm64.dtb
+=20
+-dtb-$(CONFIG_TARGET_CORSTONE1000) +=3D corstone1000-mps3.dtb \
+-				corstone1000-fvp.dtb
+-
+ dtb-$(CONFIG_TARGET_COREPRIMEVELTE) +=3D pxa1908-samsung-coreprimevelte=
.dtb
+=20
+ include $(srctree)/scripts/Makefile.dts
+diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
+new file mode 100644
+index 00000000000..6b89d653417
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
+@@ -0,0 +1,42 @@
++// SPDX-License-Identifier: GPL-2.0 or MIT
++/*
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ */
++
++#include "corstone1000-u-boot.dtsi"
++
++/ {
++	virtio: virtio-net@40400000 {
++		compatible =3D "virtio,mmio";
++		reg =3D <0x40400000 0x10000>;
++		interrupts =3D <145>;
++	};
++};
++
++&{/cpus} {
++	cpu1: cpu@1 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35";
++		reg =3D <0x1>;
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++
++	cpu2: cpu@2 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35";
++		reg =3D <0x2>;
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++
++	cpu3: cpu@3 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35";
++		reg =3D <0x3>;
++		enable-method =3D "psci";
++		next-level-cache =3D <&L2_0>;
++	};
++};
++
+diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
+deleted file mode 100644
+index cd8a132271e..00000000000
+--- a/arch/arm/dts/corstone1000-fvp.dts
++++ /dev/null
+@@ -1,82 +0,0 @@
+-// SPDX-License-Identifier: GPL-2.0 or MIT
+-/*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
+- * Copyright (c) 2022, Linaro Limited. All rights reserved.
+- *
+- */
+-
+-/dts-v1/;
+-
+-#include "corstone1000.dtsi"
+-
+-/ {
+-	model =3D "ARM Corstone1000 FVP (Fixed Virtual Platform)";
+-	compatible =3D "arm,corstone1000-fvp";
+-
+-	smsc: ethernet@4010000 {
+-		compatible =3D "smsc,lan91c111";
+-		reg =3D <0x40100000 0x10000>;
+-		phy-mode =3D "mii";
+-		interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+-		reg-io-width =3D <2>;
+-	};
+-
+-	virtio: virtio-net@40400000 {
+-		compatible =3D "virtio,mmio";
+-		reg =3D <0x40400000 0x10000>;
+-		interrupts =3D <145>;
+-	};
+-
+-	vmmc_v3_3d: fixed_v3_3d {
+-		compatible =3D "regulator-fixed";
+-		regulator-name =3D "vmmc_supply";
+-		regulator-min-microvolt =3D <3300000>;
+-		regulator-max-microvolt =3D <3300000>;
+-		regulator-always-on;
+-	};
+-
+-	sdmmc0: mmc@40300000 {
+-		compatible =3D "arm,pl18x", "arm,primecell";
+-		reg =3D <0x40300000 0x1000>;
+-		interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+-		max-frequency =3D <12000000>;
+-		vmmc-supply =3D <&vmmc_v3_3d>;
+-		clocks =3D <&smbclk>, <&refclk100mhz>;
+-		clock-names =3D "smclk", "apb_pclk";
+-	};
+-
+-	sdmmc1: mmc@50000000 {
+-		compatible =3D "arm,pl18x", "arm,primecell";
+-		reg =3D <0x50000000 0x10000>;
+-		interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+-		max-frequency =3D <12000000>;
+-		vmmc-supply =3D <&vmmc_v3_3d>;
+-		clocks =3D <&smbclk>, <&refclk100mhz>;
+-		clock-names =3D "smclk", "apb_pclk";
+-	};
+-};
+-
+-&cpus {
+-	cpu1: cpu@1 {
+-		device_type =3D "cpu";
+-		compatible =3D "arm,cortex-a35";
+-		reg =3D <0x1>;
+-		enable-method =3D "psci";
+-		next-level-cache =3D <&L2_0>;
+-	};
+-	cpu2: cpu@2 {
+-		device_type =3D "cpu";
+-		compatible =3D "arm,cortex-a35";
+-		reg =3D <0x2>;
+-		enable-method =3D "psci";
+-		next-level-cache =3D <&L2_0>;
+-	};
+-	cpu3: cpu@3 {
+-		device_type =3D "cpu";
+-		compatible =3D "arm,cortex-a35";
+-		reg =3D <0x3>;
+-		enable-method =3D "psci";
+-		next-level-cache =3D <&L2_0>;
+-	};
+-};
+-
+diff --git a/arch/arm/dts/corstone1000-mps3-u-boot.dtsi b/arch/arm/dts/c=
orstone1000-mps3-u-boot.dtsi
+new file mode 100644
+index 00000000000..9ab744d8d20
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-mps3-u-boot.dtsi
+@@ -0,0 +1,8 @@
++// SPDX-License-Identifier: GPL-2.0 or MIT
++/*
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ */
++
++#include "corstone1000-u-boot.dtsi"
++
+diff --git a/arch/arm/dts/corstone1000-mps3.dts b/arch/arm/dts/corstone1=
000-mps3.dts
+deleted file mode 100644
+index e3146747c2d..00000000000
+--- a/arch/arm/dts/corstone1000-mps3.dts
++++ /dev/null
+@@ -1,32 +0,0 @@
+-// SPDX-License-Identifier: GPL-2.0 or MIT
+-/*
+- * Copyright (c) 2022, Arm Limited. All rights reserved.
+- * Copyright (c) 2022, Linaro Limited. All rights reserved.
+- *
+- */
+-
+-/dts-v1/;
+-
+-#include "corstone1000.dtsi"
+-
+-/ {
+-	model =3D "ARM Corstone1000 FPGA MPS3 board";
+-	compatible =3D "arm,corstone1000-mps3";
+-
+-	smsc: ethernet@4010000 {
+-		compatible =3D "smsc,lan9220", "smsc,lan9115";
+-		reg =3D <0x40100000 0x10000>;
+-		phy-mode =3D "mii";
+-		interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+-		reg-io-width =3D <2>;
+-		smsc,irq-push-pull;
+-	};
+-
+-	usb_host: usb@40200000 {
+-		compatible =3D "nxp,usb-isp1763";
+-		reg =3D <0x40200000 0x100000>;
+-		interrupts =3D <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+-		bus-width =3D <16>;
+-		dr_mode =3D "host";
+-	};
+-};
+diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
+new file mode 100644
+index 00000000000..95dd277d4cc
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-u-boot.dtsi
+@@ -0,0 +1,39 @@
++// SPDX-License-Identifier: GPL-2.0 or MIT
++/*
++ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ */
++
++/ {
++	nvmxip: nvmxip-qspi@08000000 {
++		compatible =3D "nvmxip,qspi";
++		reg =3D <0x08000000 0x2000000>;
++		lba_shift =3D <9>;
++		lba =3D <65536>;
++	};
++
++	fwu-mdata {
++		compatible =3D "u-boot,fwu-mdata-gpt";
++		fwu-mdata-store =3D <&nvmxip>;
++	};
++
++	reserved-memory {
++		#address-cells =3D <2>;
++		#size-cells =3D <2>;
++		ranges;
++
++		smem_mem: smem_region@88000000 {
++			reg =3D <0x0 0x88000000 0x0 0x100000>;
++			no-map;
++		};
++	};
++};
++
++&{/soc} {
++	extsys0: remoteproc@1a010310 {
++		compatible =3D "arm,corstone1000-extsys";
++		reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
++		reg-names =3D "reset-control", "reset-status";
++		firmware-name =3D "es_flashfw.elf";
++	};
++};
+diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
+deleted file mode 100644
+index 74e95dcbc6b..00000000000
+--- a/arch/arm/dts/corstone1000.dtsi
++++ /dev/null
+@@ -1,194 +0,0 @@
+-// SPDX-License-Identifier: GPL-2.0 or MIT
+-/*
+- * Copyright 2022-2023 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
+- * Copyright (c) 2022, Linaro Limited. All rights reserved.
+- *
+- */
+-
+-#include <dt-bindings/interrupt-controller/arm-gic.h>
+-
+-/ {
+-	interrupt-parent =3D <&gic>;
+-	#address-cells =3D <1>;
+-	#size-cells =3D <1>;
+-
+-	aliases {
+-		serial0 =3D &uart0;
+-		serial1 =3D &uart1;
+-	};
+-
+-	chosen {
+-		stdout-path =3D "serial0:115200n8";
+-	};
+-
+-	cpus: cpus {
+-		#address-cells =3D <1>;
+-		#size-cells =3D <0>;
+-
+-		cpu: cpu@0 {
+-			device_type =3D "cpu";
+-			compatible =3D "arm,cortex-a35";
+-			reg =3D <0>;
+-			next-level-cache =3D <&L2_0>;
+-		};
+-	};
+-
+-	memory@88200000 {
+-		device_type =3D "memory";
+-		reg =3D <0x88200000 0x77e00000>;
+-	};
+-
+-	nvmxip: nvmxip-qspi@08000000 {
+-		compatible =3D "nvmxip,qspi";
+-		reg =3D <0x08000000 0x2000000>;
+-		lba_shift =3D <9>;
+-		lba =3D <65536>;
+-	};
+-
+-	reserved-memory {
+-		#address-cells =3D <2>;
+-		#size-cells =3D <2>;
+-		ranges;
+-
+-		smem_mem: smem_region@88000000 {
+-			reg =3D <0x0 0x88000000 0x0 0x100000>;
+-			no-map;
+-		};
+-	};
+-
+-	gic: interrupt-controller@1c000000 {
+-		compatible =3D "arm,gic-400";
+-		#interrupt-cells =3D <3>;
+-		#address-cells =3D <0>;
+-		interrupt-controller;
+-		reg =3D	<0x1c010000 0x1000>,
+-			<0x1c02f000 0x2000>,
+-			<0x1c04f000 0x1000>,
+-			<0x1c06f000 0x2000>;
+-		interrupts =3D <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) |
+-			      IRQ_TYPE_LEVEL_LOW)>;
+-	};
+-
+-	L2_0: l2-cache0 {
+-		compatible =3D "cache";
+-		cache-level =3D <2>;
+-		cache-size =3D <0x80000>;
+-		cache-line-size =3D <64>;
+-		cache-sets =3D <1024>;
+-	};
+-
+-	refclk100mhz: refclk100mhz {
+-		compatible =3D "fixed-clock";
+-		#clock-cells =3D <0>;
+-		clock-frequency =3D <100000000>;
+-		clock-output-names =3D "apb_pclk";
+-	};
+-
+-	smbclk: refclk24mhzx2 {
+-		/* Reference 24MHz clock x 2 */
+-		compatible =3D "fixed-clock";
+-		#clock-cells =3D <0>;
+-		clock-frequency =3D <48000000>;
+-		clock-output-names =3D "smclk";
+-	};
+-
+-	timer {
+-		compatible =3D "arm,armv8-timer";
+-		interrupts =3D	<GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) |
+-				 IRQ_TYPE_LEVEL_LOW)>,
+-				<GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) |
+-				 IRQ_TYPE_LEVEL_LOW)>,
+-				<GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) |
+-				 IRQ_TYPE_LEVEL_LOW)>,
+-				<GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) |
+-				 IRQ_TYPE_LEVEL_LOW)>;
+-	};
+-
+-	uartclk: uartclk {
+-		/* UART clock - 50MHz */
+-		compatible =3D "fixed-clock";
+-		#clock-cells =3D <0>;
+-		clock-frequency =3D <50000000>;
+-		clock-output-names =3D "uartclk";
+-	};
+-
+-	psci {
+-		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
+-		method =3D "smc";
+-	};
+-
+-	fwu-mdata {
+-		compatible =3D "u-boot,fwu-mdata-gpt";
+-		fwu-mdata-store =3D <&nvmxip>;
+-	};
+-
+-	soc {
+-		compatible =3D "simple-bus";
+-		#address-cells =3D <1>;
+-		#size-cells =3D <1>;
+-		interrupt-parent =3D <&gic>;
+-		ranges;
+-
+-		extsys0: remoteproc@1a010310 {
+-			compatible =3D "arm,corstone1000-extsys";
+-			reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
+-			reg-names =3D "reset-control", "reset-status";
+-			firmware-name =3D "es_flashfw.elf";
+-		};
+-
+-		timer@1a220000 {
+-			compatible =3D "arm,armv7-timer-mem";
+-			reg =3D <0x1a220000 0x1000>;
+-			#address-cells =3D <1>;
+-			#size-cells =3D <1>;
+-			clock-frequency =3D <50000000>;
+-			ranges;
+-
+-			frame@1a230000 {
+-				frame-number =3D <0>;
+-				interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+-				reg =3D <0x1a230000 0x1000>;
+-			};
+-		};
+-
+-		uart0: serial@1a510000 {
+-			compatible =3D "arm,pl011", "arm,primecell";
+-			reg =3D <0x1a510000 0x1000>;
+-			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
+-			clocks =3D <&uartclk>, <&refclk100mhz>;
+-			clock-names =3D "uartclk", "apb_pclk";
+-		};
+-
+-		uart1: serial@1a520000 {
+-			compatible =3D "arm,pl011", "arm,primecell";
+-			reg =3D <0x1a520000 0x1000>;
+-			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
+-			clocks =3D <&uartclk>, <&refclk100mhz>;
+-			clock-names =3D "uartclk", "apb_pclk";
+-		};
+-
+-		mhu_hse1: mailbox@1b820000 {
+-			compatible =3D "arm,mhuv2-tx", "arm,primecell";
+-			reg =3D <0x1b820000 0x1000>;
+-			clocks =3D <&refclk100mhz>;
+-			clock-names =3D "apb_pclk";
+-			interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+-			#mbox-cells =3D <2>;
+-			arm,mhuv2-protocols =3D <0 0>;
+-			secure-status =3D "okay";     /* secure-world-only */
+-			status =3D "disabled";
+-		};
+-
+-		mhu_seh1: mailbox@1b830000 {
+-			compatible =3D "arm,mhuv2-rx", "arm,primecell";
+-			reg =3D <0x1b830000 0x1000>;
+-			clocks =3D <&refclk100mhz>;
+-			clock-names =3D "apb_pclk";
+-			interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+-			#mbox-cells =3D <2>;
+-			arm,mhuv2-protocols =3D <0 0>;
+-			secure-status =3D "okay";     /* secure-world-only */
+-			status =3D "disabled";
+-		};
+-	};
+-};
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index 1b9c3a9ed16..db8919298e1 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -264,7 +264,7 @@ struct mm_region *mem_map =3D corstone1000_mem_map;
+ int board_init(void)
+ {
+ #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
+-	if (!strcmp(DEVICE_TREE, "corstone1000-fvp"))
++	if (!strcmp(DEVICE_TREE, "arm/corstone1000-fvp"))
+ 		update_info.images =3D fw_fvp_images;
+ 	else
+ 		update_info.images =3D fw_mps3_images;
+@@ -396,7 +396,7 @@ int board_late_init(void)
+ 	const char *cmp_dtb =3D DEVICE_TREE;
+ 	int ret;
+=20
+-	if (!strcmp(cmp_dtb, "corstone1000-fvp")) {
++	if (!strcmp(cmp_dtb, "arm/corstone1000-fvp")) {
+ 		ret =3D uclass_first_device_err(UCLASS_VIRTIO, &virtio_bus);
+ 		if (!virtio_bus) {
+ 			log_err("Cannot find virtio device, err (%d)\n", ret);
+diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
+index d1401550660..34c0c7cb172 100644
+--- a/configs/corstone1000_defconfig
++++ b/configs/corstone1000_defconfig
+@@ -7,7 +7,7 @@ CONFIG_NR_DRAM_BANKS=3D1
+ CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
+ CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
+ CONFIG_DM_GPIO=3Dy
+-CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-mps3"
++CONFIG_DEFAULT_DEVICE_TREE=3D"arm/corstone1000-mps3"
+ CONFIG_SYS_BOOTM_LEN=3D0x800000
+ CONFIG_SYS_LOAD_ADDR=3D0x82100000
+ CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
+@@ -55,6 +55,9 @@ CONFIG_CMD_RTC=3Dy
+ CONFIG_CMD_TIME=3Dy
+ CONFIG_CMD_GETTIME=3Dy
+ CONFIG_OF_CONTROL=3Dy
++CONFIG_OF_UPSTREAM=3Dy
++CONFIG_OF_UPSTREAM_BUILD_VENDOR=3Dy
++CONFIG_OF_UPSTREAM_VENDOR=3D"arm"
+ CONFIG_VERSION_VARIABLE=3Dy
+ CONFIG_NET_RANDOM_ETHADDR=3Dy
+ CONFIG_REGMAP=3Dy
+--=20
+2.43.0
+
--=20
2.43.0


