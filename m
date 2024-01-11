Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F13DC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 15:08:41 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13560.1704985711343271874
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Jan 2024 07:08:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 705D72F4
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jan 2024 07:09:16 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 72F353F5A1
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Jan 2024 07:08:30 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/u-boot: rebase patches for v2024.01
Date: Thu, 11 Jan 2024 10:08:23 -0500
Message-Id: <20240111150823.3576-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Jan 2024 15:08:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5329

Rebase the fvp-base and juno patches for v2024.01.  One patch was
upstreamed and thus dropped.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../recipes-bsp/u-boot/u-boot-fvp-base.inc    |  7 ++-
 ...-vexpress64-Set-the-DM_RNG-property.patch} |  9 ++--
 ...round-for-FVP-returning-zero-size-bu.patch | 49 -------------------
 ...ress64-Select-PSCI-RESET-by-default.patch} | 18 +++----
 ...Imply-CONFIG_ARM64_CRC32-by-default.patch} | 16 +++---
 ...-modify-to-boot-compressed-initramfs.patch |  6 +--
 6 files changed, 21 insertions(+), 84 deletions(-)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/{0002-vexpress64-=
Set-the-DM_RNG-property.patch =3D> 0001-vexpress64-Set-the-DM_RNG-propert=
y.patch} (88%)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-=
virtio-rng-Workaround-for-FVP-returning-zero-size-bu.patch
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/{0003-vexpress64-=
Select-PSCI-RESET-by-default.patch =3D> 0002-vexpress64-Select-PSCI-RESET=
-by-default.patch} (67%)
 rename meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/{0004-vexpress64-=
Imply-CONFIG_ARM64_CRC32-by-default.patch =3D> 0003-vexpress64-Imply-CONF=
IG_ARM64_CRC32-by-default.patch} (59%)

diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc b/meta-a=
rm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
index b766181bedea..9aca993f5cbc 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot-fvp-base.inc
@@ -1,8 +1,7 @@
 # FVP base specific U-boot support
=20
 SRC_URI:append =3D " \
-    file://0001-virtio-rng-Workaround-for-FVP-returning-zero-size-bu.pat=
ch \
-    file://0002-vexpress64-Set-the-DM_RNG-property.patch \
-    file://0003-vexpress64-Select-PSCI-RESET-by-default.patch \
-    file://0004-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
+    file://0001-vexpress64-Set-the-DM_RNG-property.patch \
+    file://0002-vexpress64-Select-PSCI-RESET-by-default.patch \
+    file://0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-default.patch \
     "
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpres=
s64-Set-the-DM_RNG-property.patch b/meta-arm-bsp/recipes-bsp/u-boot/u-boo=
t/fvp-base/0001-vexpress64-Set-the-DM_RNG-property.patch
similarity index 88%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress=
64-Set-the-DM_RNG-property.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64=
-Set-the-DM_RNG-property.patch
index 2f99eaf87cd3..8f053112899e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64-Set=
-the-DM_RNG-property.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-vexpress64-Set=
-the-DM_RNG-property.patch
@@ -1,4 +1,4 @@
-From 9a28caf05b8345cd19276cf7a840599bd9e37749 Mon Sep 17 00:00:00 2001
+From ddb132d10952366c359bdd04482c1a8c0ba08b8f Mon Sep 17 00:00:00 2001
 From: Debbie Martin <Debbie.Martin@arm.com>
 Date: Fri, 25 Aug 2023 15:09:33 +0100
 Subject: [PATCH] vexpress64: Set the DM_RNG property
@@ -15,7 +15,7 @@ Signed-off-by: Debbie Martin <Debbie.Martin@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index cf998096e4..7ae5055f59 100644
+index cf998096e45f..7ae5055f59b1 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -21,6 +21,7 @@ config VEXPRESS64_BASE_MODEL
@@ -23,9 +23,6 @@ index cf998096e4..7ae5055f59 100644
  	select LINUX_KERNEL_IMAGE_HEADER
  	select POSITION_INDEPENDENT
 +	imply DM_RNG
-
+=20
  choice
  	prompt "VExpress64 board variant"
