Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C29AAC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 08:08:09 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.9438.1654589279837025595
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Jun 2022 01:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4BDE143D;
	Tue,  7 Jun 2022 01:07:58 -0700 (PDT)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C90FC3F73B;
	Tue,  7 Jun 2022 01:07:57 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	robbie.cao@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 1/3] arm-bsp/u-boot: Update fvp-baser-aemv8r64 patches for
 v2022.04
Date: Tue,  7 Jun 2022 09:08:05 +0100
Message-Id: <20220607080807.976725-1-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Jun 2022 08:08:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3475

From: Peter Hoyes <Peter.Hoyes@arm.com>

The backports are now merged, so remove patches 1 through 5 and
renumber.

Upstream now requires CONFIG_DEFAULT_DEVICE_TREE to be defined, even if
unused, so backport relevant portions of upstream BASER_FVP patch into
the board suppport patch.

Issue-Id: SCM-4304
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I327e8aba3463f088bba40e83893c6f15beabb250
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |   2 +-
 ...ation-for-the-Arm-VExpress64-board-c.patch | 109 -----------
 ...dd-BASER_FVP-vexpress-board-variant.patch} |  99 +++++++---
 ...8-Add-ARMv8-MPU-configuration-logic.patch} |   4 +-
 ...tor-header-file-to-make-it-easier-to.patch | 172 ------------------
 ...ling-exception-vectors-on-non-SPL-b.patch} |  28 ++-
 ...Clean-up-BASE_FVP-boot-configuration.patch |  99 ----------
 ...v8-ARMV8_SWITCH_TO_EL1-improvements.patch} |  24 ++-
 ...e-OF_CONTROL-and-OF_BOARD-for-VExpre.patch | 110 -----------
 ...ing-HVC-configurable-when-switching.patch} |  24 ++-
 ...s64-Enable-VIRTIO_NET-network-driver.patch |  62 -------
 ...ress64-Do-not-set-COUNTER_FREQUENCY.patch} |   8 +-
 ...-Configure-memory-using-device-tree.patch} |  10 +-
 ...-LIBFDT_OVERLAY-in-the-vexpress_aem.patch} |  12 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  21 +--
 15 files changed, 148 insertions(+), 636 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0001-doc-Add-documentation-for-the-Arm-VExpress64-board-c.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0011-v=
express64-Add-BASER_FVP-vexpress-board-variant.patch =3D> 0001-vexpress64=
-Add-BASER_FVP-vexpress-board-variant.patch} (72%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0006-a=
rmv8-Add-ARMv8-MPU-configuration-logic.patch =3D> 0002-armv8-Add-ARMv8-MP=
U-configuration-logic.patch} (98%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0002-vexpress64-Refactor-header-file-to-make-it-easier-to.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0007-a=
rmv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch =3D> 0003-armv8=
-Allow-disabling-exception-vectors-on-non-SPL-b.patch} (80%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0003-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0008-a=
rmv8-ARMV8_SWITCH_TO_EL1-improvements.patch =3D> 0004-armv8-ARMV8_SWITCH_=
TO_EL1-improvements.patch} (87%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0004-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0009-a=
rmv8-Make-disabling-HVC-configurable-when-switching.patch =3D> 0005-armv8=
-Make-disabling-HVC-configurable-when-switching.patch} (74%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0005-vexpress64-Enable-VIRTIO_NET-network-driver.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0010-v=
express64-Do-not-set-COUNTER_FREQUENCY.patch =3D> 0006-vexpress64-Do-not-=
set-COUNTER_FREQUENCY.patch} (86%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0012-v=
express64-Configure-memory-using-device-tree.patch =3D> 0007-vexpress64-C=
onfigure-memory-using-device-tree.patch} (91%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0013-v=
express64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch =3D> 0008-vexpr=
ess64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch} (73%)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index d5e4685..c976d11 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -11,7 +11,7 @@ EXTRA_IMAGEDEPENDS +=3D "boot-wrapper-aarch64"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
 PREFERRED_VERSION_linux-yocto-rt ?=3D "5.15%"
