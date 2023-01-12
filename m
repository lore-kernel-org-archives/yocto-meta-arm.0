Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEFEC678D5
	for <webhook@archiver.kernel.org>; Thu, 12 Jan 2023 11:03:07 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.52247.1673521384807408410
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jan 2023 03:03:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92D9C1063;
	Thu, 12 Jan 2023 03:03:46 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5B883F67D;
	Thu, 12 Jan 2023 03:03:03 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 08/10] arm-bsp/fvp-baser-aemv8r64: Rebase u-boot patches onto v2022.10
Date: Thu, 12 Jan 2023 11:02:55 +0000
Message-Id: <20230112110257.2070363-8-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230112110257.2070363-1-ross.burton@arm.com>
References: <20230112110257.2070363-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jan 2023 11:03:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4271

From: Qi Feng <qi.feng@arm.com>

* 0004-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch

  config ARMV8_SWITCH_TO_EL1 already exists in upstream.

Signed-off-by: Qi Feng <qi.feng@arm.com>
Issue-Id: SCM-4874
Change-Id: I690484a031bc7bfa1c9a0d8a145271874b26239a
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |  2 +-
 ...add-MPU-memory-map-for-the-BASER_FVP.patch |  4 +--
 ...bling-exception-vectors-on-non-SPL-b.patch | 12 +++----
 ...mv8-ARMV8_SWITCH_TO_EL1-improvements.patch | 34 +++++--------------
 ...ling-HVC-configurable-when-switching.patch | 14 ++++----
 ...press64-Do-not-set-COUNTER_FREQUENCY.patch |  4 +--
 ...e-LIBFDT_OVERLAY-in-the-vexpress_aem.patch |  6 ++--
 ...RBAR-MPU-attributes-to-be-configured.patch |  4 +--
 8 files changed, 31 insertions(+), 49 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index e3f5bfb3..0c2ea122 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -9,7 +9,7 @@ require conf/machine/include/arm/armv8r/arch-armv8r64.inc
 EXTRA_IMAGEDEPENDS +=3D "boot-wrapper-aarch64"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_u-boot ?=3D "2022.07"
+PREFERRED_VERSION_u-boot ?=3D "2022.10"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
02-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexpress64-add-MPU-memor=
y-map-for-the-BASER_FVP.patch
index f405457f..b8cab45e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexp=
ress64-add-MPU-memory-map-for-the-BASER_FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexp=
ress64-add-MPU-memory-map-for-the-BASER_FVP.patch
@@ -1,4 +1,4 @@
-From 80c64d0c035a5cd0cb23c7b01be39f25e15c7193 Mon Sep 17 00:00:00 2001
+From 181f5efb401ffaa5ab0898b07a976796f75e502a Mon Sep 17 00:00:00 2001
 From: Qi Feng <qi.feng@arm.com>
 Date: Tue, 26 Jul 2022 18:13:23 +0800
 Subject: [PATCH 2/9] vexpress64: add MPU memory map for the BASER_FVP
@@ -17,7 +17,7 @@ Signed-off-by: Qi Feng <qi.feng@arm.com>
  1 file changed, 22 insertions(+)
=20
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 709ebf3fb0..1791cd986f 100644
+index af326dc6f4..2310d18eb7 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
 @@ -19,6 +19,7 @@
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
03-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv8-Allow-disabli=
ng-exception-vectors-on-non-SPL-b.patch
index e6ccc174..caabf804 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
@@ -1,4 +1,4 @@
-From 61a2df4467c13bbc83bff8a3429e9ebb4b957b56 Mon Sep 17 00:00:00 2001
+From 07cc3e4af3def76d92faf39712d4fd8717b21d2b Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 11:41:19 +0000
 Subject: [PATCH 3/9] armv8: Allow disabling exception vectors on non-SPL
@@ -27,7 +27,7 @@ Change-Id: I0cf0fc6d7ef4d45791411cf1f67c65e198cc8b2b
  4 files changed, 13 insertions(+), 8 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 09f3f50fa2..031faa909c 100644
+index 1305238c9d..dec4be0e30 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
 @@ -1,8 +1,8 @@
@@ -55,7 +55,7 @@ index 09f3f50fa2..031faa909c 100644
          bool "Enable multiple CPUs to enter into U-Boot"
 =20
 diff --git a/arch/arm/cpu/armv8/Makefile b/arch/arm/cpu/armv8/Makefile
-index 85fe0475c8..8b3f695835 100644
+index 2e4bf9e038..001a31cae7 100644
 --- a/arch/arm/cpu/armv8/Makefile
 +++ b/arch/arm/cpu/armv8/Makefile
 @@ -13,10 +13,8 @@ ifndef CONFIG_$(SPL_)SYS_DCACHE_OFF
