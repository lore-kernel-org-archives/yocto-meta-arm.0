Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C899C6FD1A
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 16:17:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19593.1678205816358968042
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 08:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 205912F4
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 08:17:39 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 957FE3F67D
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 08:16:55 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm-bsp/fvp-base: update to u-boot 2023.01
Date: Tue,  7 Mar 2023 11:16:48 -0500
Message-Id: <20230307161650.476217-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Mar 2023 16:17:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4477

Update to the latest version of u-boot.  This requires removing the new
way DRAM is handled, since we don't use dtb the way u-boot is expecting.
Also, change the default bootcmd to make things work (as that expects
env things as well).

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  2 +-
 ...rt-vexpress64-pick-DRAM-size-from-DT.patch | 44 +++++++++++++++++++
 .../u-boot/u-boot/fvp-base/bootargs.cfg       |  1 +
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  4 +-
 4 files changed, 49 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-=
Revert-vexpress64-pick-DRAM-size-from-DT.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 1ba07082..bc29e888 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -9,7 +9,7 @@ require conf/machine/include/arm/arch-armv8a.inc
=20
 TUNE_FEATURES =3D "aarch64"
=20
-PREFERRED_VERSION_u-boot ?=3D "2022.04"
+PREFERRED_VERSION_u-boot ?=3D "2023.01"
=20
 # FVP u-boot configuration
 UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-Revert-=
vexpress64-pick-DRAM-size-from-DT.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/fvp-base/0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch
new file mode 100644
index 00000000..d5516224
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-Revert-vexpres=
s64-pick-DRAM-size-from-DT.patch
@@ -0,0 +1,44 @@
+From 4f649e0a3e0f9ed1f0d6efdff5b14cdc40d84201 Mon Sep 17 00:00:00 2001
+From: Jon Mason <jon.mason@arm.com
+Date: Thu, 2 Mar 2023 15:22:08 +0000
+Subject: [PATCH] Revert "vexpress64: pick DRAM size from DT"
+
+This reverts commit 1a1143a45457161e90ea4cd5f3b0561d924ed8fe.
+
+DRAM is determined via dtb in recent versions.  Since fvp isn't
+reading and specifying a dtb, this fails and hangs u-boot.  Remove this
+and go back to the way things were.
+
+Signed-off-by: Jon Mason <jon.mason@arm.com>
+Upstream-Status: Inappropriate
+---
+ board/armltd/vexpress64/vexpress64.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index af326dc6f453..e8ce88b22c5a 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -88,12 +88,20 @@ int board_init(void)
+=20
+ int dram_init(void)
+ {
+-	return fdtdec_setup_mem_size_base();
++	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
++	return 0;
+ }
+=20
+ int dram_init_banksize(void)
+ {
+-	return fdtdec_setup_memory_banksize();
++	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
++	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
++#ifdef PHYS_SDRAM_2
++	gd->bd->bi_dram[1].start =3D PHYS_SDRAM_2;
++	gd->bd->bi_dram[1].size =3D PHYS_SDRAM_2_SIZE;
++#endif
++
++	return 0;
+ }
+=20
+ /* Assigned in lowlevel_init.S
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg=
 b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
index 716600f4..13f4cb47 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
@@ -1,3 +1,4 @@
 CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 root=3D=
/dev/vda1 rw rootwait"
+CONFIG_BOOTCOMMAND=3D"booti $kernel_addr_r - $fdt_addr_r"
 # Our FVP support CRC instructions
 CONFIG_ARM64_CRC32=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 9cc1bcd9..10ba76ae 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -49,7 +49,9 @@ SRC_URI:append:corstone1000 =3D " \
 #
 # FVP BASE
 #
-SRC_URI:append:fvp-base =3D " file://bootargs.cfg"
+SRC_URI:append:fvp-base =3D " file://bootargs.cfg \
+	file://0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch \
+	"
=20
 #
 # FVP BASE ARM32
--=20
2.25.1


