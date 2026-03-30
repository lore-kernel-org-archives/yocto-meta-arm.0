Return-Path: <Michael.safwat@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4251FB3D1A
	for <webhook@archiver.kernel.org>; Mon, 30 Mar 2026 10:54:50 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48393.1774868086222113365
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 30 Mar 2026 03:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=XQvo6LSz;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: michael.safwat@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B42FE2BCB;
	Mon, 30 Mar 2026 03:54:39 -0700 (PDT)
Received: from e142473.cambridge.arm.com (e142473.arm.com [10.1.198.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 156643F915;
	Mon, 30 Mar 2026 03:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1774868085; bh=E+I34iTXD3RW86CzXx8NbNOwTrP7je02FaBCbtNVp5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XQvo6LSzYYI3W9RK+N0okWnLYNQdmbXH1KujyaHyhMC61Cqtiv36ESKuChk31U0aI
	 h0QVSPdoSGN+vx1ivzqitl0Q51a+aN+FYc+CLskNbnDc4bVOdMaOUFYv/hTzc3zVrB
	 ZiNxdHIZ2+9CmYFt8lbAdNBZFmP4jmxJM8W6Hyeo=
From: Michael Safwat <michael.safwat@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/7] arm-bsp/u-boot:cs1k: Rework CONFIG_OF_UPSTREAM patch
Date: Mon, 30 Mar 2026 11:43:11 +0100
Message-ID: <20260330105428.2580463-2-michael.safwat@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260330105428.2580463-1-michael.safwat@arm.com>
References: <20260330105428.2580463-1-michael.safwat@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 30 Mar 2026 10:54:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6981

From: Frazer Carsley <frazer.carsley@arm.com>

Rework the patch that enables the OF_UPSTREAM config option to split
off the extra device tree nodes into their own dtsi files, making it
easier to combine them in different ways. The rest of the patches have
changed only so that they can be applied cleanly.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...able-OF_UPSTREAM-device-tree-support.patch | 101 ++++++++++++------
 ...-use-32-bit-cells-for-reserved-memor.patch |   8 +-
 ...e1000-Add-Cortex-A320-support-on-FVP.patch |  42 +++-----
 3 files changed, 88 insertions(+), 63 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-enable-OF_UPSTREAM-device-tree-support.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-OF_UPSTREAM-=
device-tree-support.patch
index 3776c986..a86b791a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
@@ -1,4 +1,4 @@
-From d7500d2733efc8f872bd4be60b31176eec27b5d0 Mon Sep 17 00:00:00 2001
+From e070ae0f02b10bfd482146a748095ca782f73039 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 19 Jan 2026 15:16:52 +0000
 Subject: [PATCH] corstone1000: enable OF_UPSTREAM device tree support
@@ -6,27 +6,32 @@ Subject: [PATCH] corstone1000: enable OF_UPSTREAM devic=
e tree support
 Enable OF_UPSTREAM option set for corstone1000 platform. Remove
 legacy u-boot corstone1000 device trees.
 Add device tree files for FVP and MPS3 platforms to add device
-tree nodes that are missing from the upstream.
+tree nodes that are missing from the upstream. These are done in a
+modular way.
=20
 Signed-off-by: Clement Faure <clement.faure@arm.com>
 Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
 Upstream-Status: Pending [Not submitted to upstream yet]
 ---
- arch/arm/dts/Makefile                      |   3 -
- arch/arm/dts/corstone1000-fvp-u-boot.dtsi  |  15 ++
- arch/arm/dts/corstone1000-fvp.dts          |  82 ---------
- arch/arm/dts/corstone1000-mps3-u-boot.dtsi |   8 +
- arch/arm/dts/corstone1000-mps3.dts         |  32 ----
- arch/arm/dts/corstone1000-u-boot.dtsi      |  39 +++++
- arch/arm/dts/corstone1000.dtsi             | 194 ---------------------
- board/armltd/corstone1000/corstone1000.c   |   4 +-
- configs/corstone1000_defconfig             |   5 +-
- 9 files changed, 68 insertions(+), 314 deletions(-)
+ arch/arm/dts/Makefile                        |   3 -
+ arch/arm/dts/corstone1000-extsys-u-boot.dtsi |  14 ++
+ arch/arm/dts/corstone1000-fvp-u-boot.dtsi    |   9 +
+ arch/arm/dts/corstone1000-fvp.dts            |  82 --------
+ arch/arm/dts/corstone1000-mps3-u-boot.dtsi   |   9 +
+ arch/arm/dts/corstone1000-mps3.dts           |  32 ---
+ arch/arm/dts/corstone1000-u-boot.dtsi        |  30 +++
+ arch/arm/dts/corstone1000-virtio-u-boot.dtsi |  13 ++
+ arch/arm/dts/corstone1000.dtsi               | 194 -------------------
+ board/armltd/corstone1000/corstone1000.c     |   4 +-
+ configs/corstone1000_defconfig               |   5 +-
+ 11 files changed, 81 insertions(+), 314 deletions(-)
+ create mode 100644 arch/arm/dts/corstone1000-extsys-u-boot.dtsi
  create mode 100644 arch/arm/dts/corstone1000-fvp-u-boot.dtsi
  delete mode 100644 arch/arm/dts/corstone1000-fvp.dts
  create mode 100644 arch/arm/dts/corstone1000-mps3-u-boot.dtsi
  delete mode 100644 arch/arm/dts/corstone1000-mps3.dts
  create mode 100644 arch/arm/dts/corstone1000-u-boot.dtsi
+ create mode 100644 arch/arm/dts/corstone1000-virtio-u-boot.dtsi
  delete mode 100644 arch/arm/dts/corstone1000.dtsi
=20
 diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
@@ -43,27 +48,41 @@ index 7c8cf3a5a1d..89b3728379b 100644
  dtb-$(CONFIG_TARGET_COREPRIMEVELTE) +=3D pxa1908-samsung-coreprimevelte=
.dtb
 =20
  include $(srctree)/scripts/Makefile.dts
+diff --git a/arch/arm/dts/corstone1000-extsys-u-boot.dtsi b/arch/arm/dts=
/corstone1000-extsys-u-boot.dtsi
+new file mode 100644
+index 00000000000..074f45f0e69
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-extsys-u-boot.dtsi
+@@ -0,0 +1,14 @@
++// SPDX-License-Identifier: GPL-2.0 or MIT
++/*
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ */
++
++&{/soc} {
++	extsys0: remoteproc@1a010310 {
++		compatible =3D "arm,corstone1000-extsys";
++		reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
++		reg-names =3D "reset-control", "reset-status";
++		firmware-name =3D "es_flashfw.elf";
++	};
++};
 diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
 new file mode 100644
-index 00000000000..20425fa0624
+index 00000000000..5cb7762fc1c
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
-@@ -0,0 +1,15 @@
+@@ -0,0 +1,9 @@
 +// SPDX-License-Identifier: GPL-2.0 or MIT
 +/*
-+ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
 + *
 + */
 +
 +#include "corstone1000-u-boot.dtsi"
-+
-+/ {
-+	virtio: virtio-net@40400000 {
-+		compatible =3D "virtio,mmio";
-+		reg =3D <0x40400000 0x10000>;
-+		interrupts =3D <145>;
-+	};
-+};
++#include "corstone1000-extsys-u-boot.dtsi"
++#include "corstone1000-virtio-u-boot.dtsi"
 diff --git a/arch/arm/dts/corstone1000-fvp.dts b/arch/arm/dts/corstone10=
00-fvp.dts
 deleted file mode 100644
 index cd8a132271e..00000000000
@@ -154,17 +173,18 @@ index cd8a132271e..00000000000
 -
 diff --git a/arch/arm/dts/corstone1000-mps3-u-boot.dtsi b/arch/arm/dts/c=
orstone1000-mps3-u-boot.dtsi
 new file mode 100644
-index 00000000000..9ab744d8d20
+index 00000000000..0d9d6c5e6e1
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-mps3-u-boot.dtsi
-@@ -0,0 +1,8 @@
+@@ -0,0 +1,9 @@
 +// SPDX-License-Identifier: GPL-2.0 or MIT
 +/*
-+ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
 + *
 + */
 +
 +#include "corstone1000-u-boot.dtsi"
++#include "corstone1000-extsys-u-boot.dtsi"
 +
 diff --git a/arch/arm/dts/corstone1000-mps3.dts b/arch/arm/dts/corstone1=
000-mps3.dts
 deleted file mode 100644
@@ -206,13 +226,13 @@ index e3146747c2d..00000000000
 -};
 diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
 new file mode 100644