-PREFERRED_VERSION_u-boot ?=3D "2022.01"
+PREFERRED_VERSION_u-boot ?=3D "2022.04"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
01-doc-Add-documentation-for-the-Arm-VExpress64-board-c.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-doc-Add-documentati=
on-for-the-Arm-VExpress64-board-c.patch
deleted file mode 100644
index 34656ba..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-doc-=
Add-documentation-for-the-Arm-VExpress64-board-c.patch
+++ /dev/null
@@ -1,109 +0,0 @@
-From 114c554aae2a4554eb3ce0bcb59b019a9ec3f6e6 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Tue, 19 Oct 2021 15:47:21 +0100
-Subject: [PATCH 01/11] doc: Add documentation for the Arm VExpress64 boa=
rd
- configs
-
-Create a new documentation section for Arm Ltd boards with a sub-page
-for the VExpress64 boards (FVP-A and Juno).
-
-Issue-Id: SCM-3533
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/6c2f16b3c95a0bb7f5d6f65512dceb0dc75ac00a]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: I9e6244e9c4949c0a60acb32216fb71e933af40ed
----
- doc/board/armltd/index.rst      |  9 ++++++
- doc/board/armltd/vexpress64.rst | 51 +++++++++++++++++++++++++++++++++
- doc/board/index.rst             |  1 +
- 3 files changed, 61 insertions(+)
- create mode 100644 doc/board/armltd/index.rst
- create mode 100644 doc/board/armltd/vexpress64.rst
-
-diff --git a/doc/board/armltd/index.rst b/doc/board/armltd/index.rst
-new file mode 100644
-index 0000000000..b6786c114f
---- /dev/null
-+++ b/doc/board/armltd/index.rst
-@@ -0,0 +1,9 @@
-+.. SPDX-License-Identifier: GPL-2.0+
-+
-+Arm Ltd
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+.. toctree::
-+   :maxdepth: 2
-+
-+   vexpress64.rst
-diff --git a/doc/board/armltd/vexpress64.rst b/doc/board/armltd/vexpress=
64.rst
-new file mode 100644
-index 0000000000..b98b096544
---- /dev/null
-+++ b/doc/board/armltd/vexpress64.rst
-@@ -0,0 +1,51 @@
-+.. SPDX-License-Identifier: GPL-2.0+
-+
-+Arm Versatile Express
-+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-+
-+The vexpress_* board configuration supports the following platforms:
-+
-+ * FVP_Base_RevC-2xAEMvA
-+ * Juno development board
-+
-+Fixed Virtual Platforms
-+-----------------------
-+
-+The Fixed Virtual Platforms (FVP) are complete simulations of an Arm sy=
stem,
-+including processor, memory and peripherals. They are set out in a "pro=
grammer's
-+view", which gives a comprehensive model on which to build and test sof=
tware.
-+
-+The supported FVPs are available free of charge and can be downloaded f=
rom the
-+Arm developer site [1]_ (user registration might be required).
-+
-+Supported features:
-+
-+ * GICv3
-+ * Generic timer
-+ * PL011 UART
-+
-+The default configuration assumes that U-Boot is bootstrapped using a s=
uitable
-+bootloader, such as Trusted Firmware-A [4]_. The u-boot binary can be p=
assed
-+into the TF-A build: ``make PLAT=3D<platform> all fip BL33=3Du-boot.bin=
``
-+
-+The FVPs can be debugged using Arm Development Studio [2]_.
-+
-+Juno
-+----
-+
-+Juno is an Arm development board with the following features:
-+
-+ * Arm Cortex-A72/A57 and Arm Cortex-A53 in a "big.LITTLE" configuratio=
n
-+ * A PCIe Gen2.0 bus with 4 lanes
-+ * 8GB of DRAM
-+ * GICv2
-+
-+More details can be found in the board documentation [3]_.
-+
-+References
-+----------
-+
-+.. [1] https://developer.arm.com/tools-and-software/simulation-models/f=
ixed-virtual-platforms
-+.. [2] https://developer.arm.com/tools-and-software/embedded/arm-develo=
pment-studio
-+.. [3] https://developer.arm.com/tools-and-software/development-boards/=
juno-development-board
-+.. [4] https://trustedfirmware-a.readthedocs.io/
-\ No newline at end of file
-diff --git a/doc/board/index.rst b/doc/board/index.rst
-index 13f4db848e..d0a7838550 100644
---- a/doc/board/index.rst
-+++ b/doc/board/index.rst
-@@ -11,6 +11,7 @@ Board-specific doc
-    AndesTech/index
-    amlogic/index
-    apple/index
-+   armltd/index
-    atmel/index
-    congatec/index
-    coreboot/index
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
11-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-vexpress64-Add-BASER_FVP=
-vexpress-board-variant.patch
similarity index 72%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/001=
1-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-=
vexpress64-Add-BASER_FVP-vexpress-board-variant.patch
index 8a99063..a147df6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0011-vexp=
ress64-Add-BASER_FVP-vexpress-board-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-vexp=
ress64-Add-BASER_FVP-vexpress-board-variant.patch
@@ -1,43 +1,55 @@
-From fa244330cf56b4f512d110015a666641f94605b9 Mon Sep 17 00:00:00 2001
+From d0c8aabf10fffc04f13ac2b01b413445717775de Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Mon, 24 May 2021 11:47:53 +0100
-Subject: [PATCH 11/11] vexpress64: Add BASER_FVP vexpress board variant
+Subject: [PATCH 1/8] vexpress64: Add BASER_FVP vexpress board variant
=20
-The BASER_FVP board variant is implemented on top of the BASE_FVP board
-config (which, in turn, is based on the Juno Versatile Express board
-config). They all share a similar memory map - for BASER_FVP the map is
-inverted from the BASE_FVP
-(https://developer.arm.com/documentation/100964/1114/Base-Platform/Base-=
--memory/BaseR-Platform-memory-map)
+The ARMv8-R64 architecture introduces optional VMSA (paging based MMU)
+support in the EL1/0 translation regime, which makes that part mostly
+compatible to ARMv8-A.
=20
- * Create new TARGET_VEXPRESS64_BASER_FVP target, which uses the same
-   board config as BASE_FVP and JUNO
+Add a new board variant to describe the "BASE-R64" FVP model, which
+inherits a lot from the existing v8-A FVP support. One major difference
+is that the memory map in "inverted": DRAM starts at 0x0, MMIO is at
+2GB [1].
+
+ * Create new TARGET_VEXPRESS64_BASER_FVP target, sharing most of the
+   exising configuration.
  * Implement inverted memory map in vexpress_aemv8.h
  * Create vexpress_aemv8r defconfig
- * Provide MPU and MMU memory maps for the BASER_FVP
- * Provide default value for LNX_KRNL_IMG_TEXT_OFFSET_BASE
+ * Provide an MMU memory map for the BASER_FVP
  * Update vexpress64 documentation
=20
+At the moment the boot-wrapper is the only supported secure firmware. As
+there is no official DT for the board yet, we rely on it being supplied
+by the boot-wrapper into U-Boot, so use OF_HAS_PRIOR_STAGE, and go with
+a dummy DT for now.
+
+[1] https://developer.arm.com/documentation/100964/1117/Base-Platform/Ba=
se---memory/BaseR-Platform-memory-map
+
 Issue-Id: SCM-3728
-Upstream-Status: Inappropriate [other]
-  Implementation pending further discussion
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/8d78a6b67467145f7e02295ca5d4944251dbc645]
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: Id173e52afad473abcf3f61c6bf374fc31f17edd3
+Signed-off-by: Andre Przywara <andre.przywara@arm.com>
 ---
  arch/arm/Kconfig                     |  8 +++++
+ arch/arm/dts/Makefile                |  1 +
+ arch/arm/dts/arm_fvp.dts             | 11 ++++++
  board/armltd/vexpress64/Kconfig      |  6 +++-
  board/armltd/vexpress64/MAINTAINERS  |  7 ++++
  board/armltd/vexpress64/vexpress64.c | 52 ++++++++++++++++++++++++++++
- configs/vexpress_aemv8r_defconfig    | 27 +++++++++++++++
+ configs/vexpress_aemv8r_defconfig    | 24 +++++++++++++
  doc/board/armltd/vexpress64.rst      |  1 +
  include/configs/vexpress_aemv8.h     | 42 ++++++++++++++++++++++
- 7 files changed, 142 insertions(+), 1 deletion(-)
+ 9 files changed, 151 insertions(+), 1 deletion(-)
+ create mode 100644 arch/arm/dts/arm_fvp.dts
  create mode 100644 configs/vexpress_aemv8r_defconfig
=20
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index f7f03837fe..5b3643889b 100644
+index 4567c183fb..75b752e773 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1234,6 +1234,14 @@ config TARGET_VEXPRESS64_BASE_FVP
+@@ -1250,6 +1250,14 @@ config TARGET_VEXPRESS64_BASE_FVP
  	select PL01X_SERIAL
  	select SEMIHOSTING
 =20
@@ -52,6 +64,36 @@ index f7f03837fe..5b3643889b 100644
  config TARGET_VEXPRESS64_JUNO
  	bool "Support Versatile Express Juno Development Platform"
  	select ARM64
+diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
+index 644ba961a2..a8b386eff0 100644
+--- a/arch/arm/dts/Makefile
++++ b/arch/arm/dts/Makefile
+@@ -1182,6 +1182,7 @@ dtb-$(CONFIG_TARGET_MX53PPD) +=3D imx53-ppd.dtb
+ # Kconfig option to build all of these. See examples above.
+ dtb-$(CONFIG_TARGET_VEXPRESS_CA9X4) +=3D vexpress-v2p-ca9.dtb
+ dtb-$(CONFIG_TARGET_VEXPRESS64_JUNO) +=3D juno-r2.dtb
++dtb-$(CONFIG_TARGET_VEXPRESS64_BASER_FVP) +=3D arm_fvp.dtb
+=20
+ dtb-$(CONFIG_TARGET_TOTAL_COMPUTE) +=3D total_compute.dtb
+=20
+diff --git a/arch/arm/dts/arm_fvp.dts b/arch/arm/dts/arm_fvp.dts
+new file mode 100644
+index 0000000000..6eb4415bda
+--- /dev/null
++++ b/arch/arm/dts/arm_fvp.dts
+@@ -0,0 +1,11 @@
++// SPDX-License-Identifier: GPL-2.0+ OR MIT
++/*
++ * Empty device tree for the Arm Ltd FVP platform model
++
++ * Copyright 2022 Arm Ltd.
++ */
++
++/dts-v1/;
++
++/ {
++};
+\ No newline at end of file
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
 index 4aab3f092e..e824173fe1 100644
 --- a/board/armltd/vexpress64/Kconfig
@@ -87,7 +129,7 @@ index 0ba044d7ff..e89d9711b8 100644
 +S:	Maintained
 +F:	configs/vexpress_aemv8r_defconfig
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 59a72588e0..270618a0ff 100644
+index 5e22e89824..aebf1d9466 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
 @@ -18,6 +18,7 @@
@@ -165,10 +207,10 @@ index 59a72588e0..270618a0ff 100644
 =20
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
 new file mode 100644
-index 0000000000..37c393b66f
+index 0000000000..6fa7c979f6
 --- /dev/null
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -0,0 +1,27 @@
+@@ -0,0 +1,24 @@
 +CONFIG_ARM=3Dy
 +CONFIG_TARGET_VEXPRESS64_BASER_FVP=3Dy
 +CONFIG_SYS_TEXT_BASE=3D0x00080000
@@ -176,6 +218,7 @@ index 0000000000..37c393b66f
 +CONFIG_SYS_LOAD_ADDR=3D0x10000000
 +CONFIG_SYS_MALLOC_F_LEN=3D0x2000
 +CONFIG_NR_DRAM_BANKS=3D2
++CONFIG_DEFAULT_DEVICE_TREE=3D"arm_fvp"
 +CONFIG_ENV_SIZE=3D0x40000
 +CONFIG_ENV_SECT_SIZE=3D0x40000
 +CONFIG_IDENT_STRING=3D" vexpress_aemv8r64"
@@ -183,7 +226,6 @@ index 0000000000..37c393b66f
 +CONFIG_BOOTDELAY=3D3
 +CONFIG_USE_BOOTARGS=3Dy
 +CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x9c090000 rootfs=
type=3Dext4 root=3D/dev/vda2 rw rootwait"
-+# CONFIG_USE_BOOTCOMMAND is not set
 +# CONFIG_DISPLAY_CPUINFO is not set
 +CONFIG_SYS_PROMPT=3D"VExpress64# "
 +CONFIG_DM_ETH=3Dy
@@ -192,12 +234,9 @@ index 0000000000..37c393b66f
 +CONFIG_VIRTIO_MMIO=3Dy
 +CONFIG_VIRTIO_BLK=3Dy
 +CONFIG_VIRTIO_NET=3Dy
-+CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
-+CONFIG_ARMV8_DISABLE_HVC=3Dn
-+CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
 +CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
 diff --git a/doc/board/armltd/vexpress64.rst b/doc/board/armltd/vexpress=
64.rst
-index b98b096544..b8efbc1565 100644
+index d87b1c38f5..a7f771d266 100644
 --- a/doc/board/armltd/vexpress64.rst
 +++ b/doc/board/armltd/vexpress64.rst
 @@ -6,6 +6,7 @@ Arm Versatile Express
@@ -209,10 +248,10 @@ index b98b096544..b8efbc1565 100644
 =20
  Fixed Virtual Platforms
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 76935f3173..a9086879c9 100644
+index f0c5ceb384..8050f42f8b 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
-@@ -22,8 +22,13 @@
+@@ -20,8 +20,13 @@
  #define CONFIG_SYS_BOOTM_LEN (64 << 20)      /* Increase max gunzip siz=
e */
 =20
  /* CS register bases for the original memory map. */
@@ -226,9 +265,9 @@ index 76935f3173..a9086879c9 100644
 =20
  #define V2M_PA_CS0			(V2M_PA_BASE + 0x00000000)
  #define V2M_PA_CS1			(V2M_PA_BASE + 0x14000000)
