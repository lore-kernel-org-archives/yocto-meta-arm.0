Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77DA2CCFA13
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 13:28:27 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14307.1777642103940931318
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 May 2026 06:28:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=GUDeLaO1;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF6DB176B
	for <meta-arm@lists.yoctoproject.org>; Fri,  1 May 2026 06:28:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0672E3F62B
	for <meta-arm@lists.yoctoproject.org>; Fri,  1 May 2026 06:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777642103; bh=uurEb2BWpABihmGvUmxVOGteUMqAPvMMv/iMCBiK818=;
	h=From:To:Subject:Date:From;
	b=GUDeLaO1UgwJ1aVeLYb9JAJkm9C7DXGDdD687GQsWLo7y8DaHEPWLhxYNDutfj9ZV
	 I2XyQzZRPPUkzo3rdbdAIUnKx59EY8O4P1jFD60V/SPTyqM6fwEArCSXPMaFpiTheM
	 NhTAisZJ2YDm+pUvTle0udVMC+HpNM2CRf6f1kXc=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: Update fvp-base, juno, corstone1000 patches
Date: Fri,  1 May 2026 09:28:22 -0400
Message-ID: <20260501132822.2152-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 May 2026 13:28:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7029

Fuzz detected when applying patch.  Use devtool to update and clean-up
the relevant patches.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...ne1000-enable-OF_UPSTREAM-device-tree-support.patch |  7 +++----
 ...e1000-dts-use-32-bit-cells-for-reserved-memor.patch |  6 ++----
 ...stone1000-a320-Add-Corstone1000-board-variant.patch |  4 ++--
 ...express64-Imply-CONFIG_ARM64_CRC32-by-default.patch | 10 +++++-----
 ...-vexpress-modify-to-boot-compressed-initramfs.patch |  6 +++---
 5 files changed, 15 insertions(+), 18 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-cor=
stone1000-enable-OF_UPSTREAM-device-tree-support.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/corstone1000/0037-corstone1000-enable-OF_UPSTREAM-=
device-tree-support.patch
index a86b791a6909..5da63516a1ae 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0037-corstone10=
00-enable-OF_UPSTREAM-device-tree-support.patch
@@ -1,4 +1,4 @@
-From e070ae0f02b10bfd482146a748095ca782f73039 Mon Sep 17 00:00:00 2001
+From e1b46cabacd2bbbde5ac42a01af21126788f274e Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Mon, 19 Jan 2026 15:16:52 +0000
 Subject: [PATCH] corstone1000: enable OF_UPSTREAM device tree support
@@ -502,7 +502,7 @@ index 1b9c3a9ed16..db8919298e1 100644
  		if (!virtio_bus) {
  			log_err("Cannot find virtio device, err (%d)\n", ret);
 diff --git a/configs/corstone1000_defconfig b/configs/corstone1000_defco=
nfig
-index 450d69762ab..350607892fa 100644
+index 4ec23b4af1c..6ff855e7ce9 100644
 --- a/configs/corstone1000_defconfig
 +++ b/configs/corstone1000_defconfig
 @@ -7,7 +7,7 @@ CONFIG_NR_DRAM_BANKS=3D1
@@ -514,7 +514,7 @@ index 450d69762ab..350607892fa 100644
  CONFIG_SYS_BOOTM_LEN=3D0x800000
  CONFIG_SYS_LOAD_ADDR=3D0x82100000
  CONFIG_IDENT_STRING=3D" corstone1000 aarch64 "
-@@ -55,6 +55,9 @@ CONFIG_CMD_RTC=3Dy
+@@ -56,6 +56,9 @@ CONFIG_CMD_RTC=3Dy
  CONFIG_CMD_TIME=3Dy
  CONFIG_CMD_GETTIME=3Dy
  CONFIG_OF_CONTROL=3Dy
@@ -524,4 +524,3 @@ index 450d69762ab..350607892fa 100644
  CONFIG_VERSION_VARIABLE=3Dy
  CONFIG_NET_RANDOM_ETHADDR=3Dy
  CONFIG_REGMAP=3Dy
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-cor=
stone1000-dts-use-32-bit-cells-for-reserved-memor.patch b/meta-arm-bsp/re=
cipes-bsp/u-boot/u-boot/corstone1000/0038-corstone1000-dts-use-32-bit-cel=
ls-for-reserved-memor.patch
index 743b25474ffa..4dbbebc61408 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0038-corstone10=
00-dts-use-32-bit-cells-for-reserved-memor.patch
@@ -1,8 +1,7 @@
-From df01111a866a37fcf875b3c2e2394414d27c89da Mon Sep 17 00:00:00 2001
+From dd4db190281802141c4c787a9869f8153d93b1a4 Mon Sep 17 00:00:00 2001
 From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
 Date: Wed, 24 Sep 2025 13:42:25 +0000
-Subject: [PATCH] corstone1000: dts: use 32-bit cells for
- /reserved-memory node
+Subject: [PATCH] corstone1000: dts: use 32-bit cells for /reserved-memor=
y node
=20
 Switch the *reserved-memory* node from two-cell (64-bit) encoding to
 one-cell (32-bit) encoding and adjust the `reg` property accordingly
@@ -34,4 +33,3 @@ index a75bc7016aa..4ea6f1d9724 100644
  			no-map;
  		};
  	};
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-cor=
stone1000-a320-Add-Corstone1000-board-variant.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/corstone1000/0039-corstone1000-a320-Add-Corstone1000-=
board-variant.patch
index 5b2240ce2a71..85b736446550 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/corstone1000/0039-corstone10=
00-a320-Add-Corstone1000-board-variant.patch
@@ -1,4 +1,4 @@
-From da23886f3b38812c60a4597db129ab96df74bb99 Mon Sep 17 00:00:00 2001
+From 9b0a2622667bfe5794c77161d973d6f59871668c Mon Sep 17 00:00:00 2001
 From: Frazer Carsley <frazer.carsley@arm.com>
 Date: Wed, 25 Feb 2026 14:28:08 +0000
 Subject: [PATCH] corstone1000-a320: Add Corstone1000 board variant