@@ -94,11 +94,11 @@ index 28f0df13f0..f831e77af3 100644
  	adr	x0, vectors
  	switch_el x1, 3f, 2f, 1f
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index a1c5d88717..1d5b7411f0 100644
+index 495eb1dee3..683d983c36 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -13,3 +13,4 @@ CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,=
0x9c090000 rootfstype=3Dext4 root=3D
- CONFIG_SYS_PROMPT=3D"VExpress64# "
+@@ -16,3 +16,4 @@ CONFIG_SYS_CBSIZE=3D512
+ CONFIG_SYS_PBSIZE=3D541
  # CONFIG_MMC is not set
  CONFIG_VIRTIO_MMIO=3Dy
 +CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
04-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv8-ARMV8_SWITCH_TO_EL1-improve=
ments.patch
index 84f6b4bb..81758fce 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
@@ -1,4 +1,4 @@
-From dbc1a218e9837e39cd50dd3c19f603f29a08ddba Mon Sep 17 00:00:00 2001
+From 30405f59881c73946b6b0ffdbf25804f9fbf1585 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 14 Jul 2021 12:44:27 +0100
 Subject: [PATCH 4/9] armv8: ARMV8_SWITCH_TO_EL1 improvements
@@ -17,29 +17,11 @@ Upstream-Status: Inappropriate [other]
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: If98478148d6d8d1f732acac5439276700614815f
 ---
- arch/arm/cpu/armv8/Kconfig           |  8 +++++++
  arch/arm/cpu/armv8/exception_level.c | 21 ++++++++++++++--
  arch/arm/lib/bootm.c                 | 36 ++++++++++++++++------------
  configs/vexpress_aemv8r_defconfig    |  1 +
- 4 files changed, 49 insertions(+), 17 deletions(-)
+ 3 files changed, 41 insertions(+), 17 deletions(-)
=20
-diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 031faa909c..110adf63b3 100644
---- a/arch/arm/cpu/armv8/Kconfig
-+++ b/arch/arm/cpu/armv8/Kconfig
-@@ -191,4 +191,12 @@ config ARMV8_EA_EL3_FIRST
- 	  Exception handling at all exception levels for External Abort and
- 	  SError interrupt exception are taken in EL3.
-=20
-+config ARMV8_SWITCH_TO_EL1
-+	bool "Switch to EL1 before booting the operating system"
-+	default n
-+	help
-+	  Switch to EL1 before booting the operating system, if for example th=
e
-+	  operating system does not support booting at EL2, or you wish to pre=
vent
-+	  any hypervisors from running. Supported for bootm, booti and bootefi=
.
-+
- endif
 diff --git a/arch/arm/cpu/armv8/exception_level.c b/arch/arm/cpu/armv8/e=
xception_level.c
 index b11936548f..4aad1550f4 100644
 --- a/arch/arm/cpu/armv8/exception_level.c
@@ -84,10 +66,10 @@ index b11936548f..4aad1550f4 100644
  	}
  }
 diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
-index a59a5e6c0e..e2cf2e6ec4 100644
+index 9f086f3b90..b044aeca88 100644
 --- a/arch/arm/lib/bootm.c
 +++ b/arch/arm/lib/bootm.c
-@@ -272,7 +272,6 @@ __weak void update_os_arch_secondary_cores(uint8_t o=
s_arch)
+@@ -270,7 +270,6 @@ __weak void update_os_arch_secondary_cores(uint8_t o=
s_arch)
  {
  }
 =20
@@ -95,7 +77,7 @@ index a59a5e6c0e..e2cf2e6ec4 100644
  static void switch_to_el1(void)
  {
  	if ((IH_ARCH_DEFAULT =3D=3D IH_ARCH_ARM64) &&
-@@ -287,7 +286,6 @@ static void switch_to_el1(void)
+@@ -285,7 +284,6 @@ static void switch_to_el1(void)
  				    ES_TO_AARCH64);
  }
  #endif
@@ -103,7 +85,7 @@ index a59a5e6c0e..e2cf2e6ec4 100644
 =20
  /* Subcommand: GO */
  static void boot_jump_linux(bootm_headers_t *images, int flag)
-@@ -314,21 +312,29 @@ static void boot_jump_linux(bootm_headers_t *image=
s, int flag)
+@@ -312,21 +310,29 @@ static void boot_jump_linux(bootm_headers_t *image=
s, int flag)
 =20
  		update_os_arch_secondary_cores(images->os.arch);
 =20
@@ -147,10 +129,10 @@ index a59a5e6c0e..e2cf2e6ec4 100644
  #else
  	unsigned long machid =3D gd->bd->bi_arch_number;
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 1d5b7411f0..35e5e8a5e1 100644
+index 683d983c36..6044f82b00 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -14,3 +14,4 @@ CONFIG_SYS_PROMPT=3D"VExpress64# "
+@@ -17,3 +17,4 @@ CONFIG_SYS_PBSIZE=3D541
  # CONFIG_MMC is not set
  CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