-@@ -211,6 +216,43 @@
- 				"fi"
- #endif
+@@ -188,6 +193,43 @@
+ 				"boot_name=3Dboot.img\0" \
+ 				"boot_addr_r=3D" __stringify(VEXPRESS_BOOT_ADDR) "\0"
 =20
 +#elif CONFIG_TARGET_VEXPRESS64_BASER_FVP
 +
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
06-armv8-Add-ARMv8-MPU-configuration-logic.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0002-armv8-Add-ARMv8-MPU-configuratio=
n-logic.patch
similarity index 98%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
6-armv8-Add-ARMv8-MPU-configuration-logic.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-=
armv8-Add-ARMv8-MPU-configuration-logic.patch
index 08cfa26..fbb9259 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
@@ -1,7 +1,7 @@
-From 313710181095d032921d9e4111bc4a575bf88147 Mon Sep 17 00:00:00 2001
+From 4d22ed70639c2d0c9c537efd549e563d4856305b Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 26 May 2021 17:41:10 +0100
-Subject: [PATCH 06/11] armv8: Add ARMv8 MPU configuration logic
+Subject: [PATCH 2/8] armv8: Add ARMv8 MPU configuration logic
=20
 Detect whether an MMU is present at the current exception level. If
 not, initialize the MPU instead of the MMU during init, and clear the
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
02-vexpress64-Refactor-header-file-to-make-it-easier-to.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexpress64-Refactor=
-header-file-to-make-it-easier-to.patch
deleted file mode 100644
index a251013..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexp=
ress64-Refactor-header-file-to-make-it-easier-to.patch
+++ /dev/null
@@ -1,172 +0,0 @@
-From f3a4efb6ca8780442d440ec9aeb8e2474e35aad6 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Tue, 19 Oct 2021 15:39:52 +0100
-Subject: [PATCH 02/11] vexpress64: Refactor header file to make it easie=
r to
- add new FVPs
-
-Rename from vexpress_aemv8a.h -> vepxress_aemv8.h as new FVPs may not be
-v8-A. No change in behavior.
-
-This is towards future work to enable support for the FVP_BaseR.
-
-Issue-Id: SCM-3537
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/17fe55fd6fe9d32270380f574b33ff0bc15bb47e]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: Ie992e69d1b51c6f8939b1bea22e35658e96df6c6
----
- board/armltd/vexpress64/Kconfig               |  2 +-
- doc/README.semihosting                        |  2 +-
- .../{vexpress_aemv8a.h =3D> vexpress_aemv8.h}   | 48 ++++++++++--------=
-
- 3 files changed, 27 insertions(+), 25 deletions(-)
- rename include/configs/{vexpress_aemv8a.h =3D> vexpress_aemv8.h} (88%)
-
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 1d13f542e6..4aab3f092e 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -7,7 +7,7 @@ config SYS_VENDOR
- 	default "armltd"
-=20
- config SYS_CONFIG_NAME
--	default "vexpress_aemv8a"
-+	default "vexpress_aemv8"
-=20
- config JUNO_DTB_PART
- 	string "NOR flash partition holding DTB"
-diff --git a/doc/README.semihosting b/doc/README.semihosting
-index c019999bed..f382d0131e 100644
---- a/doc/README.semihosting
-+++ b/doc/README.semihosting
-@@ -25,7 +25,7 @@ or turning on CONFIG_BASE_FVP for the more full featur=
ed model.
- Rather than create a new armv8 board similar to armltd/vexpress64, add
- semihosting calls to the existing one, enabled with CONFIG_SEMIHOSTING
- and CONFIG_BASE_FVP both set. Also reuse the existing board config file
--vexpress_aemv8a.h but differentiate the two models by the presence or
-+vexpress_aemv8.h but differentiate the two models by the presence or
- absence of CONFIG_BASE_FVP. This change is tested and works on both the
- Foundation and Base fastmodel simulators.
-=20
-diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpres=
s_aemv8.h
-similarity index 88%
-rename from include/configs/vexpress_aemv8a.h
-rename to include/configs/vexpress_aemv8.h
-index df22584d9a..49517a60b0 100644
---- a/include/configs/vexpress_aemv8a.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -4,36 +4,37 @@
-  *   configurations.
-  */
-=20
--#ifndef __VEXPRESS_AEMV8A_H
--#define __VEXPRESS_AEMV8A_H
-+#ifndef __VEXPRESS_AEMV8_H
-+#define __VEXPRESS_AEMV8_H
-=20
- #define CONFIG_REMAKE_ELF
-=20
- /* Link Definitions */
--#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
-+#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff=
0)
-+#else
- /* ATF loads u-boot here for BASE_FVP model */
- #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f0=
0000)
--#elif CONFIG_TARGET_VEXPRESS64_JUNO
--#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff=
0)
- #endif
-=20
- #define CONFIG_SYS_BOOTM_LEN (64 << 20)      /* Increase max gunzip siz=
e */
-=20
- /* CS register bases for the original memory map. */
--#define V2M_PA_CS0			0x00000000
--#define V2M_PA_CS1			0x14000000
--#define V2M_PA_CS2			0x18000000
--#define V2M_PA_CS3			0x1c000000
--#define V2M_PA_CS4			0x0c000000
--#define V2M_PA_CS5			0x10000000
-+#define V2M_BASE			0x80000000
-+#define V2M_PA_BASE			0x00000000
-+
-+#define V2M_PA_CS0			(V2M_PA_BASE + 0x00000000)
-+#define V2M_PA_CS1			(V2M_PA_BASE + 0x14000000)
-+#define V2M_PA_CS2			(V2M_PA_BASE + 0x18000000)
-+#define V2M_PA_CS3			(V2M_PA_BASE + 0x1c000000)
-+#define V2M_PA_CS4			(V2M_PA_BASE + 0x0c000000)
-+#define V2M_PA_CS5			(V2M_PA_BASE + 0x10000000)
-=20
- #define V2M_PERIPH_OFFSET(x)		(x << 16)
- #define V2M_SYSREGS			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(1))
- #define V2M_SYSCTL			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(2))
- #define V2M_SERIAL_BUS_PCI		(V2M_PA_CS3 + V2M_PERIPH_OFFSET(3))
-=20
--#define V2M_BASE			0x80000000
--
- /* Common peripherals relative to CS7. */
- #define V2M_AACI			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(4))
- #define V2M_MMCI			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(5))
-@@ -72,23 +73,23 @@
-=20
- /* Generic Interrupt Controller Definitions */
- #ifdef CONFIG_GICV3
--#define GICD_BASE			(0x2f000000)
--#define GICR_BASE			(0x2f100000)
-+#define GICD_BASE			(V2M_PA_BASE + 0x2f000000)
-+#define GICR_BASE			(V2M_PA_BASE + 0x2f100000)
- #else
-=20
--#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
--#define GICD_BASE			(0x2f000000)
--#define GICC_BASE			(0x2c000000)
--#elif CONFIG_TARGET_VEXPRESS64_JUNO
-+#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- #define GICD_BASE			(0x2C010000)
- #define GICC_BASE			(0x2C02f000)
-+#else
-+#define GICD_BASE			(V2M_PA_BASE + 0x2f000000)
-+#define GICC_BASE			(V2M_PA_BASE + 0x2c000000)
- #endif
- #endif /* !CONFIG_GICV3 */
-=20
- #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
- /* The Vexpress64 simulators use SMSC91C111 */
- #define CONFIG_SMC91111			1
--#define CONFIG_SMC91111_BASE		(0x01A000000)
-+#define CONFIG_SMC91111_BASE		(V2M_PA_BASE + 0x01A000000)
- #endif
-=20
- /* PL011 Serial Configuration */
-@@ -113,7 +114,7 @@
- #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- #define PHYS_SDRAM_2			(0x880000000)
- #define PHYS_SDRAM_2_SIZE		0x180000000
--#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS =3D=3D =
2
-+#elif CONFIG_NR_DRAM_BANKS =3D=3D 2
- #define PHYS_SDRAM_2			(0x880000000)
- #define PHYS_SDRAM_2_SIZE		0x80000000
- #endif
-@@ -200,6 +201,7 @@
- 				"  booti $kernel_addr - $fdt_addr; " \
- 				"fi"
- #endif
-+
- #endif
-=20
- /* Monitor Command Prompt */
-@@ -213,7 +215,7 @@
- /* Store environment at top of flash in the same location as blank.img =
*/
- /* in the Juno firmware. */
- #else
--#define CONFIG_SYS_FLASH_BASE		0x0C000000
-+#define CONFIG_SYS_FLASH_BASE		(V2M_PA_BASE + 0x0C000000)
- /* 256 x 256KiB sectors */
- #define CONFIG_SYS_MAX_FLASH_SECT	256
- /* Store environment at top of flash */
-@@ -230,4 +232,4 @@
- #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
- #define FLASH_MAX_SECTOR_SIZE		0x00040000
-=20
--#endif /* __VEXPRESS_AEMV8A_H */
-+#endif /* __VEXPRESS_AEMV8_H */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
07-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv8-Allow-disabli=
ng-exception-vectors-on-non-SPL-b.patch
similarity index 80%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
7-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-=
armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
index 4c567dc..0dbaaa8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
@@ -1,7 +1,7 @@
-From c4e6818cca29af0ca7faa87a4f5f1e9f06c5e482 Mon Sep 17 00:00:00 2001
+From 2edfe3f7c44028fccdc8f8c71461e8c5a0b0b14e Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 11:41:19 +0000
-Subject: [PATCH 07/11] armv8: Allow disabling exception vectors on non-S=
PL
+Subject: [PATCH 3/8] armv8: Allow disabling exception vectors on non-SPL
  builds