-index 00000000000..95dd277d4cc
+index 00000000000..a75bc7016aa
 --- /dev/null
 +++ b/arch/arm/dts/corstone1000-u-boot.dtsi
-@@ -0,0 +1,39 @@
+@@ -0,0 +1,30 @@
 +// SPDX-License-Identifier: GPL-2.0 or MIT
 +/*
-+ * Copyright 2025 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ * Copyright 2025-2026 Arm Limited and/or its affiliates <open-source-o=
ffice@arm.com>
 + *
 + */
 +
@@ -240,13 +260,23 @@ index 00000000000..95dd277d4cc
 +		};
 +	};
 +};
+diff --git a/arch/arm/dts/corstone1000-virtio-u-boot.dtsi b/arch/arm/dts=
/corstone1000-virtio-u-boot.dtsi
+new file mode 100644
+index 00000000000..89ff06a51f8
+--- /dev/null
++++ b/arch/arm/dts/corstone1000-virtio-u-boot.dtsi
+@@ -0,0 +1,13 @@
++// SPDX-License-Identifier: GPL-2.0 or MIT
++/*
++ * Copyright 2026 Arm Limited and/or its affiliates <open-source-office=
@arm.com>
++ *
++ */
 +
-+&{/soc} {
-+	extsys0: remoteproc@1a010310 {
-+		compatible =3D "arm,corstone1000-extsys";
-+		reg =3D <0x1a010310 0x4>, <0x1a010314 0x4>;
-+		reg-names =3D "reset-control", "reset-status";
-+		firmware-name =3D "es_flashfw.elf";
++/ {
++	virtio: virtio-net@40400000 {
++		compatible =3D "virtio,mmio";
++		reg =3D <0x40400000 0x10000>;
++		interrupts =3D <145>;
 +	};
 +};
 diff --git a/arch/arm/dts/corstone1000.dtsi b/arch/arm/dts/corstone1000.=
dtsi
@@ -494,3 +524,4 @@ index 450d69762ab..350607892fa 100644
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-dts-use-32-bit-cells-for-reserved-memor.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-dts-use-32-bit-cel=
ls-for-reserved-memor.patch
index c74c0311..743b2547 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
@@ -1,7 +1,8 @@
-From b457d1a3665dbac8499ccf8d0726a30e4d0554da Mon Sep 17 00:00:00 2001
+From df01111a866a37fcf875b3c2e2394414d27c89da Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 24 Sep 2025 13:42:25 +0000
-Subject: [PATCH] corstone1000: dts: use 32-bit cells for /reserved-memor=
y node
+Subject: [PATCH] corstone1000: dts: use 32-bit cells for
+ /reserved-memory node
=20
 Switch the *reserved-memory* node from two-cell (64-bit) encoding to
 one-cell (32-bit) encoding and adjust the `reg` property accordingly
@@ -14,7 +15,7 @@ Signed-off-by: Harsimran Singh Tungal <harsimransingh.t=
ungal@arm.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
=20
 diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
-index 95dd277d4cc..b29ac74217e 100644
+index a75bc7016aa..4ea6f1d9724 100644
 --- a/arch/arm/dts/corstone1000-u-boot.dtsi
 +++ b/arch/arm/dts/corstone1000-u-boot.dtsi
 @@ -18,12 +18,12 @@
@@ -33,3 +34,4 @@ index 95dd277d4cc..b29ac74217e 100644
  			no-map;
  		};
  	};
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-Add-Cortex-A320-support-on-FVP.patch b/meta-arm-bsp/recipes-bsp=
/u-boot/u-boot/corstone1000/0039-corstone1000-Add-Cortex-A320-support-on-=
FVP.patch
index af4215a4..be0367b3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-Add-Cortex-A320-support-on-FVP.patch
@@ -1,6 +1,6 @@
-From 46fd90a19c9a2c04fb958badb19e148b08f559c8 Mon Sep 17 00:00:00 2001
+From ef9306fde5247ccd8fecec5f886f52426c01af61 Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
-Date: Fri, 15 Aug 2025 09:22:26 +0100
+Date: Wed, 25 Feb 2026 14:08:07 +0000
 Subject: [PATCH] corstone1000: Add Cortex-A320 support on FVP
 MIME-Version: 1.0
 Content-Type: text/plain; charset=3DUTF-8
