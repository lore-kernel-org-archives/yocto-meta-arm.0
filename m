Return-Path: <debbie.martin@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5500EC0032E
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 12:39:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.53139.1697805581173989587
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 05:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: debbie.martin@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B02862F4
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:40:21 -0700 (PDT)
Received: from e127725.arm.com (unknown [10.57.36.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2DB2D3F5A1
	for <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 05:39:39 -0700 (PDT)
From: Debbie Martin <Debbie.Martin@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/5] arm-bsp/u-boot/fvp-base: Configure FVP base U-boot machine and enable U-boot sysreset, CRC-32 and virtio RNG
Date: Fri, 20 Oct 2023 13:38:26 +0100
Message-Id: <20231020123827.346193-3-Debbie.Martin@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020123827.346193-1-Debbie.Martin@arm.com>
References: <20231020123827.346193-1-Debbie.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Oct 2023 12:39:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5156

Configure FVP base to use vexpress_fvp_defconfig as the U-boot machine.

Configure U-boot:
1. Drop the patch to pick the DRAM size from the devicetree since
   the FVP now specifies a devicetree.
2. Enable sysreset to reset by PSCI and patch the vexpress U-boot
machine to leave the reset to PSCI in this case.
3. Enable Virtio RNG and patch the U-boot Virtio RNG driver to
workaround an issue with the FVP that results in RNG calls
hanging.
4. Enable the Arm64 CRC-32 instruction by default and remove the now
   redundant config setting.

Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  2 +-
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  5 +-
 ...rt-vexpress64-pick-DRAM-size-from-DT.patch | 44 ----------------
 ...round-for-FVP-returning-zero-size-bu.patch | 49 +++++++++++++++++
 ...2-vexpress64-Set-the-DM_RNG-property.patch | 31 +++++++++++
 ...press64-Select-PSCI-RESET-by-default.patch | 52 +++++++++++++++++++
 ...-Imply-CONFIG_ARM64_CRC32-by-default.patch | 31 +++++++++++
 .../u-boot/u-boot/fvp-base/bootargs.cfg       |  2 -
 8 files changed, 168 insertions(+), 48 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-=
Revert-vexpress64-pick-DRAM-size-from-DT.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-=
virtio-rng-Workaround-for-FVP-returning-zero-size-bu.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-=
vexpress64-Set-the-DM_RNG-property.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-=
vexpress64-Select-PSCI-RESET-by-default.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-=
vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index cc0893fa..940a4330 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -21,7 +21,7 @@ KERNEL_IMAGETYPE =3D "Image"
 EXTRA_IMAGEDEPENDS +=3D "trusted-firmware-a"
=20
 # FVP u-boot configuration
-UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
+UBOOT_MACHINE =3D "vexpress_fvp_defconfig"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index 21046724..e1fcb1f2 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -1,5 +1,8 @@
 # FVP base specific U-boot support
=20
 SRC_URI:append =3D " file://bootargs.cfg \
-    file://0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch \
+    file://0001-virtio-rng-Workaround-for-FVP-returning-zero-size-bu.pat=
ch \
+    file://0002-vexpress64-Set-the-DM_RNG-property.patch \
+    file://0003-vexpress64-Select-PSCI-RESET-by-default.patch \
+    file://0004-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-Revert-=
vexpress64-pick-DRAM-size-from-DT.patch b/meta-arm-bsp/recipes-bsp/u-boot=
/u-boot/fvp-base/0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch
deleted file mode 100644
index d5516224..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-Revert-vexpres=
s64-pick-DRAM-size-from-DT.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 4f649e0a3e0f9ed1f0d6efdff5b14cdc40d84201 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jon.mason@arm.com
-Date: Thu, 2 Mar 2023 15:22:08 +0000
-Subject: [PATCH] Revert "vexpress64: pick DRAM size from DT"
-
-This reverts commit 1a1143a45457161e90ea4cd5f3b0561d924ed8fe.
-
-DRAM is determined via dtb in recent versions.  Since fvp isn't
-reading and specifying a dtb, this fails and hangs u-boot.  Remove this
-and go back to the way things were.
-
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-Upstream-Status: Inappropriate
----
- board/armltd/vexpress64/vexpress64.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index af326dc6f453..e8ce88b22c5a 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -88,12 +88,20 @@ int board_init(void)
-=20
- int dram_init(void)
- {
--	return fdtdec_setup_mem_size_base();
-+	gd->ram_size =3D PHYS_SDRAM_1_SIZE;
-+	return 0;
- }
-=20
- int dram_init_banksize(void)
- {
--	return fdtdec_setup_memory_banksize();
-+	gd->bd->bi_dram[0].start =3D PHYS_SDRAM_1;
-+	gd->bd->bi_dram[0].size =3D PHYS_SDRAM_1_SIZE;
-+#ifdef PHYS_SDRAM_2
-+	gd->bd->bi_dram[1].start =3D PHYS_SDRAM_2;
-+	gd->bd->bi_dram[1].size =3D PHYS_SDRAM_2_SIZE;
-+#endif
-+
-+	return 0;
- }
-=20
- /* Assigned in lowlevel_init.S
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-virtio-=
rng-Workaround-for-FVP-returning-zero-size-bu.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/fvp-base/0001-virtio-rng-Workaround-for-FVP-returning=
-zero-size-bu.patch
new file mode 100644
index 00000000..689361d1
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-virtio-rng-Wor=
karound-for-FVP-returning-zero-size-bu.patch
@@ -0,0 +1,49 @@
+From 3ab73b453016d91b9f942a7c12173854135530a4 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Wed, 23 Aug 2023 21:17:17 +0100
+Subject: [PATCH] virtio: rng: Workaround for FVP returning zero-size buf=
fer
+
+The FVP virtio-rng device is observed to always 8 fewer bytes of random
+data than requested. When 8 of fewer bytes are requested, the FVP
+returns 0 bytes. This causes U-Boot to hang upon attempting to fill the
+last 8 bytes of the input buffer.
+
+The virtio spec states than entropy devices must always return at least
+1 byte of random data.
+
+To workaround this, always request exactly 16 bytes from the virtio
+device, discarding any unused data.
+
+Upstream-Status: Inappropriate [Temporary workaround]
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+---
+ drivers/virtio/virtio_rng.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/virtio/virtio_rng.c b/drivers/virtio/virtio_rng.c
+index b85545c2ee5..1e4fc342406 100644
+--- a/drivers/virtio/virtio_rng.c
++++ b/drivers/virtio/virtio_rng.c
+@@ -29,7 +29,7 @@ static int virtio_rng_read(struct udevice *dev, void *=
data, size_t len)
+
+ 	while (len) {
+ 		sg.addr =3D buf;
+-		sg.length =3D min(len, sizeof(buf));
++		sg.length =3D sizeof(buf);
+ 		sgs[0] =3D &sg;
+
+ 		ret =3D virtqueue_add(priv->rng_vq, sgs, 0, 1);
+@@ -44,8 +44,8 @@ static int virtio_rng_read(struct udevice *dev, void *=
data, size_t len)
+ 		if (rsize > sg.length)
+ 			return -EIO;
+
+-		memcpy(ptr, buf, rsize);
+-		len -=3D rsize;
++		memcpy(ptr, buf, min(len, (size_t)rsize));
++		len -=3D min(len, (size_t)rsize);
+ 		ptr +=3D rsize;
+ 	}
+
+--
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpres=
s64-Set-the-DM_RNG-property.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/fvp-base/0002-vexpress64-Set-the-DM_RNG-property.patch
new file mode 100644
index 00000000..2f99eaf8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64-Set=
-the-DM_RNG-property.patch
@@ -0,0 +1,31 @@
+From 9a28caf05b8345cd19276cf7a840599bd9e37749 Mon Sep 17 00:00:00 2001
+From: Debbie Martin <Debbie.Martin@arm.com>
+Date: Fri, 25 Aug 2023 15:09:33 +0100
+Subject: [PATCH] vexpress64: Set the DM_RNG property
+
+Enable the DM_RNG virtio random number generator driver in
+in order to consume entropy within u-boot. This is necessary
+in the case that the kernel is not configured to enable the
+virtio rng driver itself.
+
+Upstream-Status: Pending
+Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
+---
+ board/armltd/vexpress64/Kconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
+index cf998096e4..7ae5055f59 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -21,6 +21,7 @@ config VEXPRESS64_BASE_MODEL
+ 	imply EFI_SET_TIME if DM_RTC
+ 	select LINUX_KERNEL_IMAGE_HEADER
+ 	select POSITION_INDEPENDENT
++	imply DM_RNG
+
+ choice
+ 	prompt "VExpress64 board variant"
+--
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpres=
s64-Select-PSCI-RESET-by-default.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/fvp-base/0003-vexpress64-Select-PSCI-RESET-by-default.patch
new file mode 100644
index 00000000..9d9a5bdf
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Sel=
ect-PSCI-RESET-by-default.patch
@@ -0,0 +1,52 @@
+From 43881e2e9dd165a65791927b1455f4b6c8727f4c Mon Sep 17 00:00:00 2001
+Message-Id: <43881e2e9dd165a65791927b1455f4b6c8727f4c.1696397516.git.die=
go.sueiro@arm.com>
+In-Reply-To: <98035c418c3df58817ab678037599303842ee931.1696397516.git.di=
ego.sueiro@arm.com>
+References: <98035c418c3df58817ab678037599303842ee931.1696397516.git.die=
go.sueiro@arm.com>
+From: Diego Sueiro <diego.sueiro@arm.com>
+Date: Wed, 4 Oct 2023 06:31:50 +0100
+Subject: [PATCH 2/2] vexpress64: Select PSCI RESET by default
+
+Set SYSRESET and SYSRESET_PSCI config for vexpress64 by=20
+by default. This means that the reset_cpu function in
+vexpress64.c is no longer needed because it is called in
+sysreset-uclass.c instead.
+
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ board/armltd/vexpress64/Kconfig      | 2 ++
+ board/armltd/vexpress64/vexpress64.c | 5 -----
+ 2 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
+index 0d161740fb..0c2e5f8759 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -31,6 +31,8 @@ config TARGET_VEXPRESS64_BASE_FVP
+ 	bool "Support Versatile Express ARMv8a FVP BASE model"
+ 	select VEXPRESS64_BASE_MODEL
+ 	imply OF_HAS_PRIOR_STAGE
++	select SYSRESET
++	select SYSRESET_PSCI
+=20
+ config TARGET_VEXPRESS64_BASER_FVP
+ 	bool "Support Versatile Express ARMv8r64 FVP BASE model"
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index ee65a59683..f73de56464 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -207,11 +207,6 @@ void *board_fdt_blob_setup(int *err)
+ }
+ #endif
+=20
+-/* Actual reset is done via PSCI. */
+-void reset_cpu(void)
+-{
+-}
+-
+ /*
+  * Board specific ethernet initialization routine.
+  */
+--=20
+2.39.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-vexpres=
s64-Imply-CONFIG_ARM64_CRC32-by-default.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/fvp-base/0004-vexpress64-Imply-CONFIG_ARM64_CRC32-by-defaul=
t.patch
new file mode 100644
index 00000000..3d10994b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
@@ -0,0 +1,31 @@
+From 98035c418c3df58817ab678037599303842ee931 Mon Sep 17 00:00:00 2001
+Message-Id: <98035c418c3df58817ab678037599303842ee931.1696397516.git.die=
go.sueiro@arm.com>
+From: Diego Sueiro <diego.sueiro@arm.com>
+Date: Wed, 4 Oct 2023 06:29:12 +0100
+Subject: [PATCH 1/2] vexpress64: Imply CONFIG_ARM64_CRC32 by default
+
+Enable the Arm64 CRC-32 instruction by default for=20
+vexpress64. The CRC-32 instruction is a required=20
+feature of ARMv8.1 and newer.=20
+
+Upstream-Status: Pending
+Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
+---
+ board/armltd/vexpress64/Kconfig | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
+index 7ae5055f59..0d161740fb 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -22,6 +22,7 @@ config VEXPRESS64_BASE_MODEL
+ 	select LINUX_KERNEL_IMAGE_HEADER
+ 	select POSITION_INDEPENDENT
+ 	imply DM_RNG
++	imply ARM64_CRC32
+=20
+ choice
+ 	prompt "VExpress64 board variant"
+--=20
+2.39.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg=
 b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
index 13f4cb47..2cf42a53 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/bootargs.cfg
@@ -1,4 +1,2 @@
 CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 root=3D=
/dev/vda1 rw rootwait"
 CONFIG_BOOTCOMMAND=3D"booti $kernel_addr_r - $fdt_addr_r"
-# Our FVP support CRC instructions
-CONFIG_ARM64_CRC32=3Dy
--=20
2.25.1


