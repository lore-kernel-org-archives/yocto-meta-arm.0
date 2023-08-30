Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 138B7C6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 13:57:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.14452.1693403835377056943
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 06:57:15 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA6DA2F4
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 06:57:53 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 50CB93F738
	for <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 06:57:14 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/corstone500: upgrade u-boot to the latest
Date: Wed, 30 Aug 2023 08:57:10 -0500
Message-Id: <20230830135710.3693738-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Aug 2023 13:57:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5005

Rebase the corstone500 u-boot patches to 2023.07.02.  Some defined
variables changed names, and had to be updated.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 ...ng-generic-timer-access-through-MMIO.patch | 35 ++++------------
 ...0002-board-arm-add-corstone500-board.patch | 40 +++++++++----------
 3 files changed, 28 insertions(+), 49 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 6d2294c2..a169b921 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -25,7 +25,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 UBOOT_MACHINE =3D "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT =3D "0x84000000"
 UBOOT_IMAGE_LOADADDRESS =3D "0x84000000"
-PREFERRED_VERSION_u-boot ?=3D "2023.01"
+PREFERRED_VERSION_u-boot ?=3D "2023.07%"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv=
7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-throu=
gh-MMIO.patch
index 1d28631a..ff1754fb 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
@@ -1,10 +1,7 @@
-From 2bb9fb8414b8ad35ed5fc6c91a34c21cef285a01 Mon Sep 17 00:00:00 2001
+From 1f5d48695b896fcaf913eda788117b14afe84e39 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
-Subject: [PATCH 1/2] armv7: adding generic timer access through MMIO
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Subject: [PATCH] armv7: adding generic timer access through MMIO
=20
 This driver enables the ARMv7 generic timer.
=20
@@ -20,22 +17,21 @@ the u-boot initcall level (timer_init) before u-boot =
relocation.
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
=20
-
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
  arch/arm/cpu/armv7/Makefile     |  1 +
  arch/arm/cpu/armv7/mmio_timer.c | 75 +++++++++++++++++++++++++++++++++
- scripts/config_whitelist.txt    |  1 +
- 3 files changed, 77 insertions(+)
+ 2 files changed, 76 insertions(+)
  create mode 100644 arch/arm/cpu/armv7/mmio_timer.c
=20
 diff --git a/arch/arm/cpu/armv7/Makefile b/arch/arm/cpu/armv7/Makefile
-index bfbd85ae64ef..1a0a24e53110 100644
+index 653eef8ad79e..5859b2e2120b 100644
 --- a/arch/arm/cpu/armv7/Makefile
 +++ b/arch/arm/cpu/armv7/Makefile
-@@ -28,6 +28,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+=3D psci.o psci-common.o
+@@ -27,6 +27,7 @@ obj-$(CONFIG_ARMV7_PSCI)	+=3D psci.o psci-common.o
+=20
  obj-$(CONFIG_IPROC) +=3D iproc-common/
- obj-$(CONFIG_KONA) +=3D kona-common/
  obj-$(CONFIG_SYS_ARCH_TIMER) +=3D arch_timer.o
 +obj-$(CONFIG_SYS_MMIO_TIMER) +=3D mmio_timer.o
 =20
@@ -122,18 +118,3 @@ index 000000000000..edd806e06e42
 +{
 +	return gd->arch.timer_rate_hz;
 +}
-diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index ea71f9d23449..1496d9b88233 100644
---- a/scripts/config_whitelist.txt
-+++ b/scripts/config_whitelist.txt
-@@ -610,6 +610,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
- CONFIG_SYS_MMC_U_BOOT_OFFS
- CONFIG_SYS_MMC_U_BOOT_SIZE
- CONFIG_SYS_MMC_U_BOOT_START
-+CONFIG_SYS_MMIO_TIMER
- CONFIG_SYS_MOR_VAL
- CONFIG_SYS_MRAM_BASE
- CONFIG_SYS_NAND_AMASK
---=20
-2.39.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-boar=
d-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone500/0002-board-arm-add-corstone500-board.patch
index 5aec24cc..b938a46d 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
@@ -1,24 +1,24 @@
-From 376e7cc533e27f943191d44c112e3812885b8fd1 Mon Sep 17 00:00:00 2001
+From e296c84e276e8ccc39dd593442a4f3f8655b1f57 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
-Subject: [PATCH 2/2] board: arm: add corstone500 board
-
-Upstream-Status: Pending [Not submitted to upstream yet]
-Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
+Subject: [PATCH] board: arm: add corstone500 board
=20
 Add support for the Arm corstone500 platform, with a cortex-a5
 chip, add the default configuration, initialization and
 makefile for this system.
=20
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
+
+Upstream-Status: Pending [Not submitted to upstream yet]
+Signed-off-by: Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>
 ---
  arch/arm/Kconfig                       |  10 +++
  board/armltd/corstone500/Kconfig       |  12 +++
  board/armltd/corstone500/Makefile      |   8 ++
  board/armltd/corstone500/corstone500.c |  48 ++++++++++++
  configs/corstone500_defconfig          |  41 ++++++++++