=20
 On the BASER_FVP, U-Boot shares EL2 with another bootloader, so we do
@@ -24,10 +24,11 @@ Change-Id: I0cf0fc6d7ef4d45791411cf1f67c65e198cc8b2b
  arch/arm/cpu/armv8/Makefile       |  6 ++----
  arch/arm/cpu/armv8/start.S        |  4 ++--
  arch/arm/mach-imx/imx8ulp/Kconfig |  2 +-
- 4 files changed, 13 insertions(+), 9 deletions(-)
+ configs/vexpress_aemv8r_defconfig |  1 +
+ 5 files changed, 14 insertions(+), 9 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 0a3fdfa471..7c4a56f707 100644
+index 9967376eca..6f9d0610e8 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -1,8 +1,8 @@
@@ -55,7 +56,7 @@ index 0a3fdfa471..7c4a56f707 100644
          bool "Enable multiple CPUs to enter into U-Boot"
 =20
 diff --git a/arch/arm/cpu/armv8/Makefile b/arch/arm/cpu/armv8/Makefile
-index d85ddde430..be2a4b126c 100644
+index 85fe0475c8..8b3f695835 100644
 --- a/arch/arm/cpu/armv8/Makefile
 +++ b/arch/arm/cpu/armv8/Makefile
 @@ -13,10 +13,8 @@ ifndef CONFIG_$(SPL_)SYS_DCACHE_OFF
@@ -72,11 +73,11 @@ index d85ddde430..be2a4b126c 100644
  endif
  obj-y	+=3D tlb.o
 diff --git a/arch/arm/cpu/armv8/start.S b/arch/arm/cpu/armv8/start.S
-index b3eef705a5..af70d0f6e7 100644
+index 91b00a46cc..d2fcae1e94 100644
 --- a/arch/arm/cpu/armv8/start.S
 +++ b/arch/arm/cpu/armv8/start.S
-@@ -108,7 +108,7 @@ pie_fixup_done:
- 	bl reset_sctrl
+@@ -104,7 +104,7 @@ pie_skip_reloc:
+ pie_fixup_done:
  #endif
 =20
 -#if defined(CONFIG_ARMV8_SPL_EXCEPTION_VECTORS) || !defined(CONFIG_SPL_=
BUILD)
@@ -84,7 +85,7 @@ index b3eef705a5..af70d0f6e7 100644
  .macro	set_vbar, regname, reg
  	msr	\regname, \reg
  .endm
-@@ -387,7 +387,7 @@ ENDPROC(smp_kick_all_cpus)
+@@ -350,7 +350,7 @@ ENDPROC(smp_kick_all_cpus)
  /*---------------------------------------------------------------------=
--*/
 =20
  ENTRY(c_runtime_cpu_setup)
@@ -106,6 +107,15 @@ index 963fc93d34..6255711f12 100644
 =20
  config SYS_SOC
  	default "imx8ulp"
+diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
+index 6fa7c979f6..402062cecf 100644
+--- a/configs/vexpress_aemv8r_defconfig
++++ b/configs/vexpress_aemv8r_defconfig
+@@ -22,3 +22,4 @@ CONFIG_VIRTIO_MMIO=3Dy
+ CONFIG_VIRTIO_BLK=3Dy
+ CONFIG_VIRTIO_NET=3Dy
+ CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
++CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
03-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-vexpress64-Clean-up-BASE=
_FVP-boot-configuration.patch
deleted file mode 100644
index 11c8d6b..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-vexp=
ress64-Clean-up-BASE_FVP-boot-configuration.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 7b44a11479a5548d14f790df4515bebd80efcdef Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Tue, 19 Oct 2021 16:34:25 +0100
-Subject: [PATCH 03/11] vexpress64: Clean up BASE_FVP boot configuration
-
-Move env var address values to #defines so they can be reused elsewhere.
-
-Rename env var names to those recommended in the README.
-
-Fix issue where fdt is called with invalid arguments when booting
-without a ramdisk.
-
-Issue-Id: SCM-3537
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/90f262a6951f530ec60bf78a681b117f625cbe3f]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: I2cd9a1245860302857b6ad6d738b8f7fc4d4d038
----
- include/configs/vexpress_aemv8.h | 50 ++++++++++++++++++++------------
- 1 file changed, 31 insertions(+), 19 deletions(-)
-
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 49517a60b0..897a7128bb 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -7,6 +7,8 @@
- #ifndef __VEXPRESS_AEMV8_H
- #define __VEXPRESS_AEMV8_H
-=20
-+#include <linux/stringify.h>
-+
- #define CONFIG_REMAKE_ELF
-=20
- /* Link Definitions */
-@@ -172,33 +174,43 @@
- 				BOOTENV
-=20
- #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+
-+#define VEXPRESS_KERNEL_ADDR	0x80080000
-+#define VEXPRESS_FDT_ADDR		0x8fc00000
-+#define VEXPRESS_BOOT_ADDR		0x8fd00000
-+#define VEXPRESS_RAMDISK_ADDR	0x8fe00000
-+
- #define CONFIG_EXTRA_ENV_SETTINGS	\
- 				"kernel_name=3DImage\0"		\
--				"kernel_addr=3D0x80080000\0"	\
--				"initrd_name=3Dramdisk.img\0"	\
--				"initrd_addr=3D0x88000000\0"	\
--				"fdtfile=3Ddevtree.dtb\0"		\
--				"fdt_addr=3D0x83000000\0"		\
--				"boot_name=3Dboot.img\0"		\
--				"boot_addr=3D0x8007f800\0"
-+				"kernel_addr_r=3D" __stringify(VEXPRESS_KERNEL_ADDR) "\0"	\
-+				"ramdisk_name=3Dramdisk.img\0"	\
-+				"ramdisk_addr_r=3D" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
-+				"fdtfile=3Ddevtree.dtb\0"	\
-+				"fdt_addr_r=3D" __stringify(VEXPRESS_FDT_ADDR) "\0"	\
-+				"boot_name=3Dboot.img\0" \
-+				"boot_addr_r=3D" __stringify(VEXPRESS_BOOT_ADDR) "\0"
-=20
- #ifndef CONFIG_BOOTCOMMAND
--#define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then =
" \
-+#define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr_r}; the=
n " \
- 				"  set bootargs; " \
--				"  abootimg addr ${boot_addr}; " \
--				"  abootimg get dtb --index=3D0 fdt_addr; " \
--				"  bootm ${boot_addr} ${boot_addr} " \
--				"  ${fdt_addr}; " \
-+				"  abootimg addr ${boot_addr_r}; " \
-+				"  abootimg get dtb --index=3D0 fdt_addr_r; " \
-+				"  bootm ${boot_addr_r} ${boot_addr_r} " \
-+				"  ${fdt_addr_r}; " \
- 				"else; " \
- 				"  set fdt_high 0xffffffffffffffff; " \
- 				"  set initrd_high 0xffffffffffffffff; " \
--				"  smhload ${kernel_name} ${kernel_addr}; " \
--				"  smhload ${fdtfile} ${fdt_addr}; " \
--				"  smhload ${initrd_name} ${initrd_addr} "\
--				"  initrd_end; " \
--				"  fdt addr ${fdt_addr}; fdt resize; " \
--				"  fdt chosen ${initrd_addr} ${initrd_end}; " \
--				"  booti $kernel_addr - $fdt_addr; " \
-+				"  smhload ${kernel_name} ${kernel_addr_r}; " \
-+				"  smhload ${fdtfile} ${fdt_addr_r}; " \
-+				"  smhload ${ramdisk_name} ${ramdisk_addr_r} "\
-+				"  ramdisk_end; " \
-+				"  fdt addr ${fdt_addr_r}; fdt resize; " \
-+				"  if test -n ${ramdisk_end}; then "\
-+				"    fdt chosen ${ramdisk_addr_r} ${ramdisk_end}; " \
-+				"  else; " \
-+				"    fdt chosen; " \
-+				"  fi; " \
-+				"  booti $kernel_addr_r - $fdt_addr_r; " \
- 				"fi"
- #endif
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
08-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv8-ARMV8_SWITCH_TO_EL1-improve=
ments.patch
similarity index 87%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
8-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-=
armv8-ARMV8_SWITCH_TO_EL1-improvements.patch
index 8cbd1f8..6df655c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
@@ -1,7 +1,7 @@
-From 754c5109286e31741952309cb4e8438192511a3b Mon Sep 17 00:00:00 2001
+From 02054cf03be7a8b657543cc7a0e2f4abadacbee1 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 14 Jul 2021 12:44:27 +0100
-Subject: [PATCH 08/11] armv8: ARMV8_SWITCH_TO_EL1 improvements
+Subject: [PATCH 4/8] armv8: ARMV8_SWITCH_TO_EL1 improvements
=20
 Convert CONFIG_ARMV8_SWITCH_TO_EL1 to a Kconfig variable.
=20
@@ -20,11 +20,12 @@ Change-Id: If98478148d6d8d1f732acac5439276700614815f
  arch/arm/cpu/armv8/Kconfig           |  8 +++++++
  arch/arm/cpu/armv8/exception_level.c | 21 ++++++++++++++--
  arch/arm/lib/bootm.c                 | 36 ++++++++++++++++------------
+ configs/vexpress_aemv8r_defconfig    |  1 +
  scripts/config_whitelist.txt         |  1 -
- 4 files changed, 48 insertions(+), 18 deletions(-)
+ 5 files changed, 49 insertions(+), 18 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index bd595095ab..d7de36acfe 100644
+index 6f9d0610e8..b50ce60097 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -177,4 +177,12 @@ config ARMV8_SECURE_BASE
@@ -146,18 +147,27 @@ index a59a5e6c0e..e2cf2e6ec4 100644
  	}
  #else
  	unsigned long machid =3D gd->bd->bi_arch_number;
+diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
+index 402062cecf..dff1836da2 100644
+--- a/configs/vexpress_aemv8r_defconfig
++++ b/configs/vexpress_aemv8r_defconfig
+@@ -23,3 +23,4 @@ CONFIG_VIRTIO_BLK=3Dy
+ CONFIG_VIRTIO_NET=3Dy
+ CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+ CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
++CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index b9c1c61e13..e6b5627447 100644
+index a6bc234f51..a0dd5074aa 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -21,7 +21,6 @@ CONFIG_ARC_MMU_VER
+@@ -7,7 +7,6 @@ CONFIG_AM335X_USB1_MODE
  CONFIG_ARMV7_SECURE_BASE
  CONFIG_ARMV7_SECURE_MAX_SIZE
  CONFIG_ARMV7_SECURE_RESERVE_SIZE
 -CONFIG_ARMV8_SWITCH_TO_EL1
  CONFIG_ARM_GIC_BASE_ADDRESS
  CONFIG_ARP_TIMEOUT
