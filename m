Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B28FD0052
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:51 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48191.1774868088664430708
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=nAMrfnWF;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EBE002BCB;
	Mon, 30 Mar 2026 03:54:41 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 50EB03F915;
	Mon, 30 Mar 2026 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868087; bh=T7/rWtQzrntMBPXF2EoGNEHolSt4OlMJPJmyF0GiL6E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nAMrfnWFFHYFV3aFZB5qSyPQGegNJ/YRC3q0mVXtLOOfTOrZDaolmilPaWGB8/E4J
	 N9mciDxNyz3Plv9+FtKEQyxnklYDFdIx6XJAcEp05vTWh+5OqGZW/kaP4vWptPbQw+
	 kvp5Ow3EsBwLLcdpzAXjwWptB9/v7tBOs2CcZoKw=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Michael Safwat <michael.safwat@arm.com>,
	Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 4/7] arm-bsp/u-boot: cs1k: Align Ethos-U85 DT with in-tree driver
Date: Mon, 30 Mar 2026 11:43:14 +0100
Message-ID: <20260330105428.2580463-5-michael.safwat@arm.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6985

Align the Corstone1000 Ethos-U85 device tree to match the upstream
bindings used by the in-tree Ethos-U DRM accel driver.

- Rework the Corstone1000 U-Boot patch to replace the legacy arm,ethosu-d=
irect
  node with an upstream-style Ethos-U85 node (arm,ethos-u85), add the
  required clocks/clock-names, and switch the SRAM description to
  mmio-sram.

- Drop meta-ethos specific properties (reserved-memory/dma-ranges,
/region-cfgs/mem-config) from the U-Boot DT.

- Enable required kernel options for the in-tree driver and SRAM provider=
:
  - CONFIG_SRAM
  - CONFIG_DRM
  - CONFIG_DRM_ACCEL
  - CONFIG_DRM_ACCEL_ARM_ETHOSU

Signed-off-by: Michael Safwat <michael.safwat@arm.com>
Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...-a320-Add-Corstone1000-board-variant.patch | 81 ++++++-------------
 .../linux/files/corstone1000/ethosu.cfg       |  4 +
 .../linux/linux-arm-platforms.inc             |  1 +
 3 files changed, 30 insertions(+), 56 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-kernel/linux/files/corstone1000/=
ethosu.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-a320-Add-Corstone1000-board-variant.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-a320-Add-Corstone1000-=
board-variant.patch
index d370021b..59bf7aa2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
@@ -1,4 +1,4 @@
-From 9f95097d9b2d9b1360b5c105161509ea9a5b198d Mon Sep 17 00:00:00 2001
+From da23886f3b38812c60a4597db129ab96df74bb99 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Wed, 25 Feb 2026 14:28:08 +0000
 Subject: [PATCH] corstone1000-a320: Add Corstone1000 board variant
@@ -22,13 +22,9 @@ compatibility with Cortex-A35 and GIC-400.
=20
 * Add `/ethosu@1a050000` node describing the NPU register block at
   `0x1A050000`.
-* Introduce associated reserved memory regions:
-  * `ethosu_sram@02400000`: 2 MiB on-chip SRAM (`no-map`).
-  * `ethosu_reserved@A0000000`: 32 MiB DDR carve-out
-     (`shared-dma-pool`).
-* Connect memory regions through `memory-region` and `sram` phandles.
-* Add `dma-ranges`, interrupt spec, `region-cfgs`, `cs-region`, and
-  `ethosu-mem-config` for full driver support.
+* `ethosu_sram@02400000`: 2 MiB on-chip SRAM.
+* Fully compliant with upstream bindings.
+
 **GIC-700 support**
=20
 * Add full GICv3 node.
@@ -41,20 +37,22 @@ These updates align the Corstone-1000 platform with A=
rm=E2=80=99s latest
 Cortex-A320 and Ethos-U85 configurations and ensure proper interrupt
 and memory mapping for both secure and non-secure domains.
=20
-Upstream-Status: Inappropriate [Unsupported ethosu device-tree nodes, de=
nied by maintainers (https://lore.kernel.org/all/20251127154752.589691-1-=
frazer.carsley@arm.com/)]
+Upstream-Status: Pending [Strong dependency on previous patches that
+should be upstreamed first]
 Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