- include/configs/corstone500.h          | 102 +++++++++++++++++++++++++
- 6 files changed, 221 insertions(+)
+ include/configs/corstone500.h          | 103 +++++++++++++++++++++++++
+ 6 files changed, 222 insertions(+)
  create mode 100644 board/armltd/corstone500/Kconfig
  create mode 100644 board/armltd/corstone500/Makefile
  create mode 100644 board/armltd/corstone500/corstone500.c
@@ -26,10 +26,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  create mode 100644 include/configs/corstone500.h
=20
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index cac4fa09fd32..b875c1ef3d32 100644
+index 99264a64780c..522e3e549c8d 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1309,6 +1309,15 @@ config TARGET_CORSTONE1000
+@@ -1338,6 +1338,15 @@ config TARGET_CORSTONE1000
  	select PL01X_SERIAL
  	select DM
 =20
@@ -45,7 +45,7 @@ index cac4fa09fd32..b875c1ef3d32 100644
  config TARGET_TOTAL_COMPUTE
  	bool "Support Total Compute Platform"
  	select ARM64
-@@ -2264,6 +2273,7 @@ source "board/bosch/shc/Kconfig"
+@@ -2294,6 +2303,7 @@ source "board/bosch/shc/Kconfig"
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
  source "board/Marvell/octeontx2/Kconfig"
@@ -87,7 +87,7 @@ index 000000000000..6598fdd3ae0d
 +obj-y :=3D corstone500.o
 diff --git a/board/armltd/corstone500/corstone500.c b/board/armltd/corst=
one500/corstone500.c
 new file mode 100644
-index 000000000000..e878f5c6a521
+index 000000000000..19ec5564291f
 --- /dev/null
 +++ b/board/armltd/corstone500/corstone500.c
 @@ -0,0 +1,48 @@
@@ -107,7 +107,7 @@ index 000000000000..e878f5c6a521
 +static const struct pl01x_serial_plat serial_platdata =3D {
 +	.base =3D V2M_UART0,
 +	.type =3D TYPE_PL011,
-+	.clock =3D CONFIG_PL011_CLOCK,
++	.clock =3D CFG_PL011_CLOCK,
 +};
 +
 +U_BOOT_DRVINFO(corstone500_serials) =3D {
@@ -188,10 +188,10 @@ index 000000000000..91661beb8d8d
 +CONFIG_OF_LIBFDT=3Dy
 diff --git a/include/configs/corstone500.h b/include/configs/corstone500=
.h
 new file mode 100644
-index 000000000000..416f5fa4399d
+index 000000000000..555e0e44e432
 --- /dev/null
 +++ b/include/configs/corstone500.h
-@@ -0,0 +1,102 @@
+@@ -0,0 +1,103 @@
 +/* SPDX-License-Identifier: GPL-2.0+ */
 +/*
 + * (C) Copyright 2022 ARM Limited
@@ -250,7 +250,7 @@ index 000000000000..416f5fa4399d
 +
 +/* PL011 Serial Configuration */
 +#define CONFIG_CONS_INDEX	0
-+#define CONFIG_PL011_CLOCK	7500000
++#define CFG_PL011_CLOCK		7500000
 +
 +/* Physical Memory Map */
 +#define PHYS_SDRAM_1		(V2M_BASE)
@@ -260,11 +260,11 @@ index 000000000000..416f5fa4399d
 +#define PHYS_SDRAM_1_SIZE	(0x80000000 - DRAM_SEC_SIZE)
 +
 +/* Miscellaneous configurable options */
-+#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
++#define CFG_SYS_SDRAM_BASE	PHYS_SDRAM_1
 +
 +#define CONFIG_SYS_MMIO_TIMER
 +
-+#define CONFIG_EXTRA_ENV_SETTINGS     \
++#define CFG_EXTRA_ENV_SETTINGS     \
 +				"kernel_name=3DImage\0"           \
 +				"kernel_addr=3D0x80f00000\0"      \
 +				"initrd_name=3Dramdisk.img\0"     \
@@ -280,7 +280,8 @@ index 000000000000..416f5fa4399d
 +				"bootz $kernel_addr $initrd_addr:0x800000 $fdt_addr"
 +
 +/* Monitor Command Prompt */
-+#define CONFIG_SYS_FLASH_BASE		0x80000000
++#define CFG_SYS_FLASH_BASE		0x80000000
++
 +/* Store environment at top of flash */
 +#define CONFIG_ENV_ADDR			0x0a7c0000
 +#define CONFIG_ENV_SECT_SIZE		0x0040000
@@ -294,6 +295,3 @@ index 000000000000..416f5fa4399d
 +#define FLASH_MAX_SECTOR_SI		0x00040000
 +#define CONFIG_ENV_IS_IN_FLASH		1
 +#endif
---=20
-2.39.1
-
--=20
2.30.2