- CONFIG_AT91C_PQFP_UHPBUG
+ CONFIG_AT91SAM9260EK
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
04-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-vexpress64-Enable-O=
F_CONTROL-and-OF_BOARD-for-VExpre.patch
deleted file mode 100644
index fa07a45..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-vexp=
ress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From e709f0e8ffe76ecab9a50ce39338fe38cc9d920f Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Mon, 4 Oct 2021 14:03:35 +0100
-Subject: [PATCH 04/11] vexpress64: Enable OF_CONTROL and OF_BOARD for
- VExpress64
-
-Capture x0 in lowlevel_init.S as potential fdt address. Modify
-board_fdt_blob_setup to use fdt address from either vexpress_aemv8.h
-or lowlevel_init.S.
-
-Issue-Id: SCM-3534
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/2661397464e47d45cd25bbc5e6b9de7594b3268d]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: If60e2fbcbda23613f591752ddfabe66fb44623c5
----
- board/armltd/vexpress64/Makefile        |  5 +++++
- board/armltd/vexpress64/lowlevel_init.S | 12 +++++++++++
- board/armltd/vexpress64/vexpress64.c    | 27 +++++++++++++++++++++++++
- 3 files changed, 44 insertions(+)
- create mode 100644 board/armltd/vexpress64/lowlevel_init.S
-
-diff --git a/board/armltd/vexpress64/Makefile b/board/armltd/vexpress64/=
Makefile
-index 868dc4f629..5703e75967 100644
---- a/board/armltd/vexpress64/Makefile
-+++ b/board/armltd/vexpress64/Makefile
-@@ -5,3 +5,8 @@
-=20
- obj-y	:=3D vexpress64.o
- obj-$(CONFIG_TARGET_VEXPRESS64_JUNO)	+=3D pcie.o
-+ifdef CONFIG_OF_BOARD
-+ifndef CONFIG_TARGET_VEXPRESS64_JUNO
-+obj-y +=3D lowlevel_init.o
-+endif
-+endif
-diff --git a/board/armltd/vexpress64/lowlevel_init.S b/board/armltd/vexp=
ress64/lowlevel_init.S
-new file mode 100644
-index 0000000000..3dcfb85d0e
---- /dev/null
-+++ b/board/armltd/vexpress64/lowlevel_init.S
-@@ -0,0 +1,12 @@
-+/* SPDX-License-Identifier: GPL-2.0 */
-+/*
-+ * (C) Copyright 2021 Arm Limited
-+ */
-+
-+.global save_boot_params
-+save_boot_params:
-+
-+	adr	x8, prior_stage_fdt_address
-+	str	x0, [x8]
-+
-+	b	save_boot_params_ret
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index d2f307cca5..9a4d97afad 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -85,7 +85,15 @@ int dram_init_banksize(void)
- 	return 0;
- }
-=20
-+/* Assigned in lowlevel_init.S
-+ * Push the variable into the .data section so that it
-+ * does not get cleared later.
-+ */
-+unsigned long __section(".data") prior_stage_fdt_address;
-+
- #ifdef CONFIG_OF_BOARD
-+
-+#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- #define JUNO_FLASH_SEC_SIZE	(256 * 1024)
- static phys_addr_t find_dtb_in_nor_flash(const char *partname)
- {
-@@ -131,8 +139,11 @@ static phys_addr_t find_dtb_in_nor_flash(const char=
 *partname)
- 	return ~0;
- }
-=20
-+#endif
-+
- void *board_fdt_blob_setup(int *err)
- {
-+#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- 	phys_addr_t fdt_rom_addr =3D find_dtb_in_nor_flash(CONFIG_JUNO_DTB_PAR=
T);
-=20
- 	*err =3D 0;
-@@ -142,6 +153,22 @@ void *board_fdt_blob_setup(int *err)
- 	}
-=20
- 	return (void *)fdt_rom_addr;
-+#endif
-+
-+#ifdef VEXPRESS_FDT_ADDR
-+	if (fdt_magic(VEXPRESS_FDT_ADDR) =3D=3D FDT_MAGIC) {
-+		*err =3D 0;
-+		return (void *)VEXPRESS_FDT_ADDR;
-+	}
-+#endif
-+
-+	if (fdt_magic(prior_stage_fdt_address) =3D=3D FDT_MAGIC) {
-+		*err =3D 0;
-+		return (void *)prior_stage_fdt_address;
-+	}
-+
-+	*err =3D -ENXIO;
-+	return NULL;
- }
- #endif
-=20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
09-armv8-Make-disabling-HVC-configurable-when-switching.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv8-Make-disablin=
g-HVC-configurable-when-switching.patch
similarity index 74%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
9-armv8-Make-disabling-HVC-configurable-when-switching.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-=
armv8-Make-disabling-HVC-configurable-when-switching.patch
index f1d35d5..bf88cba 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
@@ -1,8 +1,8 @@
-From 6d8d8b3018bacc5b578ff567b2e20e6ec4abcd6c Mon Sep 17 00:00:00 2001
+From 995a9daf6fd1e6375d2492cb821d24481141731b Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 16:37:26 +0000
-Subject: [PATCH 09/11] armv8: Make disabling HVC configurable when switc=
hing
- to EL1
+Subject: [PATCH 5/8] armv8: Make disabling HVC configurable when switchi=
ng to
+ EL1
=20
 On the BASER_FVP there is no EL3, so HVC is used to provide PSCI
 services. Therefore we cannot disable hypercalls.
@@ -16,12 +16,13 @@ Upstream-Status: Inappropriate [other]
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I463d82f1db8a3cafcab40a9c0c208753569cc300
 ---
- arch/arm/cpu/armv8/Kconfig   |  9 +++++++++
- arch/arm/include/asm/macro.h | 10 ++++++++--
- 2 files changed, 17 insertions(+), 2 deletions(-)
+ arch/arm/cpu/armv8/Kconfig        |  9 +++++++++
+ arch/arm/include/asm/macro.h      | 10 ++++++++--
+ configs/vexpress_aemv8r_defconfig |  1 +
+ 3 files changed, 18 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index d7de36acfe..704ed2b3d3 100644
+index b50ce60097..90e28f4e36 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -185,4 +185,13 @@ config ARMV8_SWITCH_TO_EL1
@@ -68,6 +69,15 @@ index ec0171e0e6..6d267cbae2 100644
  	msr	hcr_el2, \tmp
 =20
  	/* Return to AArch32 Supervisor mode from EL2 */
+diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
+index dff1836da2..a1522c48b5 100644
+--- a/configs/vexpress_aemv8r_defconfig
++++ b/configs/vexpress_aemv8r_defconfig
+@@ -24,3 +24,4 @@ CONFIG_VIRTIO_NET=3Dy
+ CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+ CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
+ CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
++CONFIG_ARMV8_DISABLE_HVC=3Dn
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
05-vexpress64-Enable-VIRTIO_NET-network-driver.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-vexpress64-Enable-VIRTIO_NET=
-network-driver.patch
deleted file mode 100644
index ad76f26..0000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-vexp=
ress64-Enable-VIRTIO_NET-network-driver.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From 1cf5f028ff96ee4f39921104492d87e58995d180 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Mon, 11 Oct 2021 11:57:26 +0100
-Subject: [PATCH 05/11] vexpress64: Enable VIRTIO_NET network driver
-
-The SMSC driver is using the old driver model.
-
-Init the virtio system in vexpress64.c so that the network device is
-discovered.
-
-Issue-Id: SCM-3534
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/439581dca4c786dbbdd2d6be024e0b907a3b0c80]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: I1b7d9eb142bf02dd88e99bcd7e44789a154885dd
----
- board/armltd/vexpress64/vexpress64.c | 7 +++++++
- include/configs/vexpress_aemv8.h     | 4 ++--
- 2 files changed, 9 insertions(+), 2 deletions(-)
-
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 9a4d97afad..59a72588e0 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -18,6 +18,10 @@
- #include <dm/platform_data/serial_pl01x.h>
- #include "pcie.h"
- #include <asm/armv8/mmu.h>
-+#ifdef CONFIG_VIRTIO_NET
-+#include <virtio_types.h>
-+#include <virtio.h>
-+#endif
-=20
- DECLARE_GLOBAL_DATA_PTR;
-=20
-@@ -64,6 +68,9 @@ __weak void vexpress64_pcie_init(void)
- int board_init(void)
- {
- 	vexpress64_pcie_init();
-+#ifdef CONFIG_VIRTIO_NET
-+	virtio_init();
-+#endif
- 	return 0;
- }
-=20
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 897a7128bb..ef271ea89b 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -88,8 +88,8 @@
- #endif
- #endif /* !CONFIG_GICV3 */
-=20
--#ifndef CONFIG_TARGET_VEXPRESS64_JUNO
--/* The Vexpress64 simulators use SMSC91C111 */
-+#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) && !defined(CONFIG_DM_ET=
H)
-+/* The Vexpress64 BASE_FVP simulator uses SMSC91C111 */
- #define CONFIG_SMC91111			1
- #define CONFIG_SMC91111_BASE		(V2M_PA_BASE + 0x01A000000)
- #endif
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
10-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexpress64-Do-not-set-COUNTER_FR=
EQUENCY.patch
similarity index 86%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/001=
0-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-=
vexpress64-Do-not-set-COUNTER_FREQUENCY.patch
index e63b28d..639d389 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0010-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
@@ -1,7 +1,7 @@
-From 511f1b1a8534da8f4947561a70d0fbe9cea5b84c Mon Sep 17 00:00:00 2001
+From d7c03f8d297faa641e267c69e83e3582a524af50 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 15:09:09 +0000
-Subject: [PATCH 10/11] vexpress64: Do not set COUNTER_FREQUENCY
+Subject: [PATCH 6/8] vexpress64: Do not set COUNTER_FREQUENCY
=20
 VExpress boards normally run as a second-stage bootloader so should not
 need to modify CNTFRQ_EL0. On the BASER_FVP, U-Boot can modify it if