---
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-virtio-=
rng-Workaround-for-FVP-returning-zero-size-bu.patch b/meta-arm-bsp/recipe=
s-bsp/u-boot/u-boot/fvp-base/0001-virtio-rng-Workaround-for-FVP-returning=
-zero-size-bu.patch
deleted file mode 100644
index 689361d1d332..000000000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0001-virtio-rng-Wor=
karound-for-FVP-returning-zero-size-bu.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 3ab73b453016d91b9f942a7c12173854135530a4 Mon Sep 17 00:00:00 2001
-From: Peter Hoyes <Peter.Hoyes@arm.com>
-Date: Wed, 23 Aug 2023 21:17:17 +0100
-Subject: [PATCH] virtio: rng: Workaround for FVP returning zero-size buf=
fer
-
-The FVP virtio-rng device is observed to always 8 fewer bytes of random
-data than requested. When 8 of fewer bytes are requested, the FVP
-returns 0 bytes. This causes U-Boot to hang upon attempting to fill the
-last 8 bytes of the input buffer.
-
-The virtio spec states than entropy devices must always return at least
-1 byte of random data.
-
-To workaround this, always request exactly 16 bytes from the virtio
-device, discarding any unused data.
-
-Upstream-Status: Inappropriate [Temporary workaround]
-Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
----
- drivers/virtio/virtio_rng.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/drivers/virtio/virtio_rng.c b/drivers/virtio/virtio_rng.c
-index b85545c2ee5..1e4fc342406 100644
---- a/drivers/virtio/virtio_rng.c
-+++ b/drivers/virtio/virtio_rng.c
-@@ -29,7 +29,7 @@ static int virtio_rng_read(struct udevice *dev, void *=
data, size_t len)
-
- 	while (len) {
- 		sg.addr =3D buf;
--		sg.length =3D min(len, sizeof(buf));
-+		sg.length =3D sizeof(buf);
- 		sgs[0] =3D &sg;
-
- 		ret =3D virtqueue_add(priv->rng_vq, sgs, 0, 1);
-@@ -44,8 +44,8 @@ static int virtio_rng_read(struct udevice *dev, void *=
data, size_t len)
- 		if (rsize > sg.length)
- 			return -EIO;
-
--		memcpy(ptr, buf, rsize);
--		len -=3D rsize;
-+		memcpy(ptr, buf, min(len, (size_t)rsize));
-+		len -=3D min(len, (size_t)rsize);
- 		ptr +=3D rsize;
- 	}
-
---
-2.34.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpres=
s64-Select-PSCI-RESET-by-default.patch b/meta-arm-bsp/recipes-bsp/u-boot/=
u-boot/fvp-base/0002-vexpress64-Select-PSCI-RESET-by-default.patch
similarity index 67%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress=
64-Select-PSCI-RESET-by-default.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64=
-Select-PSCI-RESET-by-default.patch
index 9d9a5bdfd1bd..1b00da48212a 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Sel=
ect-PSCI-RESET-by-default.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0002-vexpress64-Sel=
ect-PSCI-RESET-by-default.patch
@@ -1,12 +1,9 @@
-From 43881e2e9dd165a65791927b1455f4b6c8727f4c Mon Sep 17 00:00:00 2001
-Message-Id: <43881e2e9dd165a65791927b1455f4b6c8727f4c.1696397516.git.die=
go.sueiro@arm.com>
-In-Reply-To: <98035c418c3df58817ab678037599303842ee931.1696397516.git.di=
ego.sueiro@arm.com>
-References: <98035c418c3df58817ab678037599303842ee931.1696397516.git.die=
go.sueiro@arm.com>
+From fdf67502a8112bb54cb1d25657cb35a37035f3e9 Mon Sep 17 00:00:00 2001
 From: Diego Sueiro <diego.sueiro@arm.com>
 Date: Wed, 4 Oct 2023 06:31:50 +0100
-Subject: [PATCH 2/2] vexpress64: Select PSCI RESET by default
+Subject: [PATCH] vexpress64: Select PSCI RESET by default
=20
-Set SYSRESET and SYSRESET_PSCI config for vexpress64 by=20
+Set SYSRESET and SYSRESET_PSCI config for vexpress64 by
 by default. This means that the reset_cpu function in
 vexpress64.c is no longer needed because it is called in
 sysreset-uclass.c instead.
@@ -19,10 +16,10 @@ Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
  2 files changed, 2 insertions(+), 5 deletions(-)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 0d161740fb..0c2e5f8759 100644
+index 7ae5055f59b1..b8aead6cc35c 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
-@@ -31,6 +31,8 @@ config TARGET_VEXPRESS64_BASE_FVP
+@@ -30,6 +30,8 @@ config TARGET_VEXPRESS64_BASE_FVP
  	bool "Support Versatile Express ARMv8a FVP BASE model"
  	select VEXPRESS64_BASE_MODEL
  	imply OF_HAS_PRIOR_STAGE
