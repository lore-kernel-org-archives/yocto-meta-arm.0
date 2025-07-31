Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7207AC87FCC
	for <webhook@archiver.kernel.org>; Thu, 31 Jul 2025 18:08:22 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.69110.1753985294315015752
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 31 Jul 2025 11:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7BBEC1D13
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Jul 2025 11:08:05 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 569FF3F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 31 Jul 2025 11:08:13 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: update patches for v2025.07
Date: Thu, 31 Jul 2025 14:08:12 -0400
Message-Id: <20250731180812.79140-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 31 Jul 2025 18:08:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6652

Update the FVP base u-boot patches to apply cleanly to u-boot v2025.07.
Also, use a config fragment to change the default boot command to boot
virtio image.  This works around some changes in
include/configs/vexpress_aemv8.h that change the boot behavior, which is
not something we're using anyway.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc  |  1 +
 .../0001-vexpress64-Set-the-DM_RNG-property.patch    |  4 ++--
 ...002-vexpress64-Select-PSCI-RESET-by-default.patch | 12 ++++++------
 ...press64-Imply-CONFIG_ARM64_CRC32-by-default.patch |  4 ++--
 .../u-boot/u-boot/fvp-base/virtio-boot.cfg           |  1 +
 ...express-modify-to-boot-compressed-initramfs.patch |  6 +++---
 6 files changed, 15 insertions(+), 13 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/virti=
o-boot.cfg

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index 9aca993f5cbc..d7558f4ff456 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -1,6 +1,7 @@
 # FVP base specific U-boot support
=20
 SRC_URI:append =3D " \
+    file://virtio-boot.cfg \
     file://0001-vexpress64-Set-the-DM_RNG-property.patch \
     file://0002-vexpress64-Select-PSCI-RESET-by-default.patch \
     file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpres=
s64-Set-the-DM_RNG-property.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/fvp-base/0001-vexpress64-Set-the-DM_RNG-property.patch
index 8f053112899e..4912491fb68a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64-Set=
-the-DM_RNG-property.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64-Set=
-the-DM_RNG-property.patch
@@ -1,4 +1,4 @@
-From ddb132d10952366c359bdd04482c1a8c0ba08b8f Mon Sep 17 00:00:00 2001
+From 6813b56a11f423f3faa0e960bb044534e11d0104 Mon Sep 17 00:00:00 2001
 From: Debbie Martin <Debbie.Martin@arm.com>
 Date: Fri, 25 Aug 2023 15:09:33 +0100
 Subject: [PATCH] vexpress64: Set the DM_RNG property
@@ -15,7 +15,7 @@ Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index cf998096e45f..7ae5055f59b1 100644
+index 7e8709444fe3..f413c51ac43b 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -21,6 +21,7 @@ config VEXPRESS64_BASE_MODEL
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpres=
s64-Select-PSCI-RESET-by-default.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/fvp-base/0002-vexpress64-Select-PSCI-RESET-by-default.patch
index 1b00da48212a..822a308dd29a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64-Sel=
ect-PSCI-RESET-by-default.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64-Sel=
ect-PSCI-RESET-by-default.patch
@@ -1,4 +1,4 @@
-From fdf67502a8112bb54cb1d25657cb35a37035f3e9 Mon Sep 17 00:00:00 2001
+From ca70595913d7584605be1ea37362da25254fb829 Mon Sep 17 00:00:00 2001
 From: Diego Sueiro <diego.sueiro@arm.com>
 Date: Wed, 4 Oct 2023 06:31:50 +0100
 Subject: [PATCH] vexpress64: Select PSCI RESET by default
@@ -16,24 +16,24 @@ Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
  2 files changed, 2 insertions(+), 5 deletions(-)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 7ae5055f59b1..b8aead6cc35c 100644
+index f413c51ac43b..d0733ba62432 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -30,6 +30,8 @@ config TARGET_VEXPRESS64_BASE_FVP
  	bool "Support Versatile Express ARMv8a FVP BASE model"
  	select VEXPRESS64_BASE_MODEL
- 	imply OF_HAS_PRIOR_STAGE
+ 	imply OF_HAS_PRIOR_STAGE if !BLOBLIST
 +	select SYSRESET
 +	select SYSRESET_PSCI
 =20
  config TARGET_VEXPRESS64_BASER_FVP
  	bool "Support Versatile Express ARMv8r64 FVP BASE model"
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index ee65a596838a..f73de56464fa 100644
+index 0b75c1358f0b..e8f1c2fe9fe2 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
-@@ -207,11 +207,6 @@ void *board_fdt_blob_setup(int *err)
- }
+@@ -206,11 +206,6 @@ int board_fdt_blob_setup(void **fdtp)
+ #endif
  #endif
 =20
 -/* Actual reset is done via PSCI. */
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpres=
s64-Imply-CONFIG_ARM64_CRC32-by-default.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/fvp-base/0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-defaul=
t.patch
index ec3a2a3f61ec..5ebdda095dd4 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
@@ -1,4 +1,4 @@
-From 0b2c98baada9541af1595bb552b7e44d6b79c727 Mon Sep 17 00:00:00 2001
+From 9c98333d7c5f4c2611c76d60f5e7cb96bfdaca26 Mon Sep 17 00:00:00 2001
 From: Diego Sueiro <diego.sueiro@arm.com>
 Date: Wed, 4 Oct 2023 06:29:12 +0100
 Subject: [PATCH] vexpress64: Imply CONFIG_ARM64_CRC32 by default
@@ -14,7 +14,7 @@ Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index b8aead6cc35c..0c2e5f875950 100644
+index d0733ba62432..543cbdb5631b 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -22,6 +22,7 @@ config VEXPRESS64_BASE_MODEL
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/virtio-boot.=
cfg b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/virtio-boot.cfg
new file mode 100644
index 000000000000..4d7763653200
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/virtio-boot.cfg
@@ -0,0 +1 @@
+CONFIG_BOOTCOMMAND=3D"run virtio_boot"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vex=
press-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/juno/0001-configs-vexpress-modify-to-boot-compressed-init=
ramfs.patch
index bd2ed131af7b..7000d9131d62 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
@@ -1,4 +1,4 @@
-From 3d266a5d77c908566b1a541f3ff8b717f17a9a8a Mon Sep 17 00:00:00 2001
+From ddf8928e53830ddce9dc5383143dcab75b4a4cfb Mon Sep 17 00:00:00 2001
 From: Jon Mason <jdmason@kudzu.us>
 Date: Mon, 19 Dec 2022 11:36:04 -0500
 Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
@@ -10,10 +10,10 @@ Upstream-Status: Inappropriate
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 24d8ca086653..0935461340b7 100644
+index 5eee13b3fc01..82dff260c30c 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
-@@ -198,8 +198,10 @@
+@@ -213,8 +213,10 @@
  #define VEXPRESS_RAMDISK_ADDR		0x8fe00000
 =20
  #define EXTRA_ENV_NAMES							\
--=20
2.39.5 (Apple Git-154)


