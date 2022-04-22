Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90037C636C9
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.10744.1650643784494331190
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A3101FB;
	Fri, 22 Apr 2022 09:09:44 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.95.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5300C3F5A1;
	Fri, 22 Apr 2022 09:09:43 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 5/6] arm-bsp/u-boot: Fix fvp-baser-aemv8r64 fdt memory
 configuration issue
Date: Fri, 22 Apr 2022 17:08:59 +0100
Message-Id: <20220422160900.1861031-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422160900.1861031-1-peter.hoyes@arm.com>
References: <20220422160900.1861031-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3290

From: Peter Hoyes <Peter.Hoyes@arm.com>

Add additional fvp-baser-aemv8r64-specific patch for U-Boot, which fixes
an issue where U-Boot was ignoring the `memory` node in the device tree.

Issue-Id: SCM-4386
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I1382992fffa159c4bd6325db4f1b26c6478cf391
---
 .../documentation/fvp-baser-aemv8r64.md       |  2 +
 ...4-Configure-memory-using-device-tree.patch | 88 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  1 +
 3 files changed, 91 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0012-vexpress64-Configure-memory-using-device-tree.patch

diff --git a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md b/meta-arm-=
bsp/documentation/fvp-baser-aemv8r64.md
index 4cd18f0..2638502 100644
--- a/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
+++ b/meta-arm-bsp/documentation/fvp-baser-aemv8r64.md
@@ -234,6 +234,8 @@ Known Issues and Limitations
=20
 Change Log
 ----------
+- Fixed bug in U-Boot that caused changes to the `memory` node in the de=
vice
+  tree to be ignored.
 - Added boot-wrapper-aarch64 support for booting SMP payloads at S-EL2.
 - Enabled testimage support by default.
 - Added virtio\_rng to improve random number generation.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
12-vexpress64-Configure-memory-using-device-tree.patch b/meta-arm-bsp/rec=
ipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0012-vexpress64-Configure-memor=
y-using-device-tree.patch
new file mode 100644
index 0000000..f9b422a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0012-vexp=
ress64-Configure-memory-using-device-tree.patch
@@ -0,0 +1,88 @@
+From 90db3d923adcade13d9a8aa50305e5c9c32737af Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Thu, 17 Feb 2022 17:02:34 +0000
+Subject: [PATCH 1/2] vexpress64: Configure memory using device tree
+
+The memory size and memory banks were previously configured statically,
+using #defines in the vexpress header file, which could conflict with
+the information in the device tree. Instead, use
+fdtdec_setup_mem_size_base() to configure the RAM size and
+fdtdec_setup_memory_banksize() to set up the memory banks.
+
+Issue-Id: SCM-3874
+Upstream-Status: Inappropriate [other]
+  Implementation pending further discussion
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I4add8258cb99dac87f078435272410b562b6fdc7
+---
+ board/armltd/vexpress64/vexpress64.c | 14 ++------------
+ include/configs/vexpress_aemv8.h     | 17 -----------------
+ 2 files changed, 2 insertions(+), 29 deletions(-)
+
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index 270618a0ff..3f1ac04bac 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -24,8 +24,6 @@
+ #include <virtio.h>
+ #endif
+=20
+-DECLARE_GLOBAL_DATA_PTR;
+-
+ static const struct pl01x_serial_plat serial_plat =3D {
+ 	.base =3D V2M_UART0,
+ 	.type =3D TYPE_PL011,
+@@ -128,20 +126,12 @@ int board_init(void)
+=20
+ int dram_init(void)
+ {
+-	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
+-	return 0;
++	return fdtdec_setup_mem_size_base();
+ }
+=20
+ int dram_init_banksize(void)
+ {
+-	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
+-	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
+-#ifdef PHYS_SDRAM_2
+-	gd->bd->bi_dram[1].start =3D PHYS_SDRAM_2;
+-	gd->bd->bi_dram[1].size =3D PHYS_SDRAM_2_SIZE;
+-#endif
+-
+-	return 0;
++	return fdtdec_setup_memory_banksize();
+ }
+=20
+ /* Assigned in lowlevel_init.S
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index a9086879c9..15a1ae60bf 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -106,23 +106,6 @@
+ /* BOOTP options */
+ #define CONFIG_BOOTP_BOOTFILESIZE
+=20
+-/* Miscellaneous configurable options */
+-
+-/* Physical Memory Map */
+-#define PHYS_SDRAM_1			(V2M_BASE)	/* SDRAM Bank #1 */
+-/* Top 16MB reserved for secure world use */
+-#define DRAM_SEC_SIZE		0x01000000
+-#define PHYS_SDRAM_1_SIZE	0x80000000 - DRAM_SEC_SIZE
+-#define CONFIG_SYS_SDRAM_BASE	PHYS_SDRAM_1
+-
+-#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+-#define PHYS_SDRAM_2			(0x880000000)
+-#define PHYS_SDRAM_2_SIZE		0x180000000
+-#elif CONFIG_NR_DRAM_BANKS =3D=3D 2
+-#define PHYS_SDRAM_2			(0x880000000)
+-#define PHYS_SDRAM_2_SIZE		0x80000000
+-#endif
+-
+ /* Enable memtest */
+=20
+ /* Initial environment variables */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 879b4a7..db395fe 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -71,6 +71,7 @@ SRC_URI:append:fvp-baser-aemv8r64 =3D " \
     file://0009-armv8-Make-disabling-HVC-configurable-when-switching.pat=
ch \
     file://0010-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch \
     file://0011-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
+    file://0012-vexpress64-Configure-memory-using-device-tree.patch \
     "
=20
 #
--=20
2.25.1


