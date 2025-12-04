Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42AA6D21696
	for <webhook@archiver.kernel.org>; Thu,  4 Dec 2025 15:25:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46103.1764861918517249225
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 04 Dec 2025 07:25:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14D2339;
	Thu,  4 Dec 2025 07:25:10 -0800 (PST)
Received: from LXKV206JHX.arm.com (unknown [10.57.43.122])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484DA3F59E;
	Thu,  4 Dec 2025 07:25:17 -0800 (PST)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 5/6] arm-bsp/u-boot:corstone1000: Add Cortex-A320 suppport
Date: Thu,  4 Dec 2025 15:19:52 +0000
Message-ID: <20251204152500.78818-6-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251204152500.78818-1-hugues.kambampiana@arm.com>
References: <20251204152500.78818-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 04 Dec 2025 15:25:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6784

From: Frazer Carsley <frazer.carsley@arm.com>

Update Corstone-1000 U-Boot device tree for the Cortex-A320 variant
and enable GICv3/GIC-600, while keeping compatibility with the
existing GIC-400 setup. A single DT image now supports either
configuration via Kconfig guards.

**Device-tree updates (Cortex-A320)**

* Map Ethos-U85 NPU registers at `0x1A050000` (16 KiB) and its SRAM at
  `0x02400000` (2 MiB, no-map), plus a 32 MiB DDR carve-out for DMA.
* Add `/ethosu@1a050000` with interrupts, `dma-ranges`, `cs-region`,
  and `ethosu-mem-config` for driver probe.
* Guard the NPU node behind `CONFIG_ETHOS_U85`.
* Add a Cortex-A320 compatible string to the Corstone-1000 DTS
  downstream.

**GICv3/GIC-600 selection**

* Introduce `CONFIG_GIC_V3` to select the new interrupt controller.
* Add a full GICv3/GIC-600 node guarded by `#ifdef CONFIG_GIC_V3`.
* When GICv3 is enabled, set `cpu@1..3` `reg` to `0x100/0x200/0x300`
  (retain `0x1/0x2/0x3` for GIC-400).
* Update the Ethos-U85 interrupt to **SPI 16** to match the interrupt
  map.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 .../u-boot/u-boot-corstone1000.inc            |  10 +
 ...e1000-Add-Cortex-A320-support-on-FVP.patch | 223 ++++++++++++++++++
 .../u-boot/corstone1000/corstone1000-a320.cfg |   2 +
 3 files changed, 235 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0=
039-corstone1000-Add-Cortex-A320-support-on-FVP.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/c=
orstone1000-a320.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
index b33a5bcb..52e0acaf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-corstone1000.inc
@@ -74,6 +74,16 @@ SRC_URI:append =3D " \
     file://0040-corstone1000-dts-use-32-bit-cells-for-reserved-memor.pat=
ch \
 "