@@ -19,10 +19,10 @@ Change-Id: I137473d721e58e4c348b9641f5b9778178d3bb65
  1 file changed, 3 deletions(-)
=20
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index ef271ea89b..76935f3173 100644
+index 8050f42f8b..dbf6f04230 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
-@@ -70,9 +70,6 @@
+@@ -73,9 +73,6 @@
  #define V2M_SYS_CFGCTRL			(V2M_SYSREGS + 0x0a4)
  #define V2M_SYS_CFGSTAT			(V2M_SYSREGS + 0x0a8)
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
12-vexpress64-Configure-memory-using-device-tree.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexpress64-Configure-memor=
y-using-device-tree.patch
similarity index 91%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/001=
2-vexpress64-Configure-memory-using-device-tree.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-=
vexpress64-Configure-memory-using-device-tree.patch
index f9b422a..5fb6fb1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0012-vexp=
ress64-Configure-memory-using-device-tree.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Configure-memory-using-device-tree.patch
@@ -1,7 +1,7 @@
-From 90db3d923adcade13d9a8aa50305e5c9c32737af Mon Sep 17 00:00:00 2001
+From 11a86f5a8c63b4b42dd976ab66c9abfaa4dce1cc Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Thu, 17 Feb 2022 17:02:34 +0000
-Subject: [PATCH 1/2] vexpress64: Configure memory using device tree
+Subject: [PATCH 7/8] vexpress64: Configure memory using device tree
=20
 The memory size and memory banks were previously configured statically,
 using #defines in the vexpress header file, which could conflict with
@@ -20,7 +20,7 @@ Change-Id: I4add8258cb99dac87f078435272410b562b6fdc7
  2 files changed, 2 insertions(+), 29 deletions(-)
=20
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 270618a0ff..3f1ac04bac 100644
+index aebf1d9466..84a7810775 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
 @@ -24,8 +24,6 @@
@@ -56,10 +56,10 @@ index 270618a0ff..3f1ac04bac 100644
 =20
  /* Assigned in lowlevel_init.S
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index a9086879c9..15a1ae60bf 100644
+index dbf6f04230..85a9fcc198 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
-@@ -106,23 +106,6 @@
+@@ -104,23 +104,6 @@
  /* BOOTP options */
  #define CONFIG_BOOTP_BOOTFILESIZE
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
13-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-vexpress64-Enable-L=
IBFDT_OVERLAY-in-the-vexpress_aem.patch
similarity index 73%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/001=
3-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-=
vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
index 2824acc..dbc3332 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0013-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
@@ -1,7 +1,7 @@
-From 0ca75ef2a29f8b37f356af005dac3c83c9b50e2a Mon Sep 17 00:00:00 2001
+From 6a97b1bcb49f87c9495311e657b90ef6b73ce6c5 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Tue, 22 Feb 2022 15:32:51 +0000
-Subject: [PATCH 2/2] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
+Subject: [PATCH 8/8] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
  defconfig
=20
 Issue-Id: SCM-3874
@@ -14,13 +14,13 @@ Change-Id: Ide0532cf2de89f1bca9c8d4bd2ed0c1a1c57599f
  1 file changed, 1 insertion(+)
=20
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 37c393b66f..aff34e86b0 100644
+index a1522c48b5..98b0f5ad53 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -25,3 +25,4 @@ CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
- CONFIG_ARMV8_DISABLE_HVC=3Dn
+@@ -25,3 +25,4 @@ CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
- CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+ CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
+ CONFIG_ARMV8_DISABLE_HVC=3Dn
 +CONFIG_OF_LIBFDT_OVERLAY=3Dy
 --=20
 2.25.1
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 7155226..91f794c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -60,19 +60,14 @@ SRC_URI:append:fvp-base-arm32 =3D " file://0001-Add-v=
express_aemv8a_aarch32-varian
 # FVP BASER
 #
 SRC_URI:append:fvp-baser-aemv8r64 =3D " \
-    file://0001-doc-Add-documentation-for-the-Arm-VExpress64-board-c.pat=
ch \
-    file://0002-vexpress64-Refactor-header-file-to-make-it-easier-to.pat=
ch \
-    file://0003-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch \
-    file://0004-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.pat=
ch \
-    file://0005-vexpress64-Enable-VIRTIO_NET-network-driver.patch \
-    file://0006-armv8-Add-ARMv8-MPU-configuration-logic.patch \
-    file://0007-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.pat=
ch \
-    file://0008-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch \
-    file://0009-armv8-Make-disabling-HVC-configurable-when-switching.pat=
ch \
-    file://0010-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch \
-    file://0011-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
-    file://0012-vexpress64-Configure-memory-using-device-tree.patch \
-    file://0013-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.pat=
ch \
+    file://0001-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
+    file://0002-armv8-Add-ARMv8-MPU-configuration-logic.patch \
+    file://0003-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.pat=
ch \
+    file://0004-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch \
+    file://0005-armv8-Make-disabling-HVC-configurable-when-switching.pat=
ch \
+    file://0006-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch \
+    file://0007-vexpress64-Configure-memory-using-device-tree.patch \
+    file://0008-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.pat=
ch \
     "
=20
 #
--=20
2.25.1


