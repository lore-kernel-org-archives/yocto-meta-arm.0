Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81CF2C71153
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 13:40:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.17629.1693316398231824933
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 06:39:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8F4C62F4
	for <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 06:40:36 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06F593F64C
	for <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 06:39:56 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/fvp-baser-aemv8r64: update u-boot to 2023.01
Date: Mon, 28 Aug 2023 11:30:21 -0500
Message-Id: <20230828163021.3683277-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 13:40:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5000

u-boot patches rebase cleanly to u-boot v2023.01.  Update to that and
get rid of the legacy version of u-boot that existed only for this
machine.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |  2 +-
 ...v8-Add-ARMv8-MPU-configuration-logic.patch | 14 +++++-----
 ...add-MPU-memory-map-for-the-BASER_FVP.patch |  8 +++---
 ...bling-exception-vectors-on-non-SPL-b.patch | 11 +++-----
 ...mv8-ARMV8_SWITCH_TO_EL1-improvements.patch | 14 +++++-----
 ...ling-HVC-configurable-when-switching.patch |  9 +++----
 ...press64-Do-not-set-COUNTER_FREQUENCY.patch |  8 +++---
 ...e-LIBFDT_OVERLAY-in-the-vexpress_aem.patch |  8 +++---
 ...RBAR-MPU-attributes-to-be-configured.patch | 10 +++----
 ...che-when-switching-exception-levels-.patch |  8 +++---
 .../recipes-bsp/u-boot/u-boot_2022.10.bb      | 26 -------------------
 11 files changed, 36 insertions(+), 82 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.10.bb

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 25ba3c84..7d2eaf9b 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -9,7 +9,7 @@ require conf/machine/include/arm/armv8r/arch-armv8r64.inc
 EXTRA_IMAGEDEPENDS +=3D "boot-wrapper-aarch64"
=20
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-yocto"
-PREFERRED_VERSION_u-boot ?=3D "2022.10"
+PREFERRED_VERSION_u-boot ?=3D "2023.01"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
01-armv8-Add-ARMv8-MPU-configuration-logic.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv8-Add-ARMv8-MPU-configuratio=
n-logic.patch
index dd6b77d3..45db74e1 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
@@ -1,7 +1,7 @@
-From e90aa7853ae32cb03c86249a6c572ec88cdebaa2 Mon Sep 17 00:00:00 2001
+From 401a88bf6019941d4095476de76af5893686d6f6 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 26 May 2021 17:41:10 +0100
-Subject: [PATCH 1/9] armv8: Add ARMv8 MPU configuration logic
+Subject: [PATCH] armv8: Add ARMv8 MPU configuration logic
=20
 Detect whether an MMU is present at the current exception level. If
 not, initialize the MPU instead of the MMU during init, and clear the
@@ -19,6 +19,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I0ee3879f9d7f03fe940664b3551c68eeaa458d17
+
 ---
  arch/arm/cpu/armv8/cache_v8.c    | 101 ++++++++++++++++++++++++++++++-
  arch/arm/include/asm/armv8/mpu.h |  59 ++++++++++++++++++
@@ -27,7 +28,7 @@ Change-Id: I0ee3879f9d7f03fe940664b3551c68eeaa458d17
  create mode 100644 arch/arm/include/asm/armv8/mpu.h
=20
 diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
-index e4736e5643..798aed8058 100644
+index 2a226fd063..8611a35eb3 100644
 --- a/arch/arm/cpu/armv8/cache_v8.c
 +++ b/arch/arm/cpu/armv8/cache_v8.c
 @@ -15,6 +15,7 @@
@@ -145,8 +146,8 @@ index e4736e5643..798aed8058 100644
 +		}
  	}
 =20
- 	set_sctlr(get_sctlr() | CR_C);
-@@ -519,7 +610,11 @@ void dcache_disable(void)
+ 	/* Set up page tables only once (it is done also by mmu_setup()) */
+@@ -523,7 +614,11 @@ void dcache_disable(void)
  	set_sctlr(sctlr & ~(CR_C|CR_M));
 =20
  	flush_dcache_all();
@@ -254,6 +255,3 @@ index 87d1c77e8b..4510db98a2 100644
  /*
   * ID_AA64PFR0_EL1 bits definitions
   */
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
02-vexpress64-add-MPU-memory-map-for-the-BASER_FVP.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexpress64-add-MPU-memor=
y-map-for-the-BASER_FVP.patch
index b8cab45e..103e4847 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexp=
ress64-add-MPU-memory-map-for-the-BASER_FVP.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-vexp=
ress64-add-MPU-memory-map-for-the-BASER_FVP.patch
@@ -1,7 +1,7 @@
-From 181f5efb401ffaa5ab0898b07a976796f75e502a Mon Sep 17 00:00:00 2001
+From 5b42322cb57692dbea7d2c39fd8769b6f0f6b7af Mon Sep 17 00:00:00 2001
 From: Qi Feng <qi.feng@arm.com>
 Date: Tue, 26 Jul 2022 18:13:23 +0800