+Signed-off-by: Michael Safwat <michael.safwat@arm.com>
 ---
  arch/arm/Kconfig                              |   1 +
- arch/arm/dts/corstone1000-a320-fvp.dts        |  51 ++++
- arch/arm/dts/corstone1000-a320.dtsi           | 237 ++++++++++++++++++
+ arch/arm/dts/corstone1000-a320-fvp.dts        |  51 +++++
+ arch/arm/dts/corstone1000-a320.dtsi           | 208 ++++++++++++++++++
  arch/arm/include/asm/armv8/cpu.h              |   3 +
  board/armltd/corstone1000-a320/Kconfig        |  12 +
  board/armltd/corstone1000-a320/MAINTAINERS    |   7 +
  board/armltd/corstone1000/corstone1000.c      |   6 +-
- configs/corstone1000-a320_defconfig           |  89 +++++++
+ configs/corstone1000-a320_defconfig           |  89 ++++++++
  .../arm/arm,corstone1000-a320.yml             |  31 +++
- 9 files changed, 434 insertions(+), 3 deletions(-)
+ 9 files changed, 405 insertions(+), 3 deletions(-)
  create mode 100644 arch/arm/dts/corstone1000-a320-fvp.dts
  create mode 100644 arch/arm/dts/corstone1000-a320.dtsi
  create mode 100644 board/armltd/corstone1000-a320/Kconfig
@@ -133,10 +131,10 @@ index 00000000000..c01c629e0ca
 +};
 diff --git a/arch/arm/dts/corstone1000-a320.dtsi b/arch/arm/dts/corstone=
1000-a320.dtsi
 new file mode 100644
-index 00000000000..28424db77bb
+index 00000000000..6715e15ec37
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-a320.dtsi
-@@ -0,0 +1,237 @@
+@@ -0,0 +1,208 @@
 +// SPDX-License-Identifier: GPL-2.0 or MIT
 +/*
 + * Copyright 2026, Arm Limited and/or its affiliates <open-source-offic=
e@arm.com>
@@ -260,42 +258,26 @@ index 00000000000..28424db77bb
 +		method =3D "smc";
 +	};
 +
-+	ethosu: ethosu@1A050000 {
-+		compatible =3D "arm,ethosu-direct";
++	ethosu_sram: ethosu_sram@02400000 {
++		compatible =3D "mmio-sram";
++		reg =3D <0x02400000 0x200000>;
 +		#address-cells =3D <1>;
 +		#size-cells =3D <1>;
++		ranges;
++	};
++
++	ethosu@1A050000 {
++		compatible =3D "arm,corstone1000-ethos-u85", "arm,ethos-u85";
 +
 +		// Base address and size of NPU registers
 +		reg =3D <0x1A050000 0x4000>;
 +
-+		memory-region =3D <&ethosu_reserved>;
 +		sram =3D <&ethosu_sram>;
 +
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
++		interrupts =3D <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
++
++		clocks =3D <&uartclk>, <&refclk100mhz>;
++		clock-names =3D "core", "apb";
 +	};
 +
 +	soc {
@@ -361,19 +343,6 @@ index 00000000000..28424db77bb
 +	};
 +};
 +
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
-+	};
-+};
-+
 diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
 index e906fdf1bf1..1ae679f7119 100644
 --- a/arch/arm/include/asm/armv8/cpu.h
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.=
cfg b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg
new file mode 100644
index 00000000..aee5312c
--- /dev/null
+++ b/meta-arm-bsp/recipes-kernel/linux/files/corstone1000/ethosu.cfg
@@ -0,0 +1,4 @@
+CONFIG_SRAM=3Dy
+CONFIG_DRM=3Dy
+CONFIG_DRM_ACCEL=3Dy
+CONFIG_DRM_ACCEL_ARM_ETHOSU=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index a0c4128f..4bd28ebe 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -65,6 +65,7 @@ KMACHINE:corstone1000:cortexa320 =3D "corstone1000-a320=
"
 LINUX_KERNEL_TYPE:corstone1000:cortexa320 =3D "standard"
 SRC_URI:append:corstone1000:cortexa320 =3D " \
     file://defconfig  \
+    file://ethosu.cfg \
 "
=20
 # Default kernel features not needed for Corstone-1000 with

