Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D71FC97E2
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48394.1774868086892437192
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=Ou0D6+kT;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D05F1E8D;
	Mon, 30 Mar 2026 03:54:40 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F7C3F915;
	Mon, 30 Mar 2026 03:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868086; bh=dZ43gO/FUm9b6HGZyqPteo1xuzjGmQAGxEis1YDm1To=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ou0D6+kTYlBAyGVrrfboJ2RgwT7nmUgNkims4kHgsmpeNuq9MoEOsLTjRnsuqeu6B
	 B3+2rRaXDyyLMfjHR9PQizfXdmAQaUeGF9wTphbOsma6WtOPsUp2t8BjLdX0WG9pZN
	 pxd6LRkvHg7Y0ez1KdPQBgcAAjCIDo5Do5/GmI1k=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 2/7] arm-bsp/u-boot:cs1k: Split Cortex-a320 device tree
Date: Mon, 30 Mar 2026 11:43:12 +0100
Message-ID: <20260330105428.2580463-3-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330105428.2580463-1-michael.safwat@arm.com>
References: <20260330105428.2580463-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6983

From: Frazer Carsley <frazer.carsley@arm.com>

The U-Boot maintainers rejected the previous patch [1] for two primary
reasons:

1. The Cortex-A320 changes should be considered a separate platform
2. The NPU node bindings do not match those in the Linux kernel

The former is handled by this commit. The latter point has not been
resolved, hence marking the newly added patch as Inappropriate. This is
simply the first step in resolving the comments.

[1] https://lore.kernel.org/all/20251127154752.589691-1-frazer.carsley@ar=
m.com

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  12 +-
 ...e1000-Add-Cortex-A320-support-on-FVP.patch | 219 -------
 ...-a320-Add-Corstone1000-board-variant.patch | 594 ++++++++++++++++++
 .../u-boot/corstone1000/corstone1000-a320.cfg |   2 -
 4 files changed, 599 insertions(+), 228 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-Add-Cortex-A320-support-on-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-a320-Add-Corstone1000-board-variant.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/c=
orstone1000-a320.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index 4edd8f18..9660fbc6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -3,10 +3,13 @@
 DEPENDS:append =3D " openssl-native efitools-native"
 CORSTONE1000_DEVICE_TREE:corstone1000-mps3 =3D "arm/corstone1000-mps3"
 CORSTONE1000_DEVICE_TREE:corstone1000-fvp =3D "arm/corstone1000-fvp"
+CORSTONE1000_DEVICE_TREE:cortexa320 =3D "corstone1000-a320-fvp"
 EXTRA_OEMAKE:append =3D ' DEVICE_TREE=3D${CORSTONE1000_DEVICE_TREE}'
=20
+CORSTONE1000_DEFCONFIG =3D "corstone1000_defconfig"
+CORSTONE1000_DEFCONFIG:cortexa320 =3D "corstone1000-a320_defconfig"
 UBOOT_CONFIG ??=3D "EFI"
-UBOOT_CONFIG[EFI] =3D "corstone1000_defconfig"
+UBOOT_CONFIG[EFI] =3D "${CORSTONE1000_DEFCONFIG}"
 UBOOT_ENTRYPOINT  =3D "0x80000000"
 UBOOT_LOADADDRESS =3D "0x80000000"
 UBOOT_BOOTARGS =3D "${LINUX_KERNEL_ARGS} loglevel=3D9"
@@ -75,12 +78,7 @@ SRC_URI:append =3D " \
=20
 # Add Cortex-a320 support
 SRC_URI:append =3D " \
-    file://0039-corstone1000-Add-Cortex-A320-support-on-FVP.patch \
-"
-
-# Add Cortex-a320 specific configurations
-SRC_URI:append:cortexa320 =3D " \
-    file://corstone1000-a320.cfg \
+    file://0039-corstone1000-a320-Add-Corstone1000-board-variant.patch \
 "