-Subject: [PATCH 2/9] vexpress64: add MPU memory map for the BASER_FVP
+Subject: [PATCH] vexpress64: add MPU memory map for the BASER_FVP
=20
 The previous patch added support for initializing an Armv8 MPU. There is=
 only an
 MPU at S-EL2 on the BASER_FVP, so add a platform-specific MPU memory map=
.
@@ -12,6 +12,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Signed-off-by: Qi Feng <qi.feng@arm.com>
+
 ---
  board/armltd/vexpress64/vexpress64.c | 22 ++++++++++++++++++++++
  1 file changed, 22 insertions(+)
@@ -56,6 +57,3 @@ index af326dc6f4..2310d18eb7 100644
  static struct mm_region vexpress64_mem_map[] =3D {
  	{
  		.virt =3D V2M_PA_BASE,
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
03-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv8-Allow-disabli=
ng-exception-vectors-on-non-SPL-b.patch
index caabf804..5953abc6 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
@@ -1,8 +1,7 @@
-From 07cc3e4af3def76d92faf39712d4fd8717b21d2b Mon Sep 17 00:00:00 2001
+From ffb0f72a67926c3053308cf03420bc0c36675d42 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 11:41:19 +0000
-Subject: [PATCH 3/9] armv8: Allow disabling exception vectors on non-SPL
- builds
+Subject: [PATCH] armv8: Allow disabling exception vectors on non-SPL bui=
lds
=20
 On the BASER_FVP, U-Boot shares EL2 with another bootloader, so we do
 not wish to overide the exception vector, but we are also not using an
@@ -19,6 +18,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I0cf0fc6d7ef4d45791411cf1f67c65e198cc8b2b
+
 ---
  arch/arm/cpu/armv8/Kconfig        | 10 ++++++++--
  arch/arm/cpu/armv8/Makefile       |  6 ++----
@@ -72,7 +72,7 @@ index 2e4bf9e038..001a31cae7 100644
  endif
  obj-y	+=3D tlb.o
 diff --git a/arch/arm/cpu/armv8/start.S b/arch/arm/cpu/armv8/start.S
-index 28f0df13f0..f831e77af3 100644
+index f3ea858577..7fad901336 100644
 --- a/arch/arm/cpu/armv8/start.S
 +++ b/arch/arm/cpu/armv8/start.S
 @@ -104,7 +104,7 @@ pie_skip_reloc:
@@ -102,6 +102,3 @@ index 495eb1dee3..683d983c36 100644
  # CONFIG_MMC is not set
  CONFIG_VIRTIO_MMIO=3Dy
 +CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
04-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv8-ARMV8_SWITCH_TO_EL1-improve=
ments.patch
index 81758fce..157a15d7 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
@@ -1,7 +1,7 @@
-From 30405f59881c73946b6b0ffdbf25804f9fbf1585 Mon Sep 17 00:00:00 2001
+From 14e204ffca5870d6bfd238627937a2028c88589d Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 14 Jul 2021 12:44:27 +0100
-Subject: [PATCH 4/9] armv8: ARMV8_SWITCH_TO_EL1 improvements
+Subject: [PATCH] armv8: ARMV8_SWITCH_TO_EL1 improvements
=20
 Convert CONFIG_ARMV8_SWITCH_TO_EL1 to a Kconfig variable.
=20
@@ -16,6 +16,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: If98478148d6d8d1f732acac5439276700614815f
+
 ---
  arch/arm/cpu/armv8/exception_level.c | 21 ++++++++++++++--
  arch/arm/lib/bootm.c                 | 36 ++++++++++++++++------------
@@ -66,7 +67,7 @@ index b11936548f..4aad1550f4 100644
  	}
  }
 diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
-index 9f086f3b90..b044aeca88 100644
+index e414ef8267..9a86c17d2a 100644
 --- a/arch/arm/lib/bootm.c
 +++ b/arch/arm/lib/bootm.c
 @@ -270,7 +270,6 @@ __weak void update_os_arch_secondary_cores(uint8_t o=
s_arch)
@@ -84,8 +85,8 @@ index 9f086f3b90..b044aeca88 100644
 -#endif
 =20
  /* Subcommand: GO */
