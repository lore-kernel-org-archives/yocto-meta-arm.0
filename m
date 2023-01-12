Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD9EC67871
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.52033.1673521385466819537
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E7BFAD7;
	Thu, 12 Jan 2023 03:03:47 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACF9A3FA32;
	Thu, 12 Jan 2023 03:03:04 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 09/10] arm-bsp/u-boot: corstone500: bump to 2022.10
Date: Thu, 12 Jan 2023 11:02:56 +0000
Message-Id: <20230112110257.2070363-9-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4272

From: Rui Miguel Silva <rui.silva@linaro.org>

Rebase corstone500 u-boot patches to 2022.10 version.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf    |  2 +-
 ...ng-generic-timer-access-through-MMIO.patch |  8 +--
 ...0002-board-arm-add-corstone500-board.patch | 56 ++++++++-----------
 3 files changed, 28 insertions(+), 38 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 9db2ceb0..dfc850db 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 UBOOT_MACHINE =3D "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT =3D "0x84000000"
 UBOOT_IMAGE_LOADADDRESS =3D "0x84000000"
-PREFERRED_VERSION_u-boot ?=3D "2022.07"
+PREFERRED_VERSION_u-boot ?=3D "2022.10"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv=
7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-throu=
gh-MMIO.patch
index 9a299756..2cdafac5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
@@ -1,4 +1,4 @@
-From d75d794785419592ba49046165d19a6ec9488b2d Mon Sep 17 00:00:00 2001
+From 787a802afb8c05fcb5117c1cbb612c51554aad24 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
 Subject: [PATCH 1/2] armv7: adding generic timer access through MMIO
@@ -124,10 +124,10 @@ index 000000000000..edd806e06e42
 +	return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index c61df4fb1c9b..cfb1c68b6297 100644
+index f505722f6b04..e0df0026c985 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -1253,6 +1253,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -900,6 +900,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
@@ -136,5 +136,5 @@ index c61df4fb1c9b..cfb1c68b6297 100644
  CONFIG_SYS_MONITOR_SEC
  CONFIG_SYS_MOR_VAL
 --=20
-2.37.1
+2.38.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-boar=
d-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone500/0002-board-arm-add-corstone500-board.patch
index c389a64c..f76f449c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
@@ -1,4 +1,4 @@
-From 3566cf4ab79ca78acd69cfb87e74587394e5aeb2 Mon Sep 17 00:00:00 2001
+From 70cf3f7498e98a98b21804f577f3b850018894da Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
 Subject: [PATCH 2/2] board: arm: add corstone500 board
@@ -10,19 +10,15 @@ Add support for the Arm corstone500 platform, with a =
cortex-a5
 chip, add the default configuration, initialization and
 makefile for this system.
=20
-Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
-
-%% original patch: 0002-board-arm-add-corstone500-board.patch
-
 Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
 ---
  arch/arm/Kconfig                       |  10 +++
  board/armltd/corstone500/Kconfig       |  12 +++
  board/armltd/corstone500/Makefile      |   8 ++
- board/armltd/corstone500/corstone500.c |  48 +++++++++++
- configs/corstone500_defconfig          |  40 +++++++++
- include/configs/corstone500.h          | 109 +++++++++++++++++++++++++
- 6 files changed, 227 insertions(+)
+ board/armltd/corstone500/corstone500.c |  48 ++++++++++++
+ configs/corstone500_defconfig          |  41 ++++++++++
+ include/configs/corstone500.h          | 102 +++++++++++++++++++++++++
+ 6 files changed, 221 insertions(+)
  create mode 100644 board/armltd/corstone500/Kconfig
  create mode 100644 board/armltd/corstone500/Makefile
  create mode 100644 board/armltd/corstone500/corstone500.c
@@ -30,12 +26,12 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  create mode 100644 include/configs/corstone500.h
=20
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 9898c7d68e1b..8c60ed39712e 100644
+index 82cd456f51f1..a925e7759ee8 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -718,6 +718,15 @@ config ARCH_BCMSTB
- 	  This enables support for Broadcom ARM-based set-top box
- 	  chipsets, including the 7445 family of chips.
+@@ -1349,6 +1349,15 @@ config TARGET_CORSTONE1000
+ 	select PL01X_SERIAL
+ 	select DM
 =20
 +config TARGET_CORSTONE500
 +	bool "Support Corstone500"
@@ -46,10 +42,10 @@ index 9898c7d68e1b..8c60ed39712e 100644
 +	  This enables support for Corstone500 ARM which is a
 +	  Cortex-A5 system
 +