=20
+# Add Cortex-a320 support
+SRC_URI:append =3D " \
+    file://0039-corstone1000-Add-Cortex-A320-support-on-FVP.patch \
+"
+
+# Add Cortex-a320 specific configurations
+SRC_URI:append:cortexa320 =3D " \
+    file://corstone1000-a320.cfg \
+"
+
 uboot_configure_config:append() {
    openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=3DCRT/ -keyout $=
{B}/CRT.key -out $builddir/CRT.crt -nodes -days 365
 }
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0039-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
new file mode 100644
index 00000000..ecd96c45
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
@@ -0,0 +1,223 @@
+From 6a1e76a1c0e52c11e9abdcb5990002468650bd81 Mon Sep 17 00:00:00 2001
+From: Frazer Carsley <frazer.carsley@arm.com>
+Date: Fri, 15 Aug 2025 09:22:26 +0100
+Subject: [PATCH] corstone1000: Add Cortex-A320 support on FVP
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Enable Cortex-A320 support on the Corstone-1000 platform
+(including FVP) and update the device tree to support the integrated
+Ethos-U85 NPU and GIC-600 interrupt controller. These updates make
+the platform fully compatible with Cortex-A320 while retaining
+backward compatibility with Cortex-A35 and GIC-400.
+
+**Cortex-A320 enablement**
+
+* Extend Corstone-1000 compatibility list to include `cortex-a320`.
+* Ensure build and device-tree logic support both Cortex-A35 and
+  Cortex-A320 configurations.
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
+* Enable the NPU node conditionally via `CONFIG_ETHOS_U85`.
+
+**GICv3/GIC-600 support**
+
+* Introduce `CONFIG_GIC_V3` to toggle between GIC-400 (v2) and
+  GIC-600 (v3).
+* Add full GICv3 node guarded by `#ifdef CONFIG_GIC_V3`.
+* Adjust `cpu@1..3` `reg` values to `0x100/0x200/0x300` under
+  GICv3 (keep `0x1/0x2/0x3` for GIC-400).
+* Update Ethos-U85 interrupt assignment to **SPI 16** to align with
+  the new interrupt map.
+
+These updates align the Corstone-1000 platform with Arm=E2=80=99s latest
+Cortex-A320 and Ethos-U85 configurations and ensure proper interrupt
+and memory mapping for both secure and non-secure domains.
+
+Upstream-Status: Submitted (https://lore.kernel.org/all/20251127154752.5=
89691-1-frazer.carsley@arm.com/)
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+---
+ arch/arm/dts/corstone1000-fvp-u-boot.dtsi | 18 +++++-
+ arch/arm/dts/corstone1000-u-boot.dtsi     | 76 +++++++++++++++++++++++
+ arch/arm/include/asm/armv8/cpu.h          |  1 +
+ board/armltd/corstone1000/Kconfig         |  7 +++
+ 4 files changed, 99 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
+index 6b89d653417..0539e6c092a 100644
+--- a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
++++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
+@@ -17,24 +17,36 @@
+ &{/cpus} {
+ 	cpu1: cpu@1 {
+ 		device_type =3D "cpu";
+-		compatible =3D "arm,cortex-a35";
++		compatible =3D "arm,cortex-a35","arm,cortex-a320";
++#ifdef CONFIG_GIC_V3
++		reg =3D <0x100>;
++#else
+ 		reg =3D <0x1>;
++#endif
+ 		enable-method =3D "psci";
+ 		next-level-cache =3D <&L2_0>;
+ 	};
+=20
+ 	cpu2: cpu@2 {
+ 		device_type =3D "cpu";
+-		compatible =3D "arm,cortex-a35";
++		compatible =3D "arm,cortex-a35","arm,cortex-a320";
++#ifdef CONFIG_GIC_V3
++		reg =3D <0x200>;
++#else
+ 		reg =3D <0x2>;
++#endif
+ 		enable-method =3D "psci";
+ 		next-level-cache =3D <&L2_0>;
+ 	};
+=20
+ 	cpu3: cpu@3 {
+ 		device_type =3D "cpu";
+-		compatible =3D "arm,cortex-a35";
++		compatible =3D "arm,cortex-a35","arm,cortex-a320";
++#ifdef CONFIG_GIC_V3
++		reg =3D <0x300>;
++#else
+ 		reg =3D <0x3>;
++#endif
+ 		enable-method =3D "psci";
+ 		next-level-cache =3D <&L2_0>;
+ 	};
+diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
+index b29ac74217e..206403ea9a5 100644
+--- a/arch/arm/dts/corstone1000-u-boot.dtsi
++++ b/arch/arm/dts/corstone1000-u-boot.dtsi
+@@ -29,6 +29,15 @@
+ 	};
+ };
+=20
++&{/cpus} {
++	cpu: cpu@0 {
++		device_type =3D "cpu";
++		compatible =3D "arm,cortex-a35","arm,cortex-a320";
++		reg =3D <0>;
++		next-level-cache =3D <&L2_0>;
++	};
++};
++
+ &{/soc} {
+ 	extsys0: remoteproc@1a010310 {
+ 		compatible =3D "arm,corstone1000-extsys";
+@@ -37,3 +46,70 @@
+ 		firmware-name =3D "es_flashfw.elf";
+ 	};
+ };
++
++#ifdef CONFIG_ETHOS_U85
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
++/ {
++	ethosu: ethosu@1A050000 {
++		compatible =3D "arm,ethosu-direct";
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
++		<0xA0000000 0xA0000000 0x02000000>;
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
++};
++#endif
++#ifdef CONFIG_GIC_V3
++gic: &{/interrupt-controller@1c000000} {
++		compatible =3D "arm,gic-v3";
++		#interrupt-cells =3D <3>;
++		#address-cells =3D <1>;
++		#size-cells =3D <1>;
++		ranges;
++		interrupt-controller;
++		reg =3D <0x1c000000 0x00010000>,
++		<0x1c040000 0x00080000>;
++		interrupts =3D <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
++	};
++#endif
++
+diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
+index 4dbb589aab8..ffd8f8f358f 100644
+--- a/arch/arm/include/asm/armv8/cpu.h
++++ b/arch/arm/include/asm/armv8/cpu.h
+@@ -8,6 +8,7 @@
+ #define MIDR_PARTNUM_CORTEX_A57		0xD07
+ #define MIDR_PARTNUM_CORTEX_A72		0xD08
+ #define MIDR_PARTNUM_CORTEX_A76		0xD0B
++#define MIDR_PARTNUM_CORTEX_A320		0xD8F
+ #define MIDR_PARTNUM_SHIFT		0x4
+ #define MIDR_PARTNUM_MASK		(0xFFF << MIDR_PARTNUM_SHIFT)
+=20
+diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone10=
00/Kconfig
+index 709674d4cf7..9476d64d0b0 100644
+--- a/board/armltd/corstone1000/Kconfig
++++ b/board/armltd/corstone1000/Kconfig
+@@ -9,4 +9,11 @@ config SYS_VENDOR
+ config SYS_CONFIG_NAME
+ 	default "corstone1000"
+=20
++config ETHOS_U85
++	bool "Enable Arm Ethos-U85 NPU support"
++	default n
++
++config GIC_V3
++	bool "Enable GIC v3 support"
++	default n
+ endif
+--=20
+2.50.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone=
1000-a320.cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corst=
one1000-a320.cfg
new file mode 100644
index 00000000..866b983f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/corstone1000-a3=
20.cfg
@@ -0,0 +1,2 @@
+CONFIG_ETHOS_U85=3Dy
+CONFIG_GIC_V3=3Dy