- static void boot_jump_linux(bootm_headers_t *images, int flag)
-@@ -312,21 +310,29 @@ static void boot_jump_linux(bootm_headers_t *image=
s, int flag)
+ static void boot_jump_linux(struct bootm_headers *images, int flag)
+@@ -312,21 +310,29 @@ static void boot_jump_linux(struct bootm_headers *=
images, int flag)
 =20
  		update_os_arch_secondary_cores(images->os.arch);
 =20
@@ -137,6 +138,3 @@ index 683d983c36..6044f82b00 100644
  CONFIG_VIRTIO_MMIO=3Dy
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
 +CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
05-armv8-Make-disabling-HVC-configurable-when-switching.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv8-Make-disablin=
g-HVC-configurable-when-switching.patch
index f64db3bf..82926cc3 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
@@ -1,8 +1,7 @@
-From a6daca56b77d7f1b26483f10eb33ebdd6e157d3e Mon Sep 17 00:00:00 2001
+From e3d24bc1fd0b09915b5181de1282f7008bbf776f Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Fri, 10 Dec 2021 16:37:26 +0000
-Subject: [PATCH 5/9] armv8: Make disabling HVC configurable when switchi=
ng to
- EL1
+Subject: [PATCH] armv8: Make disabling HVC configurable when switching t=
o EL1
=20
 On the BASER_FVP there is no EL3, so HVC is used to provide PSCI
 services. Therefore we cannot disable hypercalls.
@@ -15,6 +14,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: I463d82f1db8a3cafcab40a9c0c208753569cc300
+
 ---
  arch/arm/cpu/armv8/Kconfig        |  9 +++++++++
  arch/arm/include/asm/macro.h      | 10 ++++++++--
@@ -78,6 +78,3 @@ index 6044f82b00..6226f6b2c1 100644
  CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
  CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
 +CONFIG_ARMV8_DISABLE_HVC=3Dn
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
06-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexpress64-Do-not-set-COUNTER_FR=
EQUENCY.patch
index ebbc939c..eb2273e5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
@@ -1,7 +1,7 @@
-From 862d3f1ac66a75cdf48adbdebd8adbaf671a9366 Mon Sep 17 00:00:00 2001
+From 571f44d5292cfead6f68bf4c6c9519872337bfd0 Mon Sep 17 00:00:00 2001
 From: Qi Feng <qi.feng@arm.com>
 Date: Thu, 28 Jul 2022 17:47:18 +0800
-Subject: [PATCH 6/9] vexpress64: Do not set COUNTER_FREQUENCY
+Subject: [PATCH] vexpress64: Do not set COUNTER_FREQUENCY
=20
 VExpress boards normally run as a second-stage bootloader so should not
 need to modify CNTFRQ_EL0. On the BASER_FVP, U-Boot can modify it if
@@ -13,6 +13,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Signed-off-by: Qi Feng <qi.feng@arm.com>
+
 ---
  configs/vexpress_aemv8r_defconfig | 1 -
  1 file changed, 1 deletion(-)
@@ -27,6 +28,3 @@ index 6226f6b2c1..b902a6a7d9 100644
  CONFIG_ARCH_VEXPRESS64=3Dy
  CONFIG_NR_DRAM_BANKS=3D2
  CONFIG_DEFAULT_DEVICE_TREE=3D"arm_fvp"
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
07-vexpress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexpress64-Enable-L=
IBFDT_OVERLAY-in-the-vexpress_aem.patch
index 8c09ed2b..6f5bfa38 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-vexp=
ress64-Enable-LIBFDT_OVERLAY-in-the-vexpress_aem.patch
@@ -1,7 +1,7 @@
-From 32beea722c1167c9b33f1ecfdc28d360cabd6823 Mon Sep 17 00:00:00 2001
+From df01346bb63c821cf8e73202e2894ceda9cb692b Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Tue, 22 Feb 2022 15:32:51 +0000
-Subject: [PATCH 7/9] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_a=
emv8r
+Subject: [PATCH] vexpress64: Enable LIBFDT_OVERLAY in the vexpress_aemv8=
r
  defconfig
=20
 Issue-Id: SCM-3874
@@ -9,6 +9,7 @@ Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Change-Id: Ide0532cf2de89f1bca9c8d4bd2ed0c1a1c57599f
+
 ---
  configs/vexpress_aemv8r_defconfig | 1 +
  1 file changed, 1 insertion(+)
