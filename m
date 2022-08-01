Return-Path: <qi.feng@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58A4AC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:18:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22147.1659341929770151108
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 01 Aug 2022 01:18:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: qi.feng@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE7C31515;
	Mon,  1 Aug 2022 01:18:49 -0700 (PDT)
Received: from a015967.shanghai.arm.com (a015967.shanghai.arm.com
 [10.169.190.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B1FEE3F67D;
	Mon,  1 Aug 2022 01:18:46 -0700 (PDT)
From: Qi Feng <qi.feng@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Diego.Sueiro@arm.com,
	Peter.Hoyes@arm.com,
	robbie.cao@arm.com,
	nd@arm.com,
	Qi Feng <qi.feng@arm.com>
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64: Rebase u-boot patches onto
 v2022.07
Date: Mon,  1 Aug 2022 16:18:39 +0800
Message-Id: <20220801081839.3652130-1-qi.feng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 01 Aug 2022 08:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3630

- 0001-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch

  Change to 0002-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch.
  Only MPU memory map is preserved, other parts have been upstreamed.

- 0007-vexpress64-Configure-memory-using-device-tree.patch

  Deleted. Upstreamed in commit 1a1143a45457161e90ea4cd5f3b0561d924ed8fe

Signed-off-by: Qi Feng <qi.feng@arm.com>
Issue-Id: SCM-5030
Change-Id: I4aab3bab545e64e3a4a3a3fd67bcef79acdc41be
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |   2 +-
 ...8-Add-ARMv8-MPU-configuration-logic.patch} |  16 +-
 ...Add-BASER_FVP-vexpress-board-variant.patch | 314 ------------------
 ...add-MPU-memory-map-for-the-BASER_FVP.patch |  61 ++++
 ...bling-exception-vectors-on-non-SPL-b.patch |  36 +-
 ...mv8-ARMV8_SWITCH_TO_EL1-improvements.patch |  35 +-
 ...ling-HVC-configurable-when-switching.patch |  20 +-
 ...press64-Do-not-set-COUNTER_FREQUENCY.patch |  39 +--
 ...4-Configure-memory-using-device-tree.patch |  88 -----
 ...-LIBFDT_OVERLAY-in-the-vexpress_aem.patch} |   8 +-
 ...BAR-MPU-attributes-to-be-configured.patch} |  56 ++--
 ...he-when-switching-exception-levels-.patch} |   4 +-
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  11 +-
 13 files changed, 158 insertions(+), 532 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0002-a=
rmv8-Add-ARMv8-MPU-configuration-logic.patch =3D> 0001-armv8-Add-ARMv8-MP=
U-configuration-logic.patch} (94%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0001-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0002-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0007-vexpress64-Configure-memory-using-device-tree.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0008-v=
express64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch =3D> 0007-vexpr=
ess64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch} (76%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0009-a=
rmv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch =3D> 0008-armv8-Al=
low-PRBAR-MPU-attributes-to-be-configured.patch} (69%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/{0010-a=
rmv8-Enable-icache-when-switching-exception-levels-.patch =3D> 0009-armv8=
-Enable-icache-when-switching-exception-levels-.patch} (94%)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 9c800591..8119cb68 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -11,7 +11,7 @@ EXTRA_IMAGEDEPENDS +=3D "boot-wrapper-aarch64"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
 PREFERRED_VERSION_linux-yocto ?=3D "5.15%"
 PREFERRED_VERSION_linux-yocto-rt ?=3D "5.15%"
-PREFERRED_VERSION_u-boot ?=3D "2022.04"
+PREFERRED_VERSION_u-boot ?=3D "2022.07"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
02-armv8-Add-ARMv8-MPU-configuration-logic.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv8-Add-ARMv8-MPU-configuratio=
n-logic.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
2-armv8-Add-ARMv8-MPU-configuration-logic.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-=
armv8-Add-ARMv8-MPU-configuration-logic.patch
index fbb9259c..dd6b77d3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
@@ -1,7 +1,7 @@
-From 4d22ed70639c2d0c9c537efd549e563d4856305b Mon Sep 17 00:00:00 2001
+From e90aa7853ae32cb03c86249a6c572ec88cdebaa2 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 26 May 2021 17:41:10 +0100
-Subject: [PATCH 2/8] armv8: Add ARMv8 MPU configuration logic
+Subject: [PATCH 1/9] armv8: Add ARMv8 MPU configuration logic
=20
 Detect whether an MMU is present at the current exception level. If
 not, initialize the MPU instead of the MMU during init, and clear the
@@ -27,7 +27,7 @@ Change-Id: I0ee3879f9d7f03fe940664b3551c68eeaa458d17
  create mode 100644 arch/arm/include/asm/armv8/mpu.h
=20
 diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
-index 3de18c7675..f6e0ad0075 100644
+index e4736e5643..798aed8058 100644
 --- a/arch/arm/cpu/armv8/cache_v8.c
 +++ b/arch/arm/cpu/armv8/cache_v8.c
 @@ -15,6 +15,7 @@
@@ -38,7 +38,7 @@ index 3de18c7675..f6e0ad0075 100644
 =20
  DECLARE_GLOBAL_DATA_PTR;
 =20
-@@ -365,6 +366,91 @@ __weak u64 get_page_table_size(void)
+@@ -385,6 +386,91 @@ __weak u64 get_page_table_size(void)
  	return size;
  }
 =20