@@ -400,7 +400,7 @@ index 00000000000..e62978b487e
 +F:	board/armltd/corstone1000-a320/
 +F:	configs/corstone1000-a320_defconfig
 diff --git a/board/armltd/corstone1000/corstone1000.c b/board/armltd/cor=
stone1000/corstone1000.c
-index db8919298e1..2f65eac7bf4 100644
+index db8919298e1..fe6929e94e0 100644
 --- a/board/armltd/corstone1000/corstone1000.c
 +++ b/board/armltd/corstone1000/corstone1000.c
 @@ -1,6 +1,6 @@
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpres=
s64-Imply-CONFIG_ARM64_CRC32-by-default.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/fvp-base/0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-defaul=
t.patch
index 5bb738982002..c36b616a6f1f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
@@ -1,4 +1,4 @@
-From 67b2bcd428a13d14d4311bd1122e664f391af4d4 Mon Sep 17 00:00:00 2001
+From 469d6ae6f7f0e6356457a50ab490b56e423e4e50 Mon Sep 17 00:00:00 2001
 From: Diego Sueiro <diego.sueiro@arm.com>
 Date: Wed, 4 Oct 2023 06:29:12 +0100
 Subject: [PATCH] vexpress64: Imply CONFIG_ARM64_CRC32 by default
@@ -15,7 +15,7 @@ Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
  2 files changed, 8 insertions(+), 6 deletions(-)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 9ef3fa1b379f..1a0e0a5018d8 100644
+index 9ef3fa1b379..1a0e0a5018d 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -24,6 +24,7 @@ config VEXPRESS64_BASE_MODEL
@@ -27,7 +27,7 @@ index 9ef3fa1b379f..1a0e0a5018d8 100644
  choice
  	prompt "VExpress64 board variant"
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 5eee13b3fc01..5c271d239501 100644
+index fc4727b4a38..01310ca0454 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
 @@ -172,7 +172,7 @@
@@ -39,9 +39,9 @@ index 5eee13b3fc01..5c271d239501 100644
  		"  setenv bootargs;"					\
  		"  abootimg addr ${boot_addr_r};"			\
  		"  abootimg get dtb --index=3D0 fdt_addr_r;"		\
-@@ -181,13 +181,14 @@
+@@ -180,13 +180,14 @@
+ 		"else"							\
  		"  if load hostfs - ${kernel_addr_r} ${kernel_name}; then"	\
- 		"    setenv fdt_high 0xffffffffffffffff;"		\
  		"    setenv initrd_high 0xffffffffffffffff;"		\
 -		"    if test -n load hostfs - ${fdt_addr_r} ${fdtfile}; then"			\
 -		"        fdt move $fdtcontroladdr $fdt_addr_r;"			\
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vex=
press-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/juno/0001-configs-vexpress-modify-to-boot-compressed-init=
ramfs.patch
index 7000d9131d62..d85a0b94947f 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
@@ -1,4 +1,4 @@
-From ddf8928e53830ddce9dc5383143dcab75b4a4cfb Mon Sep 17 00:00:00 2001
+From 9622b33133ddcd2da42fe41a6e5e52d7c7d5ccf8 Mon Sep 17 00:00:00 2001
 From: Jon Mason <jdmason@kudzu.us>
 Date: Mon, 19 Dec 2022 11:36:04 -0500
 Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
@@ -10,10 +10,10 @@ Upstream-Status: Inappropriate
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 5eee13b3fc01..82dff260c30c 100644
+index fc4727b4a38..2c83189923f 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
-@@ -213,8 +213,10 @@
+@@ -212,8 +212,10 @@
  #define VEXPRESS_RAMDISK_ADDR		0x8fe00000
 =20
  #define EXTRA_ENV_NAMES							\
--=20
2.50.1 (Apple Git-155)