@@ -22,6 +23,3 @@ index b902a6a7d9..a58a9db385 100644
  CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
  CONFIG_ARMV8_DISABLE_HVC=3Dn
 +CONFIG_OF_LIBFDT_OVERLAY=3Dy
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
08-armv8-Allow-PRBAR-MPU-attributes-to-be-configured.patch b/meta-arm-bsp=
/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv8-Allow-PRBAR-MPU-=
attributes-to-be-configured.patch
index 8be14ee8..61bdf928 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-Allow-PRBAR-MPU-attributes-to-be-configured.patch
@@ -1,7 +1,7 @@
-From 01490ab8deb0f0b61eeb55a02ee5ea430cfe7eee Mon Sep 17 00:00:00 2001
+From 665ab8253a0e3e17db54a1682bbee0f5659939a2 Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Wed, 18 May 2022 15:24:19 +0100
-Subject: [PATCH 8/9] armv8: Allow PRBAR MPU attributes to be configured
+Subject: [PATCH] armv8: Allow PRBAR MPU attributes to be configured
=20
 In a previous patch, support was added to initialize an S-EL2 MPU on
 armv8r64 machines. This implementation allowed the PRLAR attribute
@@ -21,6 +21,7 @@ Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Change-Id: I6b72aead91ad12412262aa32c61a53e12eab3984
+
 ---
  arch/arm/cpu/armv8/cache_v8.c        | 12 ++++++++----
  arch/arm/include/asm/armv8/mpu.h     |  3 ++-
@@ -28,7 +29,7 @@ Change-Id: I6b72aead91ad12412262aa32c61a53e12eab3984
  3 files changed, 16 insertions(+), 8 deletions(-)
=20
 diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
-index 798aed8058..e336339281 100644
+index 8611a35eb3..f7de952187 100644
 --- a/arch/arm/cpu/armv8/cache_v8.c
 +++ b/arch/arm/cpu/armv8/cache_v8.c
 @@ -390,7 +390,9 @@ static void mpu_clear_regions(void)
@@ -100,6 +101,3 @@ index 2310d18eb7..531fa4d618 100644
  	}, {
  		/* List terminator */
  		0,
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
09-armv8-Enable-icache-when-switching-exception-levels-.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv8-Enable-icache=
-when-switching-exception-levels-.patch
index 0e0a2481..a4bc746e 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Enable-icache-when-switching-exception-levels-.patch
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-Enable-icache-when-switching-exception-levels-.patch
@@ -1,7 +1,7 @@
-From 0f15f6b02825b042ddc1d753f62cf87f30b1fe12 Mon Sep 17 00:00:00 2001
+From c7301588a3aec9ebf36749da601d0d6e3d807bfc Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Thu, 19 May 2022 09:02:32 +0100
-Subject: [PATCH 9/9] armv8: Enable icache when switching exception level=
s in
+Subject: [PATCH] armv8: Enable icache when switching exception levels in
  bootefi
=20
 bootefi calls the function switch_to_non_secure_mode before calling the
@@ -26,6 +26,7 @@ Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
 Upstream-Status: Inappropriate [other]
   Implementation pending further discussion
 Change-Id: I678cd5ba39b56e124ab7854608289cd14651ce65
+
 ---
  arch/arm/cpu/armv8/exception_level.c | 3 +++
  1 file changed, 3 insertions(+)
@@ -58,6 +59,3 @@ index 4aad1550f4..0a3e5428e7 100644
  		/* Move into EL1 and keep running there */
  		armv8_switch_to_el1((uintptr_t)&non_secure_jmp, 0, 0, 0,
  				    (uintptr_t)entry_non_secure, ES_TO_AARCH64);
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.10.bb b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_2022.10.bb
deleted file mode 100644
index 905ae552..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2022.10.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-HOMEPAGE =3D "http://www.denx.de/wiki/U-Boot/WebHome"
-DESCRIPTION =3D "U-Boot, a boot loader for Embedded boards based on Powe=
rPC, \
-ARM, MIPS and several other processors, which can be installed in a boot=
 \
-ROM and used to initialize and test the hardware or to download and run =
\
-application code."
-SECTION =3D "bootloaders"
-DEPENDS +=3D "flex-native bison-native"
-
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://Licenses/README;md5=3D2ca5f2c35c8cc335f0a19=
756634782f1"
-PE =3D "1"
-
-# We use the revision in order to avoid having to fetch it from the
-# repo during parse
-SRCREV =3D "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
-
-SRC_URI =3D "git://git.denx.de/u-boot.git;branch=3Dmaster \
-          "
-
-S =3D "${WORKDIR}/git"
-B =3D "${WORKDIR}/build"
-do_configure[cleandirs] =3D "${B}"
-
-require recipes-bsp/u-boot/u-boot.inc
-
-DEPENDS +=3D "bc-native dtc-native gnutls-native"
--=20
2.30.2