@@ -49,20 +49,20 @@ Upstream-Status: Submitted (https://lore.kernel.org/a=
ll/20251127154752.589691-1-
 Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
 Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 ---
- arch/arm/dts/corstone1000-fvp-u-boot.dtsi | 39 ++++++++++++
- arch/arm/dts/corstone1000-u-boot.dtsi     | 76 +++++++++++++++++++++++
+ arch/arm/dts/corstone1000-fvp-u-boot.dtsi | 38 +++++++++++
+ arch/arm/dts/corstone1000-u-boot.dtsi     | 79 +++++++++++++++++++++++
  arch/arm/include/asm/armv8/cpu.h          |  1 +
  board/armltd/corstone1000/Kconfig         |  8 +++
- 4 files changed, 124 insertions(+)
+ 4 files changed, 126 insertions(+)
=20
 diff --git a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi b/arch/arm/dts/co=
rstone1000-fvp-u-boot.dtsi
-index 20425fa0624..0539e6c092a 100644
+index 5cb7762fc1c..7ad4ca9e070 100644
 --- a/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
 +++ b/arch/arm/dts/corstone1000-fvp-u-boot.dtsi
-@@ -13,3 +13,42 @@
- 		interrupts =3D <145>;
- 	};
- };
+@@ -7,3 +7,41 @@
+ #include "corstone1000-u-boot.dtsi"
+ #include "corstone1000-extsys-u-boot.dtsi"
+ #include "corstone1000-virtio-u-boot.dtsi"
 +
 +&{/cpus} {
 +	cpu1: cpu@1 {
@@ -101,15 +101,15 @@ index 20425fa0624..0539e6c092a 100644
 +		next-level-cache =3D <&L2_0>;
 +	};
 +};