05-armv8-Make-disabling-HVC-configurable-when-switching.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv8-Make-disablin=
g-HVC-configurable-when-switching.patch
index b5460268..f64db3bf 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
@@ -1,4 +1,4 @@
-From f75060be04aaed4bb5a07cb40361d694b3775f4a Mon Sep 17 00:00:00 2001
+From a6daca56b77d7f1b26483f10eb33ebdd6e157d3e Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 16:37:26 +0000
 Subject: [PATCH 5/9] armv8: Make disabling HVC configurable when switchi=
ng to
@@ -22,12 +22,12 @@ Change-Id: I463d82f1db8a3cafcab40a9c0c208753569cc300
  3 files changed, 18 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
-index 110adf63b3..a821e219d8 100644
+index dec4be0e30..95c03487a2 100644
 --- a/arch/arm/cpu/armv8/Kconfig
 +++ b/arch/arm/cpu/armv8/Kconfig
-@@ -199,4 +199,13 @@ config ARMV8_SWITCH_TO_EL1
- 	  operating system does not support booting at EL2, or you wish to pre=
vent
- 	  any hypervisors from running. Supported for bootm, booti and bootefi=
.
+@@ -208,4 +208,13 @@ config ARMV8_CE_SHA256
+=20
+ endif
 =20
 +config ARMV8_DISABLE_HVC
 +	bool "Disable HVC calls before switching to EL1"
@@ -70,10 +70,10 @@ index 1a1edc9870..7167739210 100644
 =20
  	/* Return to AArch32 Supervisor mode from EL2 */
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 35e5e8a5e1..605a724a61 100644
+index 6044f82b00..6226f6b2c1 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -15,3 +15,4 @@ CONFIG_SYS_PROMPT=3D"VExpress64# "
+@@ -18,3 +18,4 @@ CONFIG_SYS_PBSIZE=3D541
  CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
  CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
06-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexpress64-Do-not-set-COUNTER_FR=
EQUENCY.patch
index ca99d0e6..ebbc939c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
@@ -1,4 +1,4 @@
-From db7d4cc91ae19d0cbd05c0ff1b9bf6a55ac0d04a Mon Sep 17 00:00:00 2001
+From 862d3f1ac66a75cdf48adbdebd8adbaf671a9366 Mon Sep 17 00:00:00 2001
 From: Qi Feng <qi.feng@arm.com>
 Date: Thu, 28 Jul 2022 17:47:18 +0800
 Subject: [PATCH 6/9] vexpress64: Do not set COUNTER_FREQUENCY
@@ -18,7 +18,7 @@ Signed-off-by: Qi Feng <qi.feng@arm.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 605a724a61..153fa14efc 100644
+index 6226f6b2c1..b902a6a7d9 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
 @@ -1,5 +1,4 @@
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
07-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexpress64-Enable-L=
IBFDT_OVERLAY-in-the-vexpress_aem.patch
index 467fb406..8c09ed2b 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
@@ -1,4 +1,4 @@
-From f4986ed954ffad36abfa27db5520e702cba2531e Mon Sep 17 00:00:00 2001
+From 32beea722c1167c9b33f1ecfdc28d360cabd6823 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Tue, 22 Feb 2022 15:32:51 +0000
 Subject: [PATCH 7/9] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
@@ -14,10 +14,10 @@ Change-Id: Ide0532cf2de89f1bca9c8d4bd2ed0c1a1c57599f
  1 file changed, 1 insertion(+)
=20
 diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
-index 153fa14efc..94651768b3 100644
+index b902a6a7d9..a58a9db385 100644
 --- a/configs/vexpress_aemv8r_defconfig
 +++ b/configs/vexpress_aemv8r_defconfig
-@@ -15,3 +15,4 @@ CONFIG_VIRTIO_MMIO=3Dy
+@@ -18,3 +18,4 @@ CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
  CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
  CONFIG_ARMV8_DISABLE_HVC=3Dn
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
08-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv8-Allow-PRBAR-MPU-=
attributes-to-be-configured.patch
index 4b6daf8d..8be14ee8 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
@@ -1,4 +1,4 @@
-From af05764e7b64e0704291ba2e71138f2345737afa Mon Sep 17 00:00:00 2001
+From 01490ab8deb0f0b61eeb55a02ee5ea430cfe7eee Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 18 May 2022 15:24:19 +0100
 Subject: [PATCH 8/9] armv8: Allow PRBAR MPU attributes to be configured
@@ -75,7 +75,7 @@ index 8de627cafd..dd4c689ea6 100644
 =20
  extern struct mpu_region *mpu_mem_map;
 diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 1791cd986f..7858521fec 100644
+index 2310d18eb7..531fa4d618 100644
 --- a/board/armltd/vexpress64/vexpress64.c
 +++ b/board/armltd/vexpress64/vexpress64.c
 @@ -42,15 +42,18 @@ static struct mpu_region vexpress64_aemv8r_mem_map[]=
 =3D {
--=20
2.34.1