=20
 uboot_configure_config:append() {
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0039-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
deleted file mode 100644
index be0367b3..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
+++ /dev/null
@@ -1,219 +0,0 @@
-From ef9306fde5247ccd8fecec5f886f52426c01af61 Mon Sep 17 00:00:00 2001
-From: Frazer Carsley <frazer.carsley@arm.com>
-Date: Wed, 25 Feb 2026 14:08:07 +0000
-Subject: [PATCH] corstone1000: Add Cortex-A320 support on FVP
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Enable Cortex-A320 support on the Corstone-1000 platform
-(including FVP) and update the device tree to support the integrated
-Ethos-U85 NPU and GIC-700 interrupt controller. These updates make
-the platform fully compatible with Cortex-A320 while retaining
-backward compatibility with Cortex-A35 and GIC-400.
-
-**Cortex-A320 enablement**
-
-* Extend Corstone-1000 compatibility list to include `cortex-a320`.
-* Ensure build and device-tree logic support both Cortex-A35 and
-  Cortex-A320 configurations.
-
-**Ethos-U85 integration**
-
-* Add `/ethosu@1a050000` node describing the NPU register block at
-  `0x1A050000`.
-* Introduce associated reserved memory regions:
-  * `ethosu_sram@02400000`: 2 MiB on-chip SRAM (`no-map`).
-  * `ethosu_reserved@A0000000`: 32 MiB DDR carve-out
-     (`shared-dma-pool`).
-* Connect memory regions through `memory-region` and `sram` phandles.
-* Add `dma-ranges`, interrupt spec, `region-cfgs`, `cs-region`, and
-  `ethosu-mem-config` for full driver support.
-* Enable the NPU node conditionally via `CONFIG_ETHOS_U85`.
-
-**GIC-700 support**
-
-* Introduce `CONFIG_GIC_700` to toggle between GIC-400 and
-  GIC-700.
-* Add full GICv3 node guarded by `#ifdef CONFIG_GIC_700`.
-* Adjust `cpu@1..3` `reg` values to `0x100/0x200/0x300` under
-  GIC-700 (keep `0x1/0x2/0x3` for GIC-400).
-* Update Ethos-U85 interrupt assignment to **SPI 16** to align with
-  the new interrupt map.
-
-These updates align the Corstone-1000 platform with Arm=E2=80=99s latest
-Cortex-A320 and Ethos-U85 configurations and ensure proper interrupt
-and memory mapping for both secure and non-secure domains.
-
-Upstream-Status: Submitted (https://lore.kernel.org/all/20251127154752.5=
89691-1-frazer.carsley@arm.com/)
-Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
-Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
----
- arch/arm/dts/corstone1000-fvp-u-boot.dtsi | 38 +++++++++++
- arch/arm/dts/corstone1000-u-boot.dtsi     | 79 +++++++++++++++++++++++
- arch/arm/include/asm/armv8/cpu.h          |  1 +
- board/armltd/corstone1000/Kconfig         |  8 +++
- 4 files changed, 126 insertions(+)
-
-diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
-index 5cb7762fc1c..7ad4ca9e070 100644
---- a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
-+++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
-@@ -7,3 +7,41 @@
- #include "corstone1000-u-boot.dtsi"
- #include "corstone1000-extsys-u-boot.dtsi"
- #include "corstone1000-virtio-u-boot.dtsi"
-+
-+&{/cpus} {
-+	cpu1: cpu@1 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+#ifdef CONFIG_GIC_700
-+		reg =3D <0x100>;
-+#else
-+		reg =3D <0x1>;
-+#endif
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+
-+	cpu2: cpu@2 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+#ifdef CONFIG_GIC_700
-+		reg =3D <0x200>;
-+#else
-+		reg =3D <0x2>;
-+#endif
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+
-+	cpu3: cpu@3 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+#ifdef CONFIG_GIC_700
-+		reg =3D <0x300>;
-+#else
-+		reg =3D <0x3>;
-+#endif
-+		enable-method =3D "psci";
-+		next-level-cache =3D <&L2_0>;
-+	};
-+};
-diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
-index 4ea6f1d9724..fef56d1ec66 100644
---- a/arch/arm/dts/corstone1000-u-boot.dtsi
-+++ b/arch/arm/dts/corstone1000-u-boot.dtsi
-@@ -28,3 +28,82 @@
- 		};
- 	};
- };
-+
-+&{/cpus} {
-+	cpu: cpu@0 {
-+		device_type =3D "cpu";
-+		compatible =3D "arm,cortex-a35","arm,cortex-a320";
-+		reg =3D <0>;
-+		next-level-cache =3D <&L2_0>;
-+	};
-+};
-+
-+#ifdef CONFIG_ETHOS_U85
-+&{/reserved-memory} {
-+	ethosu_sram: ethosu_sram@02400000 {
-+		reg =3D <0x02400000 0x200000>;
-+		no-map;
-+	};
-+
-+	ethosu_reserved: ethosu_reserved@A0000000 {
-+		compatible =3D "shared-dma-pool";
-+		reg =3D <0xA0000000 0x02000000>;
-+		no-map;
-+
-+	};
-+};
-+
-+/ {
-+	ethosu: ethosu@1A050000 {
-+		compatible =3D "arm,ethosu-direct";
-+		#address-cells =3D <1>;
-+		#size-cells =3D <1>;
-+
-+		// Base address and size of NPU registers
-+		reg =3D <0x1A050000 0x4000>;
-+
-+		memory-region =3D <&ethosu_reserved>;
-+		sram =3D <&ethosu_sram>;
-+
-+		// Address mappings to translate between bus addresses (NPU) and phys=
ical host CPU addresses
-+		dma-ranges =3D <0x02400000 0x02400000 0x200000>,
-+			     <0xA0000000 0xA0000000 0x02000000>;
-+
-+		interrupts =3D <0 16 4>;
-+		interrupt-names =3D "irq";
-+
-+		// Memory region configuration
-+		region-cfgs =3D <3 3 0 3 3 3 3 3>;
-+
-+		// Memory regions used for the command stream
-+		cs-region =3D <2>;
-+
-+		// Memory interface configuration for Ethos-U85
-+		ethosu_mem_config {
-+			compatible =3D "arm,ethosu-mem-config";
-+			// <beats outstanding_read outstanding_write>
-+			sram =3D <0 64 32>;
-+			ext  =3D <1 64 32>;
-+			// <mem_domain mem_type axi_port>
-+			configs =3D <0 0 0>,
-+			<0 0 0>,
-+			<0 0 1>,
-+			<0 0 1>;
-+		};
-+	};
-+};
-+#endif
-+
-+#ifdef CONFIG_GIC_700
-+gic: &{/interrupt-controller@1c000000} {
-+		compatible =3D "arm,gic-v3";
-+		#interrupt-cells =3D <3>;
-+		#address-cells =3D <1>;
-+		#size-cells =3D <1>;
-+		ranges;
-+		interrupt-controller;
-+		reg =3D <0x1c000000 0x00010000>,
-+		<0x1c040000 0x00100000>;
-+		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
-+	};
-+#endif
-diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
-index e906fdf1bf1..4ef2ff07f7a 100644
---- a/arch/arm/include/asm/armv8/cpu.h
-+++ b/arch/arm/include/asm/armv8/cpu.h
-@@ -11,6 +11,7 @@
- #define MIDR_PARTNUM_CORTEX_A73		0xD09
- #define MIDR_PARTNUM_CORTEX_A75		0xD0A
- #define MIDR_PARTNUM_CORTEX_A76		0xD0B
-+#define MIDR_PARTNUM_CORTEX_A320		0xD8F
- #define MIDR_PARTNUM_SHIFT		0x4
- #define MIDR_PARTNUM_MASK		(0xFFF << MIDR_PARTNUM_SHIFT)
-=20
-diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone10=
00/Kconfig
-index 709674d4cf7..eea5c9b8972 100644
---- a/board/armltd/corstone1000/Kconfig
-+++ b/board/armltd/corstone1000/Kconfig
-@@ -9,4 +9,12 @@ config SYS_VENDOR
- config SYS_CONFIG_NAME
- 	default "corstone1000"
-=20
-+config ETHOS_U85
-+	bool "Enable Arm Ethos-U85 NPU support"
-+	default n
-+
-+config GIC_700
-+	bool "Enable GIC-700 support"
-+	default n
-+
- endif
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-a320-Add-Corstone1000-board-variant.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-a320-Add-Corstone1000-=
board-variant.patch
new file mode 100644
index 00000000..d370021b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
@@ -0,0 +1,594 @@
+From 9f95097d9b2d9b1360b5c105161509ea9a5b198d Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Wed, 25 Feb 2026 14:28:08 +0000
+Subject: [PATCH] corstone1000-a320: Add Corstone1000 board variant
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Enable Cortex-A320 support on the Corstone-1000 platform
+(including FVP) and support for the integrated Ethos-U85 NPU and GIC-700
+interrupt controller by way of a new device-tree. These updates make the
+platform fully compatible with Cortex-A320 while retaining backward
+compatibility with Cortex-A35 and GIC-400.
+
+**Cortex-A320 enablement**
+
+* Extend Corstone-1000 compatibility list to include `cortex-a320`.
+* Add new device-tree to support Cortex-A320 configurations, retaining
+  existing board support code.
+
+**Ethos-U85 integration**
+
+* Add `/ethosu@1a050000` node describing the NPU register block at
+  `0x1A050000`.
+* Introduce associated reserved memory regions:
+  * `ethosu_sram@02400000`: 2 MiB on-chip SRAM (`no-map`).
+  * `ethosu_reserved@A0000000`: 32 MiB DDR carve-out
+     (`shared-dma-pool`).
+* Connect memory regions through `memory-region` and `sram` phandles.
+* Add `dma-ranges`, interrupt spec, `region-cfgs`, `cs-region`, and
+  `ethosu-mem-config` for full driver support.
+**GIC-700 support**
+
+* Add full GICv3 node.
+* Map `cpu@1..3` `reg` values to `0x100/0x200/0x300` under
+  GIC-700
+* Update Ethos-U85 interrupt assignment to **SPI 16** to align with
+  the new interrupt map.
+
+These updates align the Corstone-1000 platform with Arm=E2=80=99s latest
+Cortex-A320 and Ethos-U85 configurations and ensure proper interrupt
+and memory mapping for both secure and non-secure domains.
+
+Upstream-Status: Inappropriate [Unsupported ethosu device-tree nodes, de=
nied by maintainers (https://lore.kernel.org/all/20251127154752.589691-1-=
frazer.carsley@arm.com/)]
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ arch/arm/Kconfig                              |   1 +
+ arch/arm/dts/corstone1000-a320-fvp.dts        |  51 ++++
+ arch/arm/dts/corstone1000-a320.dtsi           | 237 ++++++++++++++++++
+ arch/arm/include/asm/armv8/cpu.h              |   3 +
+ board/armltd/corstone1000-a320/Kconfig        |  12 +
+ board/armltd/corstone1000-a320/MAINTAINERS    |   7 +
+ board/armltd/corstone1000/corstone1000.c      |   6 +-
+ configs/corstone1000-a320_defconfig           |  89 +++++++
+ .../arm/arm,corstone1000-a320.yml             |  31 +++
+ 9 files changed, 434 insertions(+), 3 deletions(-)
+ create mode 100644 arch/arm/dts/corstone1000-a320-fvp.dts
+ create mode 100644 arch/arm/dts/corstone1000-a320.dtsi
+ create mode 100644 board/armltd/corstone1000-a320/Kconfig
+ create mode 100644 board/armltd/corstone1000-a320/MAINTAINERS
+ create mode 100644 configs/corstone1000-a320_defconfig
+ create mode 100644 doc/device-tree-bindings/arm/arm,corstone1000-a320.y=
ml
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 625d2e995d2..aacc39fa60c 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -2405,6 +2405,7 @@ source "arch/arm/mach-npcm/Kconfig"
+=20
+ source "board/armltd/total_compute/Kconfig"
+ source "board/armltd/corstone1000/Kconfig"
++source "board/armltd/corstone1000-a320/Kconfig"
+ source "board/bosch/shc/Kconfig"
+ source "board/bosch/guardian/Kconfig"
+ source "board/Marvell/octeontx/Kconfig"
+diff --git a/arch/arm/dts/corstone1000-a320-fvp.dts b/arch/arm/dts/corst=
one1000-a320-fvp.dts
+new file mode 100644
+index 00000000000..c01c629e0ca
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-a320-fvp.dts
+@@ -0,0 +1,51 @@
++// SPDX-License-Identifier: GPL-2.0 OR MIT
++/*
++ * Copyright (c) 2026, Arm Limited. All rights reserved.
++ *
++ */
++
++/dts-v1/;
++
++#include "corstone1000-a320.dtsi"
++#include "corstone1000-virtio-u-boot.dtsi"
++
++/ {
++	model =3D "ARM Corstone1000-A320 FVP (Fixed Virtual Platform)";
++	compatible =3D "arm,corstone1000-a320-fvp";
++
++	smsc: ethernet@4010000 {
++		compatible =3D "smsc,lan91c111";
++		reg =3D <0x40100000 0x10000>;
++		phy-mode =3D "mii";
++		interrupts =3D <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
++		reg-io-width =3D <2>;
++	};
++
++	vmmc_v3_3d: regulator-vmmc {
++		compatible =3D "regulator-fixed";
++		regulator-name =3D "vmmc_supply";
++		regulator-min-microvolt =3D <3300000>;
++		regulator-max-microvolt =3D <3300000>;
++		regulator-always-on;
++	};
++
++	sdmmc0: mmc@40300000 {
++		compatible =3D "arm,pl18x", "arm,primecell";
++		reg =3D <0x40300000 0x1000>;
++		interrupts =3D <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
++		max-frequency =3D <12000000>;
++		vmmc-supply =3D <&vmmc_v3_3d>;
++		clocks =3D <&smbclk>, <&refclk100mhz>;
++		clock-names =3D "smclk", "apb_pclk";
++	};
++
++	sdmmc1: mmc@50000000 {
++		compatible =3D "arm,pl18x", "arm,primecell";
++		reg =3D <0x50000000 0x10000>;
++		interrupts =3D <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
++		max-frequency =3D <12000000>;
++		vmmc-supply =3D <&vmmc_v3_3d>;
++		clocks =3D <&smbclk>, <&refclk100mhz>;
++		clock-names =3D "smclk", "apb_pclk";
++	};
++};
+diff --git a/arch/arm/dts/corstone1000-a320.dtsi b/arch/arm/dts/corstone=
1000-a320.dtsi
+new file mode 100644
+index 00000000000..28424db77bb
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-a320.dtsi
+@@ -0,0 +1,237 @@
++// SPDX-License-Identifier: GPL-2.0 or MIT
++/*
++ * Copyright 2026, Arm Limited and/or its affiliates <open-source-offic=
e@arm.com>
++ *
++ */
++
++#include <dt-bindings/interrupt-controller/arm-gic.h>
++
++#include "corstone1000-u-boot.dtsi"
++
++/ {
++	interrupt-parent =3D <&gic>;
++	#address-cells =3D <1>;
++	#size-cells =3D <1>;
++
++	aliases {
++		serial0 =3D &uart0;
++		serial1 =3D &uart1;
++	};
++
++	chosen {
++		stdout-path =3D "serial0:115200n8";
++	};
++
++	cpus: cpus {
++		#address-cells =3D <1>;
++		#size-cells =3D <0>;
++
++		L2: l2-cache {
++			compatible =3D "cache";
++			cache-unified;
++			cache-level =3D <2>;
++			cache-size =3D <0x80000>;
++			cache-line-size =3D <64>;
++			cache-sets =3D <1024>;
++		};
++
++		cpu: cpu@0 {
++			device_type =3D "cpu";
++			compatible =3D "arm,cortex-a320";
++			reg =3D <0>;
++			enable-method =3D "psci";
++			next-level-cache =3D <&L2>;
++		};
++
++		cpu1: cpu@100 {
++			device_type =3D "cpu";
++			compatible =3D "arm,cortex-a320";
++			reg =3D <0x100>;
++			enable-method =3D "psci";
++			next-level-cache =3D <&L2>;
++		};
++
++		cpu2: cpu@200 {
++			device_type =3D "cpu";
++			compatible =3D "arm,cortex-a320";
++			reg =3D <0x200>;
++			enable-method =3D "psci";
++			next-level-cache =3D <&L2>;
++		};
++
++		cpu3: cpu@300 {
++			device_type =3D "cpu";
++			compatible =3D "arm,cortex-a320";
++			reg =3D <0x300>;
++			enable-method =3D "psci";
++			next-level-cache =3D <&L2>;
++		};
++	};
++
++	gic: interrupt-controller@1c000000 {
++		compatible =3D "arm,gic-v3";
++		#interrupt-cells =3D <3>;
++		#address-cells =3D <1>;
++		#size-cells =3D <1>;
++		ranges;
++		interrupt-controller;
++		reg =3D <0x1c000000 0x00010000>,
++		<0x1c040000 0x00100000>;
++		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
++	};
++
++	memory@88200000 {
++		device_type =3D "memory";
++		reg =3D <0x88200000 0x77e00000>;
++	};
++
++	refclk100mhz: clock-100000000 {
++		compatible =3D "fixed-clock";
++		#clock-cells =3D <0>;
++		clock-frequency =3D <100000000>;
++		clock-output-names =3D "apb_pclk";
++	};
++
++	smbclk: clock-48000000 {
++		/* Reference 24MHz clock x 2 */
++		compatible =3D "fixed-clock";
++		#clock-cells =3D <0>;
++		clock-frequency =3D <48000000>;
++		clock-output-names =3D "smclk";
++	};
++
++	timer {
++		compatible =3D "arm,armv8-timer";
++		interrupts =3D <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_L=
OW)>,
++			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
++			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>,
++			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_LOW)>;
++	};
++
++	uartclk: clock-50000000 {
++		/* UART clock - 50MHz */
++		compatible =3D "fixed-clock";
++		#clock-cells =3D <0>;
++		clock-frequency =3D <50000000>;
++		clock-output-names =3D "uartclk";
++	};
++
++	psci {
++		compatible =3D "arm,psci-1.0", "arm,psci-0.2";
++		method =3D "smc";
++	};
++
++	ethosu: ethosu@1A050000 {
++		compatible =3D "arm,ethosu-direct";
++		#address-cells =3D <1>;
++		#size-cells =3D <1>;
++
++		// Base address and size of NPU registers
++		reg =3D <0x1A050000 0x4000>;
++
++		memory-region =3D <&ethosu_reserved>;
++		sram =3D <&ethosu_sram>;
++
++		// Address mappings to translate between bus addresses (NPU) and phys=
ical host CPU addresses
++		dma-ranges =3D <0x02400000 0x02400000 0x200000>,
++			     <0xA0000000 0xA0000000 0x02000000>;
++
++		interrupts =3D <0 16 4>;
++		interrupt-names =3D "irq";
++
++		// Memory region configuration
++		region-cfgs =3D <3 3 0 3 3 3 3 3>;
++
++		// Memory regions used for the command stream
++		cs-region =3D <2>;
++
++		// Memory interface configuration for Ethos-U85
++		ethosu_mem_config {
++			compatible =3D "arm,ethosu-mem-config";
++			// <beats outstanding_read outstanding_write>
++			sram =3D <0 64 32>;
++			ext  =3D <1 64 32>;
++			// <mem_domain mem_type axi_port>
++			configs =3D <0 0 0>,
++			<0 0 0>,
++			<0 0 1>,
++			<0 0 1>;
++		};
++	};
++
++	soc {
++		compatible =3D "simple-bus";
++		#address-cells =3D <1>;
++		#size-cells =3D <1>;
++		interrupt-parent =3D <&gic>;
++		ranges;
++
++		timer@1a220000 {
++			compatible =3D "arm,armv7-timer-mem";
++			reg =3D <0x1a220000 0x1000>;
++			#address-cells =3D <1>;
++			#size-cells =3D <1>;
++			ranges;
++
++			frame@1a230000 {
++				frame-number =3D <0>;
++				interrupts =3D <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
++				reg =3D <0x1a230000 0x1000>;
++			};
++		};
++
++		uart0: serial@1a510000 {
++			compatible =3D "arm,pl011", "arm,primecell";
++			reg =3D <0x1a510000 0x1000>;
++			interrupts =3D <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
++			clocks =3D <&uartclk>, <&refclk100mhz>;
++			clock-names =3D "uartclk", "apb_pclk";
++		};
++
++		uart1: serial@1a520000 {
++			compatible =3D "arm,pl011", "arm,primecell";
++			reg =3D <0x1a520000 0x1000>;
++			interrupts =3D <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;
++			clocks =3D <&uartclk>, <&refclk100mhz>;
++			clock-names =3D "uartclk", "apb_pclk";
++		};
++
++		mhu_hse1: mailbox@1b820000 {
++			compatible =3D "arm,mhuv2-tx", "arm,primecell";
++			reg =3D <0x1b820000 0x1000>;
++			clocks =3D <&refclk100mhz>;
++			clock-names =3D "apb_pclk";
++			interrupts =3D <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
++			#mbox-cells =3D <2>;
++			arm,mhuv2-protocols =3D <0 0>;
++			secure-status =3D "okay";     /* secure-world-only */
++			status =3D "disabled";
++		};
++
++		mhu_seh1: mailbox@1b830000 {
++			compatible =3D "arm,mhuv2-rx", "arm,primecell";
++			reg =3D <0x1b830000 0x1000>;
++			clocks =3D <&refclk100mhz>;
++			clock-names =3D "apb_pclk";
++			interrupts =3D <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
++			#mbox-cells =3D <2>;
++			arm,mhuv2-protocols =3D <0 0>;
++			secure-status =3D "okay";     /* secure-world-only */
++			status =3D "disabled";
++		};
++	};
++};
++
++&{/reserved-memory} {
++	ethosu_sram: ethosu_sram@02400000 {
++		reg =3D <0x02400000 0x200000>;
++		no-map;
++	};
++
++	ethosu_reserved: ethosu_reserved@A0000000 {
++		compatible =3D "shared-dma-pool";
++		reg =3D <0xA0000000 0x02000000>;
++		no-map;
++	};
++};
++
+diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
+index e906fdf1bf1..1ae679f7119 100644
+--- a/arch/arm/include/asm/armv8/cpu.h
++++ b/arch/arm/include/asm/armv8/cpu.h
+@@ -1,6 +1,7 @@
+ /* SPDX-License-Identifier: GPL-2.0+ */
+ /*
+  * Copyright 2018 NXP
++ * (C) Copyright 2026 Arm Limited
+  */
+=20
+ #define MIDR_PARTNUM_CORTEX_A35		0xD04
+@@ -11,6 +12,7 @@
+ #define MIDR_PARTNUM_CORTEX_A73		0xD09
+ #define MIDR_PARTNUM_CORTEX_A75		0xD0A
+ #define MIDR_PARTNUM_CORTEX_A76		0xD0B
++#define MIDR_PARTNUM_CORTEX_A320		0xD8F
+ #define MIDR_PARTNUM_SHIFT		0x4
+ #define MIDR_PARTNUM_MASK		(0xFFF << MIDR_PARTNUM_SHIFT)
+=20
+@@ -40,3 +42,4 @@ is_cortex_a(72)
+ is_cortex_a(73)
+ is_cortex_a(75)
+ is_cortex_a(76)
++is_cortex_a(320)
+diff --git a/board/armltd/corstone1000-a320/Kconfig b/board/armltd/corst=
one1000-a320/Kconfig
+new file mode 100644
+index 00000000000..607e5f6689b
+--- /dev/null
++++ b/board/armltd/corstone1000-a320/Kconfig
+@@ -0,0 +1,12 @@
++if TARGET_CORSTONE1000-A320
++
++config SYS_BOARD
++	default "corstone1000-a320"
++
++config SYS_VENDOR
++	default "armltd"
++
++config SYS_CONFIG_NAME
++	default "corstone1000-a320"
++
++endif
+diff --git a/board/armltd/corstone1000-a320/MAINTAINERS b/board/armltd/c=
orstone1000-a320/MAINTAINERS
+new file mode 100644
+index 00000000000..e62978b487e
+--- /dev/null
++++ b/board/armltd/corstone1000-a320/MAINTAINERS
+@@ -0,0 +1,7 @@
++CORSTONE1000-A320 BOARD
++M:	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
++M:	Frazer Carsley <frazer.carsley@arm.com>
++M:	Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
++S:	Maintained
++F:	board/armltd/corstone1000-a320/
++F:	configs/corstone1000-a320_defconfig
+diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
+index db8919298e1..0557865f59b 100644
+--- a/board/armltd/corstone1000/corstone1000.c
++++ b/board/armltd/corstone1000/corstone1000.c
+@@ -1,6 +1,6 @@
+ // SPDX-License-Identifier: GPL-2.0+
+ /*
+- * (C) Copyright 2022, 2025 Arm Limited
++ * (C) Copyright 2022, 2025-2026 Arm Limited
+  * (C) Copyright 2022 Linaro
+  * Rui Miguel Silva <rui.silva@linaro.org>
+  */
+@@ -264,7 +264,7 @@ struct mm_region *mem_map =3D corstone1000_mem_map;
+ int board_init(void)
+ {
+ #if IS_ENABLED(CONFIG_EFI_HAVE_CAPSULE_SUPPORT)
+-	if (!strcmp(DEVICE_TREE, "arm/corstone1000-fvp"))
++	if (!strstr(DEVICE_TREE, "fvp"))
+ 		update_info.images =3D fw_fvp_images;
+ 	else
+ 		update_info.images =3D fw_mps3_images;
+@@ -396,7 +396,7 @@ int board_late_init(void)
+ 	const char *cmp_dtb =3D DEVICE_TREE;
+ 	int ret;
+=20
+-	if (!strcmp(cmp_dtb, "arm/corstone1000-fvp")) {
++	if (!strstr(cmp_dtb, "fvp")) {
+ 		ret =3D uclass_first_device_err(UCLASS_VIRTIO, &virtio_bus);
+ 		if (!virtio_bus) {
+ 			log_err("Cannot find virtio device, err (%d)\n", ret);
+diff --git a/configs/corstone1000-a320_defconfig b/configs/corstone1000-=
a320_defconfig
+new file mode 100644
+index 00000000000..d0ae1e745db
+--- /dev/null
++++ b/configs/corstone1000-a320_defconfig
+@@ -0,0 +1,89 @@
++CONFIG_ARM=3Dy
++CONFIG_SKIP_LOWLEVEL_INIT=3Dy
++CONFIG_TARGET_CORSTONE1000=3Dy
++CONFIG_TEXT_BASE=3D0x80000000
++CONFIG_SYS_MALLOC_LEN=3D0x2000000
++CONFIG_NR_DRAM_BANKS=3D1
++CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
++CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
++CONFIG_DM_GPIO=3Dy
++CONFIG_DEFAULT_DEVICE_TREE=3D"corstone1000-a320-fvp"
++CONFIG_SYS_BOOTM_LEN=3D0x800000
++CONFIG_SYS_LOAD_ADDR=3D0x82100000
++CONFIG_IDENT_STRING=3D" corstone1000-a320 aarch64 "
++CONFIG_FWU_NUM_IMAGES_PER_BANK=3D4
++CONFIG_EFI_SECURE_BOOT=3Dy
++CONFIG_EFI_SET_TIME=3Dy
++CONFIG_EFI_MM_COMM_TEE=3Dy
++CONFIG_FFA_SHARED_MM_BUF_SIZE=3D4096
++CONFIG_FFA_SHARED_MM_BUF_OFFSET=3D0
++CONFIG_FFA_SHARED_MM_BUF_ADDR=3D0x81FFF000
++CONFIG_EFI_RUNTIME_UPDATE_CAPSULE=3Dy
++CONFIG_EFI_CAPSULE_ON_DISK=3Dy
++CONFIG_EFI_CAPSULE_FIRMWARE_RAW=3Dy
++CONFIG_EFI_CAPSULE_AUTHENTICATE=3Dy
++CONFIG_EFI_CAPSULE_CRT_FILE=3D"CRT.crt"
++CONFIG_FIT=3Dy
++CONFIG_FIT_SIGNATURE=3Dy
++CONFIG_LEGACY_IMAGE_FORMAT=3Dy
++CONFIG_DISTRO_DEFAULTS=3Dy
++CONFIG_BOOTDELAY=3D3
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 loglevel=3D9 ip=3Ddhcp earlyprintk=
"
++CONFIG_BOOTCOMMAND=3D"echo Loading kernel from $kernel_addr to memory .=
.. ; unzip $kernel_addr 0x90000000; loadm 0x90000000 $kernel_addr_r $file=
size; usb start; usb reset; run prepare_ondisk_fwu ; run distro_bootcmd; =
bootefi $kernel_addr_r $fdtcontroladdr;"
++CONFIG_CONSOLE_RECORD=3Dy
++CONFIG_SYS_CBSIZE=3D512
++CONFIG_LOGLEVEL=3D7
++# CONFIG_DISPLAY_CPUINFO is not set
++# CONFIG_DISPLAY_BOARDINFO is not set
++CONFIG_BOARD_INIT=3Dy
++CONFIG_SYS_PROMPT=3D"corstone1000# "
++# CONFIG_CMD_CONSOLE is not set
++CONFIG_CMD_FWU_METADATA=3Dy
++CONFIG_CMD_BOOTZ=3Dy
++# CONFIG_CMD_XIMG is not set
++CONFIG_CMD_NVEDIT_EFI=3Dy
++CONFIG_CMD_GPT=3Dy
++CONFIG_CMD_LOADM=3Dy
++# CONFIG_CMD_LOADS is not set
++CONFIG_CMD_MMC=3Dy
++CONFIG_CMD_USB=3Dy
++# CONFIG_CMD_SETEXPR is not set
++CONFIG_CMD_CACHE=3Dy
++CONFIG_CMD_EFIDEBUG=3Dy
++CONFIG_CMD_RTC=3Dy
++CONFIG_CMD_TIME=3Dy
++CONFIG_CMD_GETTIME=3Dy
++CONFIG_OF_CONTROL=3Dy
++CONFIG_VERSION_VARIABLE=3Dy
++CONFIG_NET_RANDOM_ETHADDR=3Dy
++CONFIG_REGMAP=3Dy
++CONFIG_CLK=3Dy
++CONFIG_ARM_FFA_TRANSPORT=3Dy
++CONFIG_MISC=3Dy
++CONFIG_ARM_PL180_MMCI=3Dy
++CONFIG_MTD=3Dy
++CONFIG_NVMXIP_QSPI=3Dy
++CONFIG_PHYLIB=3Dy
++CONFIG_PHY_SMSC=3Dy
++CONFIG_SMC911X=3Dy
++CONFIG_PHY=3Dy
++CONFIG_RAM=3Dy
++CONFIG_DM_RTC=3Dy
++CONFIG_RTC_EMULATION=3Dy
++CONFIG_DM_SERIAL=3Dy
++CONFIG_SYSRESET=3Dy
++CONFIG_SYSRESET_PSCI=3Dy
++CONFIG_TEE=3Dy
++CONFIG_OPTEE=3Dy
++CONFIG_USB=3Dy
++CONFIG_USB_ISP1760=3Dy
++CONFIG_VIRTIO_MMIO=3Dy
++CONFIG_VIRTIO_NET=3Dy
++# CONFIG_RANDOM_UUID is not set
++CONFIG_ERRNO_STR=3Dy
++# CONFIG_HEXDUMP is not set
++CONFIG_FWU_MULTI_BANK_UPDATE=3Dy
++CONFIG_FWU_MDATA_V2=3Dy
++CONFIG_FWU_ARM_PSA=3Dy
++# CONFIG_TOOLS_MKEFICAPSULE is not set
+diff --git a/doc/device-tree-bindings/arm/arm,corstone1000-a320.yml b/do=
c/device-tree-bindings/arm/arm,corstone1000-a320.yml
+new file mode 100644
+index 00000000000..9c8671d1775
+--- /dev/null
++++ b/doc/device-tree-bindings/arm/arm,corstone1000-a320.yml
+@@ -0,0 +1,31 @@
++# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
++%YAML 1.2
++---
++$id: http://devicetree.org/schemas/arm/arm,corstone1000-a320.yaml#
++$schema: http://devicetree.org/meta-schemas/core.yaml#
++
++title: ARM Corstone1000-A320
++
++maintainers:
++  - Frazer Carsley <frazer.carsley@arm.com>
++  - Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
++  - Hugues Kamba Mpiana <hugues.kambampiana@arm.com>
++
++description: |+
++  ARM's Corstone1000-A320 platform is a Corstone1000 variant that suppo=
rts
++  Cortex-A320 processors, enables the use of an integrated Ethos-U85 NP=
U and
++  an upgraded GIC-700 interrupt controller.
++
++properties:
++  $nodename:
++    const: '/'
++  compatible:
++    oneOf:
++      - description: Corstone1000-A320 FVP is the Fixed Virtual Platfor=
m
++          implementation of this system. See ARM ecosystems FVP's.
++        items:
++          - const: arm,corstone1000-a320-fvp
++
++additionalProperties: true
++
++...
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone=
1000-a320.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corst=
one1000-a320.cfg
deleted file mode 100644
index 46760950..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone1000-a3=
20.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-CONFIG_ETHOS_U85=3Dy
-CONFIG_GIC_700=3Dy