- config TARGET_VEXPRESS_CA9X4
- 	bool "Support vexpress_ca9x4"
- 	select CPU_V7A
-@@ -2299,6 +2308,7 @@ source "board/bosch/shc/Kconfig"
+ config TARGET_TOTAL_COMPUTE
+ 	bool "Support Total Compute Platform"
+ 	select ARM64
+@@ -2302,6 +2311,7 @@ source "board/bosch/shc/Kconfig"
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
  source "board/Marvell/octeontx2/Kconfig"
@@ -145,22 +141,24 @@ index 000000000000..e878f5c6a521
 +
 diff --git a/configs/corstone500_defconfig b/configs/corstone500_defconf=
ig
 new file mode 100644
-index 000000000000..d3161a4b40d8
+index 000000000000..e475cbe7e40d
 --- /dev/null
 +++ b/configs/corstone500_defconfig
-@@ -0,0 +1,40 @@
+@@ -0,0 +1,41 @@
 +CONFIG_ARM=3Dy
 +CONFIG_SKIP_LOWLEVEL_INIT=3Dy
 +CONFIG_TARGET_CORSTONE500=3Dy
 +CONFIG_SYS_TEXT_BASE=3D0x88000000
 +CONFIG_SYS_MALLOC_LEN=3D0x840000
-+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
 +CONFIG_NR_DRAM_BANKS=3D1
-+CONFIG_SYS_MEMTEST_START=3D0x80000000
-+CONFIG_SYS_MEMTEST_END=3D0xff000000
 +CONFIG_ENV_SIZE=3D0x40000
++CONFIG_SYS_PROMPT=3D"corstone500# "
 +CONFIG_IDENT_STRING=3D" corstone500 aarch32"
 +CONFIG_SYS_LOAD_ADDR=3D0x90000000
++CONFIG_SYS_MEMTEST_START=3D0x80000000
++CONFIG_SYS_MEMTEST_END=3D0xff000000
++CONFIG_HAS_CUSTOM_SYS_INIT_SP_ADDR=3Dy
++CONFIG_CUSTOM_SYS_INIT_SP_ADDR=3D0x83f00000
 +CONFIG_SUPPORT_RAW_INITRD=3Dy
 +CONFIG_BOOTDELAY=3D1
 +CONFIG_USE_BOOTARGS=3Dy
@@ -168,7 +166,6 @@ index 000000000000..d3161a4b40d8
 +# CONFIG_DISPLAY_CPUINFO is not set
 +# CONFIG_DISPLAY_BOARDINFO is not set
 +CONFIG_HUSH_PARSER=3Dy
-+CONFIG_SYS_PROMPT=3D"corstone500# "
 +# CONFIG_CMD_CONSOLE is not set
 +CONFIG_CMD_BOOTZ=3Dy
 +# CONFIG_CMD_XIMG is not set
@@ -191,10 +188,10 @@ index 000000000000..d3161a4b40d8
 +CONFIG_OF_LIBFDT=3Dy
 diff --git a/include/configs/corstone500.h b/include/configs/corstone500=
.h
 new file mode 100644
-index 000000000000..93c397d2f515
+index 000000000000..416f5fa4399d
 --- /dev/null
 +++ b/include/configs/corstone500.h
-@@ -0,0 +1,109 @@
+@@ -0,0 +1,102 @@
 +/* SPDX-License-Identifier: GPL-2.0+ */
 +/*
 + * (C) Copyright 2022 ARM Limited
@@ -208,8 +205,6 @@ index 000000000000..93c397d2f515
 +#ifndef __CORSTONE500_H
 +#define __CORSTONE500_H
 +
-+#define CONFIG_SYS_INIT_SP_ADDR		(CONFIG_SYS_SDRAM_BASE + 0x03f00000)
-+
 +/* Generic Timer Definitions */
 +#define CONFIG_SYS_HZ_CLOCK	7500000
 +#define CONFIG_SYS_HZ		1000
@@ -285,12 +280,7 @@ index 000000000000..93c397d2f515
 +				"bootz $kernel_addr $initrd_addr:0x800000 $fdt_addr"
 +
 +/* Monitor Command Prompt */
-+#define CONFIG_SYS_CBSIZE		512     /* Console I/O Buffer Size */
-+#define CONFIG_SYS_MAXARGS		64      /* max command args */
-+
 +#define CONFIG_SYS_FLASH_BASE		0x80000000
-+/* 256 x 256KiB sectors */
-+#define CONFIG_SYS_MAX_FLASH_SECT	256
 +/* Store environment at top of flash */
 +#define CONFIG_ENV_ADDR			0x0a7c0000
 +#define CONFIG_ENV_SECT_SIZE		0x0040000
@@ -305,5 +295,5 @@ index 000000000000..93c397d2f515
 +#define CONFIG_ENV_IS_IN_FLASH		1
 +#endif
 --=20
-2.37.1
+2.38.1
=20
--=20
2.34.1