@@ -32,7 +29,7 @@ index 0d161740fb..0c2e5f8759 100644
  config TARGET_VEXPRESS64_BASER_FVP
  	bool "Support Versatile Express ARMv8r64 FVP BASE model"
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index ee65a59683..f73de56464 100644
+index ee65a596838a..f73de56464fa 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
 @@ -207,11 +207,6 @@ void *board_fdt_blob_setup(int *err)
@@ -47,6 +44,3 @@ index ee65a59683..f73de56464 100644
  /*
   * Board specific ethernet initialization routine.
   */
---=20
-2.39.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-vexpres=
s64-Imply-CONFIG_ARM64_CRC32-by-default.patch b/meta-arm-bsp/recipes-bsp/=
u-boot/u-boot/fvp-base/0003-vexpress64-Imply-CONFIG_ARM64_CRC32-by-defaul=
t.patch
similarity index 59%
rename from meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-vexpress=
64-Imply-CONFIG_ARM64_CRC32-by-default.patch
rename to meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64=
-Imply-CONFIG_ARM64_CRC32-by-default.patch
index 3d10994b60cd..ec3a2a3f61ec 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0004-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base/0003-vexpress64-Imp=
ly-CONFIG_ARM64_CRC32-by-default.patch
@@ -1,12 +1,11 @@
-From 98035c418c3df58817ab678037599303842ee931 Mon Sep 17 00:00:00 2001
-Message-Id: <98035c418c3df58817ab678037599303842ee931.1696397516.git.die=
go.sueiro@arm.com>
+From 0b2c98baada9541af1595bb552b7e44d6b79c727 Mon Sep 17 00:00:00 2001
 From: Diego Sueiro <diego.sueiro@arm.com>
 Date: Wed, 4 Oct 2023 06:29:12 +0100
-Subject: [PATCH 1/2] vexpress64: Imply CONFIG_ARM64_CRC32 by default
+Subject: [PATCH] vexpress64: Imply CONFIG_ARM64_CRC32 by default
=20
-Enable the Arm64 CRC-32 instruction by default for=20
-vexpress64. The CRC-32 instruction is a required=20
-feature of ARMv8.1 and newer.=20
+Enable the Arm64 CRC-32 instruction by default for
+vexpress64. The CRC-32 instruction is a required
+feature of ARMv8.1 and newer.
=20
 Upstream-Status: Pending
 Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
@@ -15,7 +14,7 @@ Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
  1 file changed, 1 insertion(+)
=20
 diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 7ae5055f59..0d161740fb 100644
+index b8aead6cc35c..0c2e5f875950 100644
 --- a/board/armltd/vexpress64/Kconfig
 +++ b/board/armltd/vexpress64/Kconfig
 @@ -22,6 +22,7 @@ config VEXPRESS64_BASE_MODEL
@@ -26,6 +25,3 @@ index 7ae5055f59..0d161740fb 100644
 =20
  choice
  	prompt "VExpress64 board variant"
---=20
-2.39.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vex=
press-modify-to-boot-compressed-initramfs.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/juno/0001-configs-vexpress-modify-to-boot-compressed-init=
ramfs.patch
index 0967df76dd87..bd2ed131af7b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/juno/0001-configs-vexpress-m=
odify-to-boot-compressed-initramfs.patch
@@ -1,4 +1,4 @@
-From 726f8b4dbd3c5b1873aad531d5e26af3acd9b9ca Mon Sep 17 00:00:00 2001
+From 3d266a5d77c908566b1a541f3ff8b717f17a9a8a Mon Sep 17 00:00:00 2001
 From: Jon Mason <jdmason@kudzu.us>
 Date: Mon, 19 Dec 2022 11:36:04 -0500
 Subject: [PATCH] configs: vexpress: modify to boot compressed initramfs
@@ -10,10 +10,10 @@ Upstream-Status: Inappropriate
  1 file changed, 3 insertions(+), 1 deletion(-)
=20
 diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index 0c11b6b3331e..4ba4bebfbbae 100644
+index 24d8ca086653..0935461340b7 100644
 --- a/include/configs/vexpress_aemv8.h
 +++ b/include/configs/vexpress_aemv8.h
-@@ -192,8 +192,10 @@
+@@ -198,8 +198,10 @@
  #define VEXPRESS_RAMDISK_ADDR		0x8fe00000
 =20
  #define EXTRA_ENV_NAMES							\
--=20
2.39.3 (Apple Git-145)


