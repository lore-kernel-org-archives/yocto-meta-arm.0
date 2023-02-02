Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17450C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 09:55:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.11189.1675331701294933684
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 01:55:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C0821424;
	Thu,  2 Feb 2023 01:55:43 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E6053F64C;
	Thu,  2 Feb 2023 01:55:00 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/6] arm-bsp/corstone500: bump u-boot version to 2023.01
Date: Thu,  2 Feb 2023 09:54:53 +0000
Message-Id: <20230202095456.3113221-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202095456.3113221-1-ross.burton@arm.com>
References: <20230202095456.3113221-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 02 Feb 2023 09:55:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4350

From: Rui Miguel Silva <rui.silva@linaro.org>

Rebase patches and bump version to u-boot 2023.01.

Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
---
 meta-arm-bsp/conf/machine/corstone500.conf         |  2 +-
 ...-adding-generic-timer-access-through-MMIO.patch | 12 ++++++------
 .../0002-board-arm-add-corstone500-board.patch     | 14 +++++++-------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/corstone500.conf b/meta-arm-bsp/co=
nf/machine/corstone500.conf
index 12634a3b..2642ec71 100644
--- a/meta-arm-bsp/conf/machine/corstone500.conf
+++ b/meta-arm-bsp/conf/machine/corstone500.conf
@@ -26,7 +26,7 @@ SERIAL_CONSOLES =3D "115200;ttyAMA0"
 UBOOT_MACHINE =3D "corstone500_defconfig"
 UBOOT_IMAGE_ENTRYPOINT =3D "0x84000000"
 UBOOT_IMAGE_LOADADDRESS =3D "0x84000000"
-PREFERRED_VERSION_u-boot ?=3D "2022.10"
+PREFERRED_VERSION_u-boot ?=3D "2023.01"
=20
 # making sure EXTRA_IMAGEDEPENDS will be used while creating the image
 WKS_FILE_DEPENDS:append =3D " ${EXTRA_IMAGEDEPENDS}"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv=
7-adding-generic-timer-access-through-MMIO.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/corstone500/0001-armv7-adding-generic-timer-access-throu=
gh-MMIO.patch
index 2cdafac5..3d8545ff 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0001-armv7-addin=
g-generic-timer-access-through-MMIO.patch
@@ -1,4 +1,4 @@
-From 787a802afb8c05fcb5117c1cbb612c51554aad24 Mon Sep 17 00:00:00 2001
+From 2bb9fb8414b8ad35ed5fc6c91a34c21cef285a01 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 18 Dec 2019 21:52:34 +0000
 Subject: [PATCH 1/2] armv7: adding generic timer access through MMIO
@@ -124,17 +124,17 @@ index 000000000000..edd806e06e42
 +	return gd->arch.timer_rate_hz;
 +}
 diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
-index f505722f6b04..e0df0026c985 100644
+index ea71f9d23449..1496d9b88233 100644
 --- a/scripts/config_whitelist.txt
 +++ b/scripts/config_whitelist.txt
-@@ -900,6 +900,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
+@@ -610,6 +610,7 @@ CONFIG_SYS_MMC_U_BOOT_DST
  CONFIG_SYS_MMC_U_BOOT_OFFS
  CONFIG_SYS_MMC_U_BOOT_SIZE
  CONFIG_SYS_MMC_U_BOOT_START
 +CONFIG_SYS_MMIO_TIMER
- CONFIG_SYS_MONITOR_LEN
- CONFIG_SYS_MONITOR_SEC
  CONFIG_SYS_MOR_VAL
+ CONFIG_SYS_MRAM_BASE
+ CONFIG_SYS_NAND_AMASK
 --=20
-2.38.1
+2.39.1
=20
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-boar=
d-arm-add-corstone500-board.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/corstone500/0002-board-arm-add-corstone500-board.patch
index f76f449c..5aec24cc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone500/0002-board-arm-a=
dd-corstone500-board.patch
@@ -1,4 +1,4 @@
-From 70cf3f7498e98a98b21804f577f3b850018894da Mon Sep 17 00:00:00 2001
+From 376e7cc533e27f943191d44c112e3812885b8fd1 Mon Sep 17 00:00:00 2001
 From: Rui Miguel Silva <rui.silva@linaro.org>
 Date: Wed, 8 Jan 2020 09:48:11 +0000
 Subject: [PATCH 2/2] board: arm: add corstone500 board
@@ -26,10 +26,10 @@ Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org=
>
  create mode 100644 include/configs/corstone500.h
=20
 diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 82cd456f51f1..a925e7759ee8 100644
+index cac4fa09fd32..b875c1ef3d32 100644
 --- a/arch/arm/Kconfig
 +++ b/arch/arm/Kconfig
-@@ -1349,6 +1349,15 @@ config TARGET_CORSTONE1000
+@@ -1309,6 +1309,15 @@ config TARGET_CORSTONE1000
  	select PL01X_SERIAL
  	select DM
 =20
@@ -45,7 +45,7 @@ index 82cd456f51f1..a925e7759ee8 100644
  config TARGET_TOTAL_COMPUTE
  	bool "Support Total Compute Platform"
  	select ARM64
-@@ -2302,6 +2311,7 @@ source "board/bosch/shc/Kconfig"
+@@ -2264,6 +2273,7 @@ source "board/bosch/shc/Kconfig"
  source "board/bosch/guardian/Kconfig"
  source "board/Marvell/octeontx/Kconfig"
  source "board/Marvell/octeontx2/Kconfig"
@@ -141,14 +141,14 @@ index 000000000000..e878f5c6a521
 +
 diff --git a/configs/corstone500_defconfig b/configs/corstone500_defconf=
ig
 new file mode 100644
-index 000000000000..e475cbe7e40d
+index 000000000000..91661beb8d8d
 --- /dev/null
 +++ b/configs/corstone500_defconfig
 @@ -0,0 +1,41 @@
 +CONFIG_ARM=3Dy
 +CONFIG_SKIP_LOWLEVEL_INIT=3Dy
 +CONFIG_TARGET_CORSTONE500=3Dy
-+CONFIG_SYS_TEXT_BASE=3D0x88000000
++CONFIG_TEXT_BASE=3D0x88000000
 +CONFIG_SYS_MALLOC_LEN=3D0x840000
 +CONFIG_NR_DRAM_BANKS=3D1
 +CONFIG_ENV_SIZE=3D0x40000
@@ -295,5 +295,5 @@ index 000000000000..416f5fa4399d
 +#define CONFIG_ENV_IS_IN_FLASH		1
 +#endif
 --=20
-2.38.1
+2.39.1
=20
--=20
2.34.1