-+
 diff --git a/arch/arm/dts/corstone1000-u-boot.dtsi b/arch/arm/dts/corsto=
ne1000-u-boot.dtsi
-index b29ac74217e..7f75eae48cc 100644
+index 4ea6f1d9724..fef56d1ec66 100644
 --- a/arch/arm/dts/corstone1000-u-boot.dtsi
 +++ b/arch/arm/dts/corstone1000-u-boot.dtsi
-@@ -29,6 +29,15 @@
+@@ -28,3 +28,82 @@
+ 		};
  	};
  };
-=20
++
 +&{/cpus} {
 +	cpu: cpu@0 {
 +		device_type =3D "cpu";
@@ -118,14 +118,6 @@ index b29ac74217e..7f75eae48cc 100644
 +		next-level-cache =3D <&L2_0>;
 +	};
 +};
-+
- &{/soc} {
- 	extsys0: remoteproc@1a010310 {
- 		compatible =3D "arm,corstone1000-extsys";
-@@ -37,3 +46,72 @@
- 		firmware-name =3D "es_flashfw.elf";
- 	};
- };
 +
 +#ifdef CONFIG_ETHOS_U85
 +&{/reserved-memory} {
@@ -138,6 +130,7 @@ index b29ac74217e..7f75eae48cc 100644
 +		compatible =3D "shared-dma-pool";
 +		reg =3D <0xA0000000 0x02000000>;
 +		no-map;
++
 +	};
 +};
 +
@@ -196,7 +189,7 @@ index b29ac74217e..7f75eae48cc 100644
 +	};
 +#endif
 diff --git a/arch/arm/include/asm/armv8/cpu.h b/arch/arm/include/asm/arm=
v8/cpu.h
-index e906fdf1bf1..a361c1100b3 100644
+index e906fdf1bf1..4ef2ff07f7a 100644
 --- a/arch/arm/include/asm/armv8/cpu.h
 +++ b/arch/arm/include/asm/armv8/cpu.h
 @@ -11,6 +11,7 @@
@@ -208,7 +201,7 @@ index e906fdf1bf1..a361c1100b3 100644
  #define MIDR_PARTNUM_MASK		(0xFFF << MIDR_PARTNUM_SHIFT)
 =20
 diff --git a/board/armltd/corstone1000/Kconfig b/board/armltd/corstone10=
00/Kconfig
-index 709674d4cf7..3af29b2bae7 100644
+index 709674d4cf7..eea5c9b8972 100644
 --- a/board/armltd/corstone1000/Kconfig
 +++ b/board/armltd/corstone1000/Kconfig
 @@ -9,4 +9,12 @@ config SYS_VENDOR
@@ -224,4 +217,3 @@ index 709674d4cf7..3af29b2bae7 100644
 +	default n
 +
  endif
-