@@ -130,7 +130,7 @@ index 3de18c7675..f6e0ad0075 100644
  void setup_pgtables(void)
  {
  	int i;
-@@ -479,8 +565,13 @@ void dcache_enable(void)
+@@ -499,8 +585,13 @@ void dcache_enable(void)
  	/* The data cache is not active unless the mmu is enabled */
  	if (!(get_sctlr() & CR_M)) {
  		invalidate_dcache_all();
@@ -146,7 +146,7 @@ index 3de18c7675..f6e0ad0075 100644
  	}
 =20
  	set_sctlr(get_sctlr() | CR_C);
-@@ -499,7 +590,11 @@ void dcache_disable(void)
+@@ -519,7 +610,11 @@ void dcache_disable(void)
  	set_sctlr(sctlr & ~(CR_C|CR_M));
 =20
  	flush_dcache_all();
@@ -225,10 +225,10 @@ index 0000000000..8de627cafd
 +
 +#endif /* _ASM_ARMV8_MPU_H_ */
 diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
-index f75eea16b3..e4f5b4e4bc 100644
+index 87d1c77e8b..4510db98a2 100644
 --- a/arch/arm/include/asm/system.h
 +++ b/arch/arm/include/asm/system.h
-@@ -94,6 +94,25 @@
+@@ -95,6 +95,25 @@
  				               auth algorithm                 */
  #define ID_AA64ISAR1_EL1_APA	(0xF << 4)  /* QARMA address auth algorith=
m   */
 =20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
01-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-vexpress64-Add-BASER_FVP=
-vexpress-board-variant.patch
deleted file mode 100644
index a147df66..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-vexp=
ress64-Add-BASER_FVP-vexpress-board-variant.patch
+++ /dev/null
@@ -1,314 +0,0 @@
-From d0c8aabf10fffc04f13ac2b01b413445717775de Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Mon, 24 May 2021 11:47:53 +0100
-Subject: [PATCH 1/8] vexpress64: Add BASER_FVP vexpress board variant
-
-The ARMv8-R64 architecture introduces optional VMSA (paging based MMU)
-support in the EL1/0 translation regime, which makes that part mostly
-compatible to ARMv8-A.
-
-Add a new board variant to describe the "BASE-R64" FVP model, which
-inherits a lot from the existing v8-A FVP support. One major difference
-is that the memory map in "inverted": DRAM starts at 0x0, MMIO is at
-2GB [1].
-
- * Create new TARGET_VEXPRESS64_BASER_FVP target, sharing most of the
-   exising configuration.
- * Implement inverted memory map in vexpress_aemv8.h
- * Create vexpress_aemv8r defconfig
- * Provide an MMU memory map for the BASER_FVP
- * Update vexpress64 documentation
-
-At the moment the boot-wrapper is the only supported secure firmware. As
-there is no official DT for the board yet, we rely on it being supplied
-by the boot-wrapper into U-Boot, so use OF_HAS_PRIOR_STAGE, and go with
-a dummy DT for now.
-
-[1] https://developer.arm.com/documentation/100964/1117/Base-Platform/Ba=
se---memory/BaseR-Platform-memory-map
-
-Issue-Id: SCM-3728
-Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/8d78a6b67467145f7e02295ca5d4944251dbc645]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: Id173e52afad473abcf3f61c6bf374fc31f17edd3
-Signed-off-by: Andre Przywara <andre.przywara@arm.com>
----
- arch/arm/Kconfig                     |  8 +++++
- arch/arm/dts/Makefile                |  1 +
- arch/arm/dts/arm_fvp.dts             | 11 ++++++
- board/armltd/vexpress64/Kconfig      |  6 +++-
- board/armltd/vexpress64/MAINTAINERS  |  7 ++++
- board/armltd/vexpress64/vexpress64.c | 52 ++++++++++++++++++++++++++++
- configs/vexpress_aemv8r_defconfig    | 24 +++++++++++++
- doc/board/armltd/vexpress64.rst      |  1 +
- include/configs/vexpress_aemv8.h     | 42 ++++++++++++++++++++++
- 9 files changed, 151 insertions(+), 1 deletion(-)
- create mode 100644 arch/arm/dts/arm_fvp.dts
- create mode 100644 configs/vexpress_aemv8r_defconfig
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 4567c183fb..75b752e773 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1250,6 +1250,14 @@ config TARGET_VEXPRESS64_BASE_FVP
- 	select PL01X_SERIAL
- 	select SEMIHOSTING
-=20
-+config TARGET_VEXPRESS64_BASER_FVP
-+	bool "Support Versatile Express ARMv8r64 FVP BASE model"
-+	select ARM64
-+	select DM
-+	select DM_SERIAL
-+	select PL01X_SERIAL
-+	select LINUX_KERNEL_IMAGE_HEADER
-+
- config TARGET_VEXPRESS64_JUNO
- 	bool "Support Versatile Express Juno Development Platform"
- 	select ARM64
-diff --git a/arch/arm/dts/Makefile b/arch/arm/dts/Makefile
-index 644ba961a2..a8b386eff0 100644
---- a/arch/arm/dts/Makefile
-+++ b/arch/arm/dts/Makefile
-@@ -1182,6 +1182,7 @@ dtb-$(CONFIG_TARGET_MX53PPD) +=3D imx53-ppd.dtb
- # Kconfig option to build all of these. See examples above.
- dtb-$(CONFIG_TARGET_VEXPRESS_CA9X4) +=3D vexpress-v2p-ca9.dtb
- dtb-$(CONFIG_TARGET_VEXPRESS64_JUNO) +=3D juno-r2.dtb
-+dtb-$(CONFIG_TARGET_VEXPRESS64_BASER_FVP) +=3D arm_fvp.dtb
-=20
- dtb-$(CONFIG_TARGET_TOTAL_COMPUTE) +=3D total_compute.dtb
-=20
-diff --git a/arch/arm/dts/arm_fvp.dts b/arch/arm/dts/arm_fvp.dts
-new file mode 100644
-index 0000000000..6eb4415bda
---- /dev/null
-+++ b/arch/arm/dts/arm_fvp.dts
-@@ -0,0 +1,11 @@
-+// SPDX-License-Identifier: GPL-2.0+ OR MIT
-+/*
-+ * Empty device tree for the Arm Ltd FVP platform model
-+
-+ * Copyright 2022 Arm Ltd.
-+ */
-+
-+/dts-v1/;
-+
-+/ {
-+};
-\ No newline at end of file
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 4aab3f092e..e824173fe1 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -1,4 +1,5 @@
--if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
-+if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || \
-+	TARGET_VEXPRESS64_BASER_FVP
-=20
- config SYS_BOARD
- 	default "vexpress64"
-@@ -16,4 +17,7 @@ config JUNO_DTB_PART
- 	  The ARM partition name in the NOR flash memory holding the
- 	  device tree blob to configure U-Boot.
-=20
-+config LNX_KRNL_IMG_TEXT_OFFSET_BASE
-+    default 0x0
-+
- endif
-diff --git a/board/armltd/vexpress64/MAINTAINERS b/board/armltd/vexpress=
64/MAINTAINERS
-index 0ba044d7ff..e89d9711b8 100644
---- a/board/armltd/vexpress64/MAINTAINERS
-+++ b/board/armltd/vexpress64/MAINTAINERS
-@@ -14,3 +14,10 @@ JUNO DEVELOPMENT PLATFORM BOARD
- M:	Linus Walleij <linus.walleij@linaro.org>
- S:	Maintained
- F:	configs/vexpress_aemv8a_juno_defconfig
-+
-+VEXPRESS_AEMV8R BOARD
-+M:	Diego Sueiro <diego.sueiro@arm.com>
-+M:	Peter Hoyes <peter.hoyes@arm.com>
-+R:	Andre Przywara <andre.przywara@arm.com>
-+S:	Maintained
-+F:	configs/vexpress_aemv8r_defconfig
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 5e22e89824..aebf1d9466 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -18,6 +18,7 @@
- #include <dm/platform_data/serial_pl01x.h>
- #include "pcie.h"
- #include <asm/armv8/mmu.h>
-+#include <asm/armv8/mpu.h>
- #ifdef CONFIG_VIRTIO_NET
- #include <virtio_types.h>
- #include <virtio.h>
-@@ -36,6 +37,56 @@ U_BOOT_DRVINFO(vexpress_serials) =3D {
- 	.plat =3D &serial_plat,
- };
-=20
-+#ifdef CONFIG_TARGET_VEXPRESS64_BASER_FVP
-+
-+static struct mpu_region vexpress64_aemv8r_mem_map[] =3D {
-+       {
-+               .start =3D 0x0UL,
-+               .end =3D 0x7fffffffUL,
-+               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
-+       }, {
-+               .start =3D 0x80000000UL,
-+               .end =3D 0xffffffffUL,
-+               .attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
-+       }, {
-+               .start =3D 0x100000000UL,
-+               .end =3D 0xffffffffffUL,
-+               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
-+       }, {
-+               /* List terminator */
-+               0,
-+       }
-+};
-+
-+struct mpu_region *mpu_mem_map =3D vexpress64_aemv8r_mem_map;
-+
-+static struct mm_region vexpress64_mem_map[] =3D {
-+	{
-+		.virt =3D 0x0UL,
-+		.phys =3D 0x0UL,
-+		.size =3D 0x80000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
-+			 PTE_BLOCK_INNER_SHARE
-+	}, {
-+		.virt =3D 0x80000000UL,
-+		.phys =3D 0x80000000UL,
-+		.size =3D 0x80000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
-+			 PTE_BLOCK_NON_SHARE |
-+			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
-+	},
-+	{
-+		.virt =3D 0x100000000UL,
-+		.phys =3D 0x100000000UL,
-+		.size =3D 0xff00000000UL,
-+		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
-+			 PTE_BLOCK_INNER_SHARE
-+	}, {
-+		/* List terminator */
-+		0,
-+	}
-+};
-+#else
- static struct mm_region vexpress64_mem_map[] =3D {
- 	{
- 		.virt =3D 0x0UL,
-@@ -55,6 +106,7 @@ static struct mm_region vexpress64_mem_map[] =3D {
- 		0,
- 	}
- };
-+#endif
-=20
- struct mm_region *mem_map =3D vexpress64_mem_map;
-=20
-diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-new file mode 100644
-index 0000000000..6fa7c979f6
---- /dev/null
-+++ b/configs/vexpress_aemv8r_defconfig
-@@ -0,0 +1,24 @@
-+CONFIG_ARM=3Dy
-+CONFIG_TARGET_VEXPRESS64_BASER_FVP=3Dy
-+CONFIG_SYS_TEXT_BASE=3D0x00080000
-+CONFIG_POSITION_INDEPENDENT=3Dy
-+CONFIG_SYS_LOAD_ADDR=3D0x10000000
-+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
-+CONFIG_NR_DRAM_BANKS=3D2
-+CONFIG_DEFAULT_DEVICE_TREE=3D"arm_fvp"
-+CONFIG_ENV_SIZE=3D0x40000
-+CONFIG_ENV_SECT_SIZE=3D0x40000
-+CONFIG_IDENT_STRING=3D" vexpress_aemv8r64"
-+CONFIG_DISTRO_DEFAULTS=3Dy
-+CONFIG_BOOTDELAY=3D3
-+CONFIG_USE_BOOTARGS=3Dy
-+CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x9c090000 rootfs=
type=3Dext4 root=3D/dev/vda2 rw rootwait"
-+# CONFIG_DISPLAY_CPUINFO is not set
-+CONFIG_SYS_PROMPT=3D"VExpress64# "
-+CONFIG_DM_ETH=3Dy
-+CONFIG_OF_CONTROL=3Dy
-+CONFIG_OF_BOARD=3Dy
-+CONFIG_VIRTIO_MMIO=3Dy
-+CONFIG_VIRTIO_BLK=3Dy
-+CONFIG_VIRTIO_NET=3Dy
-+CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
-diff --git a/doc/board/armltd/vexpress64.rst b/doc/board/armltd/vexpress=
64.rst
-index d87b1c38f5..a7f771d266 100644
---- a/doc/board/armltd/vexpress64.rst
-+++ b/doc/board/armltd/vexpress64.rst
-@@ -6,6 +6,7 @@ Arm Versatile Express
- The vexpress_* board configuration supports the following platforms:
-=20
-  * FVP_Base_RevC-2xAEMvA
-+ * FVP_BaseR_AEMv8R
-  * Juno development board
-=20
- Fixed Virtual Platforms
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index f0c5ceb384..8050f42f8b 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -20,8 +20,13 @@
- #define CONFIG_SYS_BOOTM_LEN (64 << 20)      /* Increase max gunzip siz=
e */
-=20
- /* CS register bases for the original memory map. */
-+#ifdef CONFIG_TARGET_VEXPRESS64_BASER_FVP
-+#define V2M_BASE			0x00000000
-+#define V2M_PA_BASE			0x80000000
-+#else
- #define V2M_BASE			0x80000000
- #define V2M_PA_BASE			0x00000000
-+#endif
-=20
- #define V2M_PA_CS0			(V2M_PA_BASE + 0x00000000)
- #define V2M_PA_CS1			(V2M_PA_BASE + 0x14000000)
-@@ -188,6 +193,43 @@
- 				"boot_name=3Dboot.img\0" \
- 				"boot_addr_r=3D" __stringify(VEXPRESS_BOOT_ADDR) "\0"
-=20
-+#elif CONFIG_TARGET_VEXPRESS64_BASER_FVP
-+
-+#define BOOTENV_DEV_MEM(devtypeu, devtypel, instance) \
-+	"bootcmd_mem=3D " \
-+		"source ${scriptaddr}; " \
-+		"if test $? -eq 1; then " \
-+		"  env import -t ${scriptaddr}; " \
-+		"  if test -n $uenvcmd; then " \
-+		"    echo Running uenvcmd ...; " \
-+		"    run uenvcmd; " \
-+		"  fi; " \
-+		"fi\0"
-+#define BOOTENV_DEV_NAME_MEM(devtypeu, devtypel, instance) "mem "
-+
-+#define BOOT_TARGET_DEVICES(func)	\
-+	func(MEM, mem, na)		\
-+	func(VIRTIO, virtio, 0)		\
-+	func(PXE, pxe, na)		\
-+	func(DHCP, dhcp, na)
-+
-+#include <config_distro_bootcmd.h>
-+
-+#define VEXPRESS_KERNEL_ADDR		0x00200000
-+#define VEXPRESS_PXEFILE_ADDR		0x0fb00000
-+#define VEXPRESS_FDT_ADDR		0x0fc00000
-+#define VEXPRESS_SCRIPT_ADDR		0x0fd00000
-+#define VEXPRESS_RAMDISK_ADDR		0x0fe00000
-+
-+#define CONFIG_EXTRA_ENV_SETTINGS       \
-+		"kernel_addr_r=3D" __stringify(VEXPRESS_KERNEL_ADDR) "\0" \
-+		"pxefile_addr_r=3D" __stringify(VEXPRESS_PXEFILE_ADDR) "\0" \
-+		"fdt_addr_r=3D" __stringify(VEXPRESS_FDT_ADDR) "\0" \
-+		"fdtfile=3Dboard.dtb\0" \
-+		"scriptaddr=3D" __stringify(VEXPRESS_SCRIPT_ADDR) "\0"  \
-+		"ramdisk_addr_r=3D" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
-+		BOOTENV
-+
- #endif
-=20
- /* Monitor Command Prompt */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
02-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexpress64-add-MPU-memor=
y-map-for-the-BASER_FVP.patch
new file mode 100644
index 00000000..f405457f
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexp=
ress64-add-MPU-memory-map-for-the-BASER_FVP.patch
@@ -0,0 +1,61 @@
+From 80c64d0c035a5cd0cb23c7b01be39f25e15c7193 Mon Sep 17 00:00:00 2001
+From: Qi Feng <qi.feng@arm.com>
+Date: Tue, 26 Jul 2022 18:13:23 +0800
+Subject: [PATCH 2/9] vexpress64: add MPU memory map for the BASER_FVP
+
+The previous patch added support for initializing an Armv8 MPU. There is=
 only an
+MPU at S-EL2 on the BASER_FVP, so add a platform-specific MPU memory map=
.
+
+See https://developer.arm.com/documentation/100964/1117/Base-Platform/Ba=
se---memory/BaseR-Platform-memory-map
+
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Signed-off-by: Qi Feng <qi.feng@arm.com>
+---
+ board/armltd/vexpress64/vexpress64.c | 22 ++++++++++++++++++++++
+ 1 file changed, 22 insertions(+)
+
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index 709ebf3fb0..1791cd986f 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -19,6 +19,7 @@
+ #include <dm/platform_data/serial_pl01x.h>
+ #include "pcie.h"
+ #include <asm/armv8/mmu.h>
++#include <asm/armv8/mpu.h>
+ #ifdef CONFIG_VIRTIO_NET
+ #include <virtio_types.h>
+ #include <virtio.h>
+@@ -37,6 +38,27 @@ U_BOOT_DRVINFO(vexpress_serials) =3D {
+ 	.plat =3D &serial_plat,
+ };
+=20
++static struct mpu_region vexpress64_aemv8r_mem_map[] =3D {
++	{
++		.start =3D 0x0UL,
++		.end =3D 0x7fffffffUL,
++		.attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++	}, {
++		.start =3D 0x80000000UL,
++		.end =3D 0xffffffffUL,
++		.attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
++	}, {
++		.start =3D 0x100000000UL,
++		.end =3D 0xffffffffffUL,
++		.attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++	}, {
++		/* List terminator */
++		0,
++	}
++};
++
++struct mpu_region *mpu_mem_map =3D vexpress64_aemv8r_mem_map;
++
+ static struct mm_region vexpress64_mem_map[] =3D {
+ 	{
+ 		.virt =3D V2M_PA_BASE,
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
03-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv8-Allow-disabli=
ng-exception-vectors-on-non-SPL-b.patch
index 0dbaaa85..e6ccc174 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
@@ -1,7 +1,7 @@
-From 2edfe3f7c44028fccdc8f8c71461e8c5a0b0b14e Mon Sep 17 00:00:00 2001
+From 61a2df4467c13bbc83bff8a3429e9ebb4b957b56 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 11:41:19 +0000
-Subject: [PATCH 3/8] armv8: Allow disabling exception vectors on non-SPL
+Subject: [PATCH 3/9] armv8: Allow disabling exception vectors on non-SPL
  builds
=20
 On the BASER_FVP, U-Boot shares EL2 with another bootloader, so we do
@@ -23,12 +23,11 @@ Change-Id: I0cf0fc6d7ef4d45791411cf1f67c65e198cc8b2b
  arch/arm/cpu/armv8/Kconfig        | 10 ++++++++--
  arch/arm/cpu/armv8/Makefile       |  6 ++----
  arch/arm/cpu/armv8/start.S        |  4 ++--
- arch/arm/mach-imx/imx8ulp/Kconfig |  2 +-
  configs/vexpress_aemv8r_defconfig |  1 +
- 5 files changed, 14 insertions(+), 9 deletions(-)
+ 4 files changed, 13 insertions(+), 8 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 9967376eca..6f9d0610e8 100644
+index 09f3f50fa2..031faa909c 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -1,8 +1,8 @@
@@ -73,7 +72,7 @@ index 85fe0475c8..8b3f695835 100644
  endif
  obj-y	+=3D tlb.o
 diff --git a/arch/arm/cpu/armv8/start.S b/arch/arm/cpu/armv8/start.S
-index 91b00a46cc..d2fcae1e94 100644
+index 28f0df13f0..f831e77af3 100644
 --- a/arch/arm/cpu/armv8/start.S
 +++ b/arch/arm/cpu/armv8/start.S
 @@ -104,7 +104,7 @@ pie_skip_reloc:
@@ -85,7 +84,7 @@ index 91b00a46cc..d2fcae1e94 100644
  .macro	set_vbar, regname, reg
  	msr	\regname, \reg
  .endm
-@@ -350,7 +350,7 @@ ENDPROC(smp_kick_all_cpus)
+@@ -354,7 +354,7 @@ ENDPROC(smp_kick_all_cpus)
  /*---------------------------------------------------------------------=
--*/
 =20
  ENTRY(c_runtime_cpu_setup)
@@ -94,27 +93,14 @@ index 91b00a46cc..d2fcae1e94 100644
  	/* Relocate vBAR */
  	adr	x0, vectors
  	switch_el x1, 3f, 2f, 1f
-diff --git a/arch/arm/mach-imx/imx8ulp/Kconfig b/arch/arm/mach-imx/imx8u=
lp/Kconfig
-index 963fc93d34..6255711f12 100644
---- a/arch/arm/mach-imx/imx8ulp/Kconfig
-+++ b/arch/arm/mach-imx/imx8ulp/Kconfig
-@@ -2,7 +2,7 @@ if ARCH_IMX8ULP
-=20
- config IMX8ULP
- 	bool
--	select ARMV8_SPL_EXCEPTION_VECTORS
-+	select SPL_ARMV8_EXCEPTION_VECTORS
-=20
- config SYS_SOC
- 	default "imx8ulp"
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 6fa7c979f6..402062cecf 100644
+index a1c5d88717..1d5b7411f0 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -22,3 +22,4 @@ CONFIG_VIRTIO_MMIO=3Dy
- CONFIG_VIRTIO_BLK=3Dy
- CONFIG_VIRTIO_NET=3Dy
- CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+@@ -13,3 +13,4 @@ CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,=
0x9c090000 rootfstype=3Dext4 root=3D
+ CONFIG_SYS_PROMPT=3D"VExpress64# "
+ # CONFIG_MMC is not set
+ CONFIG_VIRTIO_MMIO=3Dy
 +CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
 --=20
 2.25.1
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
04-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv8-ARMV8_SWITCH_TO_EL1-improve=
ments.patch
index 6df655cd..84f6b4bb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
@@ -1,7 +1,7 @@
-From 02054cf03be7a8b657543cc7a0e2f4abadacbee1 Mon Sep 17 00:00:00 2001
+From dbc1a218e9837e39cd50dd3c19f603f29a08ddba Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 14 Jul 2021 12:44:27 +0100
-Subject: [PATCH 4/8] armv8: ARMV8_SWITCH_TO_EL1 improvements
+Subject: [PATCH 4/9] armv8: ARMV8_SWITCH_TO_EL1 improvements
=20
 Convert CONFIG_ARMV8_SWITCH_TO_EL1 to a Kconfig variable.
=20
@@ -21,16 +21,15 @@ Change-Id: If98478148d6d8d1f732acac5439276700614815f
  arch/arm/cpu/armv8/exception_level.c | 21 ++++++++++++++--
  arch/arm/lib/bootm.c                 | 36 ++++++++++++++++------------
  configs/vexpress_aemv8r_defconfig    |  1 +
- scripts/config_whitelist.txt         |  1 -
- 5 files changed, 49 insertions(+), 18 deletions(-)
+ 4 files changed, 49 insertions(+), 17 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 6f9d0610e8..b50ce60097 100644
+index 031faa909c..110adf63b3 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
-@@ -177,4 +177,12 @@ config ARMV8_SECURE_BASE
-=20
- endif
+@@ -191,4 +191,12 @@ config ARMV8_EA_EL3_FIRST
+ 	  Exception handling at all exception levels for External Abort and
+ 	  SError interrupt exception are taken in EL3.
 =20
 +config ARMV8_SWITCH_TO_EL1
 +	bool "Switch to EL1 before booting the operating system"
@@ -148,26 +147,14 @@ index a59a5e6c0e..e2cf2e6ec4 100644
  #else
  	unsigned long machid =3D gd->bd->bi_arch_number;
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 402062cecf..dff1836da2 100644
+index 1d5b7411f0..35e5e8a5e1 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -23,3 +23,4 @@ CONFIG_VIRTIO_BLK=3Dy
- CONFIG_VIRTIO_NET=3Dy
- CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+@@ -14,3 +14,4 @@ CONFIG_SYS_PROMPT=3D"VExpress64# "
+ # CONFIG_MMC is not set
+ CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
 +CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
-diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index a6bc234f51..a0dd5074aa 100644
---- a/scripts/config_whitelist.txt
-+++ b/scripts/config_whitelist.txt
-@@ -7,7 +7,6 @@ CONFIG_AM335X_USB1_MODE
- CONFIG_ARMV7_SECURE_BASE
- CONFIG_ARMV7_SECURE_MAX_SIZE
- CONFIG_ARMV7_SECURE_RESERVE_SIZE
--CONFIG_ARMV8_SWITCH_TO_EL1
- CONFIG_ARM_GIC_BASE_ADDRESS
- CONFIG_ARP_TIMEOUT
- CONFIG_AT91SAM9260EK
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
05-armv8-Make-disabling-HVC-configurable-when-switching.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv8-Make-disablin=
g-HVC-configurable-when-switching.patch
index bf88cba6..b5460268 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
@@ -1,7 +1,7 @@
-From 995a9daf6fd1e6375d2492cb821d24481141731b Mon Sep 17 00:00:00 2001
+From f75060be04aaed4bb5a07cb40361d694b3775f4a Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 16:37:26 +0000
-Subject: [PATCH 5/8] armv8: Make disabling HVC configurable when switchi=
ng to
+Subject: [PATCH 5/9] armv8: Make disabling HVC configurable when switchi=
ng to
  EL1
=20
 On the BASER_FVP there is no EL3, so HVC is used to provide PSCI
@@ -22,10 +22,10 @@ Change-Id: I463d82f1db8a3cafcab40a9c0c208753569cc300
  3 files changed, 18 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index b50ce60097..90e28f4e36 100644
+index 110adf63b3..a821e219d8 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
-@@ -185,4 +185,13 @@ config ARMV8_SWITCH_TO_EL1
+@@ -199,4 +199,13 @@ config ARMV8_SWITCH_TO_EL1
  	  operating system does not support booting at EL2, or you wish to pre=
vent
  	  any hypervisors from running. Supported for bootm, booti and bootefi=
.
 =20
@@ -40,10 +40,10 @@ index b50ce60097..90e28f4e36 100644
 +
  endif
 diff --git a/arch/arm/include/asm/macro.h b/arch/arm/include/asm/macro.h
-index ec0171e0e6..6d267cbae2 100644
+index 1a1edc9870..7167739210 100644
 --- a/arch/arm/include/asm/macro.h
 +++ b/arch/arm/include/asm/macro.h
-@@ -311,9 +311,12 @@ lr	.req	x30
+@@ -296,9 +296,12 @@ lr	.req	x30
  	ldr	\tmp2, =3D(ID_AA64ISAR1_EL1_GPI | ID_AA64ISAR1_EL1_GPA | \
  		      ID_AA64ISAR1_EL1_API | ID_AA64ISAR1_EL1_APA)
  	tst	\tmp, \tmp2
@@ -57,7 +57,7 @@ index ec0171e0e6..6d267cbae2 100644
  	msr	hcr_el2, \tmp
 =20
  	/* Return to the EL1_SP1 mode from EL2 */
-@@ -326,7 +329,10 @@ lr	.req	x30
+@@ -311,7 +314,10 @@ lr	.req	x30
 =20
  1:
  	/* Initialize HCR_EL2 */
@@ -70,11 +70,11 @@ index ec0171e0e6..6d267cbae2 100644
 =20
  	/* Return to AArch32 Supervisor mode from EL2 */
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index dff1836da2..a1522c48b5 100644
+index 35e5e8a5e1..605a724a61 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -24,3 +24,4 @@ CONFIG_VIRTIO_NET=3Dy
- CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+@@ -15,3 +15,4 @@ CONFIG_SYS_PROMPT=3D"VExpress64# "
+ CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
  CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
 +CONFIG_ARMV8_DISABLE_HVC=3Dn
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
06-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexpress64-Do-not-set-COUNTER_FR=
EQUENCY.patch
index 639d389b..ca99d0e6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
@@ -1,7 +1,7 @@
-From d7c03f8d297faa641e267c69e83e3582a524af50 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Fri, 10 Dec 2021 15:09:09 +0000
-Subject: [PATCH 6/8] vexpress64: Do not set COUNTER_FREQUENCY
+From db7d4cc91ae19d0cbd05c0ff1b9bf6a55ac0d04a Mon Sep 17 00:00:00 2001
+From: Qi Feng <qi.feng@arm.com>
+Date: Thu, 28 Jul 2022 17:47:18 +0800
+Subject: [PATCH 6/9] vexpress64: Do not set COUNTER_FREQUENCY
=20
 VExpress boards normally run as a second-stage bootloader so should not
 need to modify CNTFRQ_EL0. On the BASER_FVP, U-Boot can modify it if
@@ -9,29 +9,24 @@ running at EL2, but shouldn't because it might be diffe=
rent from the
 value being used by the first-stage bootloader (which might be
 providing PSCI services).
=20
-Issue-Id: SCM-3728
 Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: I137473d721e58e4c348b9641f5b9778178d3bb65
+Signed-off-by: Qi Feng <qi.feng@arm.com>
 ---
- include/configs/vexpress_aemv8.h | 3 ---
- 1 file changed, 3 deletions(-)
+ configs/vexpress_aemv8r_defconfig | 1 -
+ 1 file changed, 1 deletion(-)
=20
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 8050f42f8b..dbf6f04230 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -73,9 +73,6 @@
- #define V2M_SYS_CFGCTRL			(V2M_SYSREGS + 0x0a4)
- #define V2M_SYS_CFGSTAT			(V2M_SYSREGS + 0x0a8)
-=20
--/* Generic Timer Definitions */
--#define COUNTER_FREQUENCY		24000000	/* 24MHz */
--
- /* Generic Interrupt Controller Definitions */
- #ifdef CONFIG_GICV3
- #define GICD_BASE			(V2M_PA_BASE + 0x2f000000)
+diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
+index 605a724a61..153fa14efc 100644
+--- a/configs/vexpress_aemv8r_defconfig
++++ b/configs/vexpress_aemv8r_defconfig
+@@ -1,5 +1,4 @@
+ CONFIG_ARM=3Dy
+-CONFIG_COUNTER_FREQUENCY=3D24000000
+ CONFIG_ARCH_VEXPRESS64=3Dy
+ CONFIG_NR_DRAM_BANKS=3D2
+ CONFIG_DEFAULT_DEVICE_TREE=3D"arm_fvp"
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
07-vexpress64-Configure-memory-using-device-tree.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexpress64-Configure-memor=
y-using-device-tree.patch
deleted file mode 100644
index 5fb6fb1e..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Configure-memory-using-device-tree.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 11a86f5a8c63b4b42dd976ab66c9abfaa4dce1cc Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Thu, 17 Feb 2022 17:02:34 +0000
-Subject: [PATCH 7/8] vexpress64: Configure memory using device tree
-
-The memory size and memory banks were previously configured statically,
-using #defines in the vexpress header file, which could conflict with
-the information in the device tree. Instead, use
-fdtdec_setup_mem_size_base() to configure the RAM size and
-fdtdec_setup_memory_banksize() to set up the memory banks.
-
-Issue-Id: SCM-3874
-Upstream-Status: Inappropriate [other]
-  Implementation pending further discussion
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
-Change-Id: I4add8258cb99dac87f078435272410b562b6fdc7
----
- board/armltd/vexpress64/vexpress64.c | 14 ++------------
- include/configs/vexpress_aemv8.h     | 17 -----------------
- 2 files changed, 2 insertions(+), 29 deletions(-)
-
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index aebf1d9466..84a7810775 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -24,8 +24,6 @@
- #include <virtio.h>
- #endif
-=20
--DECLARE_GLOBAL_DATA_PTR;
--
- static const struct pl01x_serial_plat serial_plat =3D {
- 	.base =3D V2M_UART0,
- 	.type =3D TYPE_PL011,
-@@ -128,20 +126,12 @@ int board_init(void)
-=20
- int dram_init(void)
- {
--	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
--	return 0;
-+	return fdtdec_setup_mem_size_base();
- }
-=20
- int dram_init_banksize(void)
- {
--	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
--	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
--#ifdef PHYS_SDRAM_2
--	gd->bd->bi_dram[1].start =3D PHYS_SDRAM_2;
--	gd->bd->bi_dram[1].size =3D PHYS_SDRAM_2_SIZE;
--#endif
--
--	return 0;
-+	return fdtdec_setup_memory_banksize();
- }
-=20
- /* Assigned in lowlevel_init.S
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index dbf6f04230..85a9fcc198 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -104,23 +104,6 @@
- /* BOOTP options */
- #define CONFIG_BOOTP_BOOTFILESIZE
-=20
--/* Miscellaneous configurable options */
--
--/* Physical Memory Map */
--#define PHYS_SDRAM_1			(V2M_BASE)	/* SDRAM Bank #1 */
--/* Top 16MB reserved for secure world use */
--#define DRAM_SEC_SIZE		0x01000000
--#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
--#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
--
--#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
--#define PHYS_SDRAM_2			(0x880000000)
--#define PHYS_SDRAM_2_SIZE		0x180000000
--#elif CONFIG_NR_DRAM_BANKS =3D=3D 2
--#define PHYS_SDRAM_2			(0x880000000)
--#define PHYS_SDRAM_2_SIZE		0x80000000
--#endif
--
- /* Enable memtest */
-=20
- /* Initial environment variables */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
08-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexpress64-Enable-L=
IBFDT_OVERLAY-in-the-vexpress_aem.patch
similarity index 76%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
8-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-=
vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
index dbc3332f..467fb406 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
@@ -1,7 +1,7 @@
-From 6a97b1bcb49f87c9495311e657b90ef6b73ce6c5 Mon Sep 17 00:00:00 2001
+From f4986ed954ffad36abfa27db5520e702cba2531e Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Tue, 22 Feb 2022 15:32:51 +0000
-Subject: [PATCH 8/8] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
+Subject: [PATCH 7/9] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
  defconfig
=20
 Issue-Id: SCM-3874
@@ -14,10 +14,10 @@ Change-Id: Ide0532cf2de89f1bca9c8d4bd2ed0c1a1c57599f
  1 file changed, 1 insertion(+)
=20
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index a1522c48b5..98b0f5ad53 100644
+index 153fa14efc..94651768b3 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -25,3 +25,4 @@ CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+@@ -15,3 +15,4 @@ CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
  CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
  CONFIG_ARMV8_DISABLE_HVC=3Dn
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
09-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv8-Allow-PRBAR-MPU-=
attributes-to-be-configured.patch
similarity index 69%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/000=
9-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-=
armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
index 94ac8069..4b6daf8d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
@@ -1,7 +1,7 @@
-From c4abb74e62817c5adf32c011db93f6bfc2deabaf Mon Sep 17 00:00:00 2001
+From af05764e7b64e0704291ba2e71138f2345737afa Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 18 May 2022 15:24:19 +0100
-Subject: [PATCH 1/2] armv8: Allow PRBAR MPU attributes to be configured
+Subject: [PATCH 8/9] armv8: Allow PRBAR MPU attributes to be configured
=20
 In a previous patch, support was added to initialize an S-EL2 MPU on
 armv8r64 machines. This implementation allowed the PRLAR attribute
@@ -28,10 +28,10 @@ Change-Id: I6b72aead91ad12412262aa32c61a53e12eab3984
  3 files changed, 16 insertions(+), 8 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
-index f6e0ad0075..981aca4a0f 100644
+index 798aed8058..e336339281 100644
 --- a/arch/arm/cpu/armv8/cache_v8.c
 +++ b/arch/arm/cpu/armv8/cache_v8.c
-@@ -370,7 +370,9 @@ static void mpu_clear_regions(void)
+@@ -390,7 +390,9 @@ static void mpu_clear_regions(void)
  {
  	int i;
 =20
@@ -42,7 +42,7 @@ index f6e0ad0075..981aca4a0f 100644
  		setup_el2_mpu_region(i, 0, 0);
  	}
  }
-@@ -390,12 +392,14 @@ static void mpu_setup(void)
+@@ -410,12 +412,14 @@ static void mpu_setup(void)
 =20
  	asm volatile("msr MAIR_EL2, %0" : : "r" MEMORY_ATTRIBUTES);
 =20
@@ -75,31 +75,31 @@ index 8de627cafd..dd4c689ea6 100644
 =20
  extern struct mpu_region *mpu_mem_map;
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 3f1ac04bac..31ff2f7b2d 100644
+index 1791cd986f..7858521fec 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
-@@ -41,15 +41,18 @@ static struct mpu_region vexpress64_aemv8r_mem_map[]=
 =3D {
-        {
-                .start =3D 0x0UL,
-                .end =3D 0x7fffffffUL,
--               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
-+	       .prbar_attrs =3D PRBAR_INNER_SH | PRBAR_AP_RW_ANY,
-+	       .prlar_attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
-        }, {
-                .start =3D 0x80000000UL,
-                .end =3D 0xffffffffUL,
--               .attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
-+	       .prbar_attrs =3D PRBAR_OUTER_SH | PRBAR_AP_RW_ANY,
-+	       .prlar_attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
-        }, {
-                .start =3D 0x100000000UL,
-                .end =3D 0xffffffffffUL,
--               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
-+	       .prbar_attrs =3D PRBAR_INNER_SH | PRBAR_AP_RW_ANY,
-+	       .prlar_attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
-        }, {
-                /* List terminator */
-                0,
+@@ -42,15 +42,18 @@ static struct mpu_region vexpress64_aemv8r_mem_map[]=
 =3D {
+ 	{
+ 		.start =3D 0x0UL,
+ 		.end =3D 0x7fffffffUL,
+-		.attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++		.prbar_attrs =3D PRBAR_INNER_SH | PRBAR_AP_RW_ANY,
++		.prlar_attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
+ 	}, {
+ 		.start =3D 0x80000000UL,
+ 		.end =3D 0xffffffffUL,
+-		.attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
++		.prbar_attrs =3D PRBAR_OUTER_SH | PRBAR_AP_RW_ANY,
++		.prlar_attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
+ 	}, {
+ 		.start =3D 0x100000000UL,
+ 		.end =3D 0xffffffffffUL,
+-		.attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++		.prbar_attrs =3D PRBAR_INNER_SH | PRBAR_AP_RW_ANY,
++		.prlar_attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
+ 	}, {
+ 		/* List terminator */
+ 		0,
 --=20
 2.25.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
10-armv8-Enable-icache-when-switching-exception-levels-.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv8-Enable-icache=
-when-switching-exception-levels-.patch
similarity index 94%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/001=
0-armv8-Enable-icache-when-switching-exception-levels-.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-=
armv8-Enable-icache-when-switching-exception-levels-.patch
index 6264cc0f..0e0a2481 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0010-armv=
8-Enable-icache-when-switching-exception-levels-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Enable-icache-when-switching-exception-levels-.patch
@@ -1,7 +1,7 @@
-From a5790fe98179b2490500cde629f7a48fbbe341df Mon Sep 17 00:00:00 2001
+From 0f15f6b02825b042ddc1d753f62cf87f30b1fe12 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Thu, 19 May 2022 09:02:32 +0100
-Subject: [PATCH 2/2] armv8: Enable icache when switching exception level=
s in
+Subject: [PATCH 9/9] armv8: Enable icache when switching exception level=
s in
  bootefi
=20
 bootefi calls the function switch_to_non_secure_mode before calling the
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index d4a7a8ac..e254d41b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -63,16 +63,15 @@ SRC_URI:append:fvp-base-arm32 =3D " file://0001-Add-v=
express_aemv8a_aarch32-varian
 # FVP BASER
 #
 SRC_URI:append:fvp-baser-aemv8r64 =3D " \
-    file://0001-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
-    file://0002-armv8-Add-ARMv8-MPU-configuration-logic.patch \
+    file://0001-armv8-Add-ARMv8-MPU-configuration-logic.patch \
+    file://0002-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch \
     file://0003-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.pat=
ch \
     file://0004-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch \
     file://0005-armv8-Make-disabling-HVC-configurable-when-switching.pat=
ch \
     file://0006-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch \
-    file://0007-vexpress64-Configure-memory-using-device-tree.patch \
-    file://0008-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.pat=
ch \
-    file://0009-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch =
\
-    file://0010-armv8-Enable-icache-when-switching-exception-levels-.pat=
ch \
+    file://0007-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.pat=
ch \
+    file://0008-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch =
\
+    file://0009-armv8-Enable-icache-when-switching-exception-levels-.pat=
ch \
     "
=20
=20
--=20
2.25.1


