Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A851C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:37:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11952.1677163023028242410
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4A1691FB
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:45 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 28F043F881
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:02 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm/boot-wrapper-aarch64: update to a newer SHA
Date: Thu, 23 Feb 2023 09:36:53 -0500
Message-Id: <20230223143657.424913-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4447

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...abels-and-prepare-for-lower-EL-booti.patch | 14 +++++++-------
 ...0002-aarch64-Prepare-for-EL1-booting.patch |  8 ++++----
 ...aarch64-Prepare-for-lower-EL-booting.patch | 12 ++++++------
 ...04-gic-v3-Prepare-for-gicv3-with-EL2.patch |  2 +-
 ...aarch64-Prepare-for-booting-with-EL2.patch |  6 +++---
 ...ce-EL2-boot-code-for-Armv8-R-AArch64.patch | 14 +++++++-------
 ...e-psci-to-choose-between-smc-and-hvc.patch |  4 ++--
 ...4-Disable-CNTPCT_EL0-trap-for-v8-R64.patch |  6 +++---
 .../0009-lds-Mark-the-mem-range.patch         |  2 +-
 .../0010-common-Introduce-the-libfdt.patch    |  2 +-
 ...-common-Add-essential-libc-functions.patch |  2 +-
 ...dd-the-libfdt-to-the-Makefile-system.patch | 12 ++++++------
 .../0013-platform-Add-print_hex-func.patch    |  2 +-
 ...4-common-Add-mem-usage-to-memreserve.patch |  4 ++--
 ...dd-the-enable-keep-el-compile-option.patch | 10 +++++-----
 ...efile-Change-COUNTER_FREQ-to-100-MHz.patch |  7 ++-----
 ...lush-cache-after-setting-branch_data.patch |  5 +----
 ...8-PSCI-Add-function-call-entry-point.patch |  5 +----
 ...-lds-Rearrange-and-mark-the-sections.patch |  5 +----
 ...n-Provide-firmware-info-using-libfdt.patch |  5 +----
 ...-Enable-firmware-node-initialization.patch | 19 ++++++++-----------
 .../boot-wrapper-aarch64_git.bb               |  2 +-
 22 files changed, 65 insertions(+), 83 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patc=
h b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r6=
4/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patch
index 566070a4..31fd5152 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patch
@@ -1,4 +1,4 @@
-From 3e7cfbe39a2a053d2a6b0d928cc172ed9d1c6da8 Mon Sep 17 00:00:00 2001
+From 545f6950ae4dc55b4974986aa9629adb16eaf4e1 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 May 2021 07:25:00 +0100
 Subject: [PATCH] aarch64: Rename labels and prepare for lower EL booting
@@ -18,10 +18,10 @@ Signed-off-by: Jaxson Han <jaxson.han@arm.com>
  3 files changed, 27 insertions(+), 14 deletions(-)
=20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index 27ba449..84e1646 100644
+index d682ba5..fab694e 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -21,18 +21,30 @@ ASM_FUNC(_start)
+@@ -34,18 +34,30 @@ ASM_FUNC(_start)
 =20
  	/*
  	 * EL3 initialisation
@@ -56,7 +56,7 @@ index 27ba449..84e1646 100644
  	orr	x0, x0, #(1 << 0)		// Non-secure EL1
  	orr	x0, x0, #(1 << 8)		// HVC enable
 =20
-@@ -124,7 +136,7 @@ ASM_FUNC(_start)
+@@ -145,7 +157,7 @@ ASM_FUNC(_start)
 =20
  	bl	gic_secure_init
 =20
@@ -65,7 +65,7 @@ index 27ba449..84e1646 100644
 =20
  err_invalid_id:
  	b	.
-@@ -151,7 +163,7 @@ ASM_FUNC(jump_kernel)
+@@ -172,7 +184,7 @@ ASM_FUNC(jump_kernel)
  	bl	find_logical_id
  	bl	setup_stack		// Reset stack pointer
 =20
@@ -74,7 +74,7 @@ index 27ba449..84e1646 100644
  	cmp	w0, #0			// Prepare Z flag
 =20
  	mov	x0, x20
-@@ -160,7 +172,7 @@ ASM_FUNC(jump_kernel)
+@@ -181,7 +193,7 @@ ASM_FUNC(jump_kernel)
  	mov	x3, x23
 =20
  	b.eq	1f
@@ -83,7 +83,7 @@ index 27ba449..84e1646 100644
 =20
  1:	mov	x4, #SPSR_KERNEL
 =20
-@@ -178,5 +190,5 @@ ASM_FUNC(jump_kernel)
+@@ -199,5 +211,5 @@ ASM_FUNC(jump_kernel)
 =20
  	.data
  	.align 3
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0002-aarch64-Prepare-for-EL1-booting.patch b/meta-arm-bsp/reci=
pes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-aarch64-Prepar=
e-for-EL1-booting.patch
index 46447b8f..4ef4507e 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0002-aarch64-Prepare-for-EL1-booting.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0002-aarch64-Prepare-for-EL1-booting.patch
@@ -1,4 +1,4 @@
-From 26f9b5354c2de9cc052531096ff92b04c3a3846f Mon Sep 17 00:00:00 2001
+From bad32d3fc127a421be416b17e4f7d6d514f06abb Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 May 2021 07:25:00 +0100
 Subject: [PATCH] aarch64: Prepare for EL1 booting
@@ -15,10 +15,10 @@ Reviewed-by: Andre Przywara <andre.przywara@arm.com>
  2 files changed, 6 insertions(+), 1 deletion(-)
=20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index 84e1646..b589744 100644
+index fab694e..5105b41 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -156,10 +156,14 @@ ASM_FUNC(jump_kernel)
+@@ -177,10 +177,14 @@ ASM_FUNC(jump_kernel)
  	ldr	x0, =3DSCTLR_EL1_KERNEL
  	msr	sctlr_el1, x0
 =20
@@ -35,7 +35,7 @@ index 84e1646..b589744 100644
  	bl	setup_stack		// Reset stack pointer
 =20
 diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/c=
pu.h
-index 63eb1c3..b1003f4 100644
+index 49d3f86..3767da3 100644
 --- a/arch/aarch64/include/asm/cpu.h
 +++ b/arch/aarch64/include/asm/cpu.h
 @@ -11,6 +11,7 @@
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0003-aarch64-Prepare-for-lower-EL-booting.patch b/meta-arm-bsp=
/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0003-aarch64-P=
repare-for-lower-EL-booting.patch
index db81355b..c621187b 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0003-aarch64-Prepare-for-lower-EL-booting.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0003-aarch64-Prepare-for-lower-EL-booting.patch
@@ -1,4 +1,4 @@
-From ce628de7699dd6401ddf713efaa49872e2733619 Mon Sep 17 00:00:00 2001
+From 252cbd36e51414b60ab68306f9c38e358709494d Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 May 2021 07:25:00 +0100
 Subject: [PATCH] aarch64: Prepare for lower EL booting
@@ -17,11 +17,11 @@ Reviewed-by: Andre Przywara <andre.przywara@arm.com>
  1 file changed, 13 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index b589744..6b45afc 100644
+index 5105b41..243198d 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -130,7 +130,16 @@ el3_init:
- 	mov	x0, #ZCR_EL3_LEN_MASK		// SVE: Enable full vector len
+@@ -151,7 +151,16 @@ el3_init:
+ 	mov	x0, #ZCR_EL3_LEN_MAX		// SVE: Enable full vector len
  	msr	ZCR_EL3, x0			// for EL2.
 =20
 -1:
@@ -38,7 +38,7 @@ index b589744..6b45afc 100644
  	ldr	x0, =3DCOUNTER_FREQ
  	msr	cntfrq_el0, x0
 =20
-@@ -178,7 +187,7 @@ ASM_FUNC(jump_kernel)
+@@ -199,7 +208,7 @@ ASM_FUNC(jump_kernel)
  	b.eq	1f
  	br	x19			// Keep current EL
 =20
@@ -47,7 +47,7 @@ index b589744..6b45afc 100644
 =20
  	/*
  	 * If bit 0 of the kernel address is set, we're entering in AArch32
-@@ -196,3 +205,5 @@ ASM_FUNC(jump_kernel)
+@@ -217,3 +226,5 @@ ASM_FUNC(jump_kernel)
  	.align 3
  flag_keep_el:
  	.long 0
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch b/meta-arm-bsp/re=
cipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0004-gic-v3-Prepa=
re-for-gicv3-with-EL2.patch
index e10182e1..43885b93 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch
@@ -1,4 +1,4 @@
-From 483d363bf825082b6db6de3c57d169e741861891 Mon Sep 17 00:00:00 2001
+From bff110a95a5e4c9db2d61e629b4aa4b84530201e Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 May 2021 07:25:00 +0100
 Subject: [PATCH] gic-v3: Prepare for gicv3 with EL2
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0005-aarch64-Prepare-for-booting-with-EL2.patch b/meta-arm-bsp=
/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0005-aarch64-P=
repare-for-booting-with-EL2.patch
index 3b6f78a5..c6343456 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0005-aarch64-Prepare-for-booting-with-EL2.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0005-aarch64-Prepare-for-booting-with-EL2.patch
@@ -1,4 +1,4 @@
-From be814863cdd5f61d9a16eec012d500550053c8c6 Mon Sep 17 00:00:00 2001
+From ba955efb35ce1d41b562190d7c2fbcbcf8ef97ff Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 May 2021 07:25:00 +0100
 Subject: [PATCH] aarch64: Prepare for booting with EL2
@@ -15,10 +15,10 @@ Reviewed-by: Andre Przywara <andre.przywara@arm.com>
  2 files changed, 17 insertions(+), 1 deletion(-)
=20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index 6b45afc..908764a 100644
+index 243198d..3593ca5 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -195,10 +195,18 @@ ASM_FUNC(jump_kernel)
+@@ -216,10 +216,18 @@ ASM_FUNC(jump_kernel)
  	 */
  	bfi	x4, x19, #5, #1
 =20
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch=
 b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64=
/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch
index aaacc729..18dc7ed7 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch
@@ -1,4 +1,4 @@
-From 81df76f8d94cb6c31c01739b078a72bdb8497441 Mon Sep 17 00:00:00 2001
+From 8e44fac113d935affed1550480631f3fe7f30584 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 May 2021 07:25:00 +0100
 Subject: [PATCH] aarch64: Introduce EL2 boot code for Armv8-R AArch64
@@ -36,10 +36,10 @@ Signed-off-by: Jaxson Han <jaxson.han@arm.com>
  2 files changed, 92 insertions(+), 2 deletions(-)
=20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index 908764a..def9192 100644
+index 3593ca5..a219ea7 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -24,16 +24,24 @@ ASM_FUNC(_start)
+@@ -37,16 +37,24 @@ ASM_FUNC(_start)
  	 * Boot sequence
  	 * If CurrentEL =3D=3D EL3, then goto EL3 initialisation and drop to
  	 *   lower EL before entering the kernel.
@@ -66,7 +66,7 @@ index 908764a..def9192 100644
  	mov	w0, #1
  	ldr	x1, =3Dflag_keep_el
  	str	w0, [x1]
-@@ -139,6 +147,85 @@ el3_init:
+@@ -160,6 +168,85 @@ el3_init:
  	str	w0, [x1]
  	b	el_max_init
 =20
@@ -152,7 +152,7 @@ index 908764a..def9192 100644
  el_max_init:
  	ldr	x0, =3DCOUNTER_FREQ
  	msr	cntfrq_el0, x0
-@@ -148,6 +235,7 @@ el_max_init:
+@@ -169,6 +256,7 @@ el_max_init:
  	b	start_el_max
 =20
  err_invalid_id:
@@ -161,7 +161,7 @@ index 908764a..def9192 100644
 =20
  	/*
 diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/c=
pu.h
-index b1003f4..91f803c 100644
+index 3767da3..3c0e00d 100644
 --- a/arch/aarch64/include/asm/cpu.h
 +++ b/arch/aarch64/include/asm/cpu.h
 @@ -25,6 +25,7 @@
@@ -172,7 +172,7 @@ index b1003f4..91f803c 100644
  #define SPSR_EL2H		(9 << 0)	/* EL2 Handler mode */
  #define SPSR_HYP		(0x1a << 0)	/* M[3:0] =3D hyp, M[4] =3D AArch32 */
 =20
-@@ -43,6 +44,7 @@
+@@ -50,6 +51,7 @@
  #else
  #define SCTLR_EL1_KERNEL	SCTLR_EL1_RES1
  #define SPSR_KERNEL		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL2H)
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0007-Allow-enable-psci-to-choose-between-smc-and-hvc.patch b/m=
eta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/000=
7-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
index b1308548..131e2710 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0007-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0007-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
@@ -1,4 +1,4 @@
-From f5a31b4f4ea8daaa0d337d5a2322ddb1912083fc Mon Sep 17 00:00:00 2001
+From 0b9a966b8a28961b078215ee7169e32a976d5e7d Mon Sep 17 00:00:00 2001
 From: Qi Feng <qi.feng@arm.com>
 Date: Wed, 26 May 2021 17:52:01 +0800
 Subject: [PATCH] Allow --enable-psci to choose between smc and hvc
@@ -40,7 +40,7 @@ Signed-off-by: Huifeng Zhang <Huifeng.Zhang@arm.com>
  2 files changed, 14 insertions(+), 10 deletions(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index f941b07..88a27de 100644
+index 5731a19..fc66662 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -50,11 +50,11 @@ endif
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch b/meta-a=
rm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0008-aar=
ch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
index 2ce28b70..d3ccb2eb 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
@@ -1,4 +1,4 @@
-From 3f4614e02f0f8d2522510578da2752f8e3511bb3 Mon Sep 17 00:00:00 2001
+From 521c121eccb386aca7c75d92528e495546adccec Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Mon, 25 Oct 2021 17:09:13 +0800
 Subject: [PATCH] aarch64: Disable CNTPCT_EL0 trap for v8-R64
@@ -24,10 +24,10 @@ Change-Id: I4147e66341c8153312021e6f2ab67d0037246da1
  1 file changed, 12 insertions(+)
=20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index def9192..6dbd5cc 100644
+index a219ea7..27b1139 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -219,6 +219,18 @@ el2_init:
+@@ -240,6 +240,18 @@ el2_init:
  	orr	x0, x0, #(1 << 41)		// HCR_EL2.API
 =20
  1:	msr	hcr_el2, x0
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0009-lds-Mark-the-mem-range.patch b/meta-arm-bsp/recipes-bsp/b=
oot-wrapper-aarch64/files/fvp-baser-aemv8r64/0009-lds-Mark-the-mem-range.=
patch
index 0c310eb5..c34d01c3 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0009-lds-Mark-the-mem-range.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0009-lds-Mark-the-mem-range.patch
@@ -1,4 +1,4 @@
-From 2851f0e6c1216894b9498d7b91256bb1ef49e544 Mon Sep 17 00:00:00 2001
+From 780df234d98db81485b1f351f902a68def35c9d4 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 2 Nov 2021 15:10:28 +0800
 Subject: [PATCH] lds: Mark the mem range
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0010-common-Introduce-the-libfdt.patch b/meta-arm-bsp/recipes-=
bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0010-common-Introduce-t=
he-libfdt.patch
index 0305f8ba..2d12db59 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0010-common-Introduce-the-libfdt.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0010-common-Introduce-the-libfdt.patch
@@ -1,4 +1,4 @@
-From fadf04f44b679d85e55b2e5f220fecbebb52ad03 Mon Sep 17 00:00:00 2001
+From b3762b6c5a56bf594bc5cb63d145e8efd86e106e Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 28 Dec 2021 17:02:17 +0800
 Subject: [PATCH] common: Introduce the libfdt
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0011-common-Add-essential-libc-functions.patch b/meta-arm-bsp/=
recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0011-common-Add=
-essential-libc-functions.patch
index 871a178f..b7726f51 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0011-common-Add-essential-libc-functions.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0011-common-Add-essential-libc-functions.patch
@@ -1,4 +1,4 @@
-From 0f2c7ca446063be6b193fbf870d38c0af19e15c5 Mon Sep 17 00:00:00 2001
+From e2eff4f80e65cb3fcbe6345b5376a6bf7de7e2cc Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 28 Dec 2021 17:28:25 +0800
 Subject: [PATCH] common: Add essential libc functions
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch b/me=
ta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0012=
-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
index 5917ef20..b77ab3e2 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
@@ -1,4 +1,4 @@
-From de5d2b6c200ae5dd8113751e58bf7cf5844eec5a Mon Sep 17 00:00:00 2001
+From f4d5cf4c3424598a2b3bb391717313b70c79ea28 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 28 Dec 2021 17:42:48 +0800
 Subject: [PATCH] Makefile: Add the libfdt to the Makefile system
@@ -17,7 +17,7 @@ Change-Id: I472bc28cdc5cde3b22461a4b7d7a3752ae382b4b
  1 file changed, 9 insertions(+), 2 deletions(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 88a27de..5e8668a 100644
+index fc66662..ab2c3a9 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -36,6 +36,9 @@ PSCI_CPU_OFF	:=3D 0x84000002
@@ -30,10 +30,10 @@ index 88a27de..5e8668a 100644
  ARCH_OBJ	:=3D boot.o stack.o utils.o
 =20
  if BOOTWRAPPER_32
-@@ -125,11 +128,12 @@ CHOSEN_NODE	:=3D chosen {						\
- CPPFLAGS	+=3D $(INITRD_FLAGS)
- CFLAGS		+=3D -I$(top_srcdir)/include/ -I$(top_srcdir)/$(ARCH_SRC)/inclu=
de/
+@@ -127,11 +130,12 @@ CFLAGS		+=3D -I$(top_srcdir)/include/ -I$(top_srcd=
ir)/$(ARCH_SRC)/include/
  CFLAGS		+=3D -Wall -fomit-frame-pointer
+ CFLAGS		+=3D -ffreestanding -nostdlib
+ CFLAGS		+=3D -fno-stack-protector
 +CFLAGS 		+=3D -fno-stack-protector
  CFLAGS		+=3D -ffunction-sections -fdata-sections
  CFLAGS		+=3D -fno-pic -fno-pie
@@ -44,7 +44,7 @@ index 88a27de..5e8668a 100644
 =20
  # Don't lookup all prerequisites in $(top_srcdir), only the source file=
s. When
  # building outside the source tree $(ARCH_SRC) needs to be created.
-@@ -150,10 +154,13 @@ $(ARCH_SRC):
+@@ -152,10 +156,13 @@ $(ARCH_SRC):
  $(COMMON_SRC):
  	$(MKDIR_P) $@
 =20
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0013-platform-Add-print_hex-func.patch b/meta-arm-bsp/recipes-=
bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0013-platform-Add-print=
_hex-func.patch
index 136e18ed..2346109c 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0013-platform-Add-print_hex-func.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0013-platform-Add-print_hex-func.patch
@@ -1,4 +1,4 @@
-From 5b8cb5192dbd0332e027e8999c3afe4433983291 Mon Sep 17 00:00:00 2001
+From f0ece5e8cac761a76a86df7204bae7c6ef09215f Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Wed, 29 Dec 2021 10:50:21 +0800
 Subject: [PATCH] platform: Add print_hex func
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0014-common-Add-mem-usage-to-memreserve.patch b/meta-arm-bsp/r=
ecipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0014-common-Add-=
mem-usage-to-memreserve.patch
index ea518160..f4ea89c6 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0014-common-Add-mem-usage-to-memreserve.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0014-common-Add-mem-usage-to-memreserve.patch
@@ -1,4 +1,4 @@
-From b447242cd2457bec20d47fe6a8a5758d97a3bde3 Mon Sep 17 00:00:00 2001
+From f4704146e1af9f6e0a2220db6b39a328c813fac1 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Wed, 19 Jan 2022 16:19:02 +0800
 Subject: [PATCH] common: Add mem usage to /memreserve/
@@ -20,7 +20,7 @@ Change-Id: I2ea80cdf736a910fa2c3deb622e21d50f04be960
  create mode 100644 common/device_tree.c
=20
 diff --git a/Makefile.am b/Makefile.am
-index 5e8668a..734de92 100644
+index ab2c3a9..e905602 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -34,7 +34,7 @@ endif
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0015-boot-Add-the-enable-keep-el-compile-option.patch b/meta-a=
rm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0015-boo=
t-Add-the-enable-keep-el-compile-option.patch
index 0411ef02..7d59e5fc 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
@@ -1,4 +1,4 @@
-From 8271c21bcff260295203214b7b8c87cdb8236453 Mon Sep 17 00:00:00 2001
+From 5995f83592aea874f5b423538e36675e2204582b Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 4 Jan 2022 17:01:55 +0800
 Subject: [PATCH] boot: Add the --enable-keep-el compile option
@@ -23,7 +23,7 @@ Change-Id: I3ba9c87cf0b59d163ca433f74c9e3a46e5ca2c63
  4 files changed, 20 insertions(+), 1 deletion(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 734de92..054becd 100644
+index e905602..6604baa 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -33,6 +33,10 @@ PSCI_CPU_ON	:=3D 0xc4000003
@@ -38,10 +38,10 @@ index 734de92..054becd 100644
  COMMON_OBJ	:=3D boot.o bakery_lock.o platform.o lib.o device_tree.o
 =20
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index 6dbd5cc..157c097 100644
+index 27b1139..c079d22 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -233,7 +233,11 @@ el2_init:
+@@ -254,7 +254,11 @@ el2_init:
  	msr	cnthctl_el2, x0
  	isb
 =20
@@ -53,7 +53,7 @@ index 6dbd5cc..157c097 100644
  	ldr	x1, =3Dspsr_to_elx
  	str	w0, [x1]
  	// fall through
-@@ -313,5 +317,5 @@ ASM_FUNC(jump_kernel)
+@@ -334,5 +338,5 @@ ASM_FUNC(jump_kernel)
  	.align 3
  flag_keep_el:
  	.long 0
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch b/meta-arm-=
bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0016-Makefi=
le-Change-COUNTER_FREQ-to-100-MHz.patch
index a6b16e40..e93a300f 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch
@@ -1,4 +1,4 @@
-From dd3e3f414d0e6ed1643c2e2ccac676b7fc1dc7a9 Mon Sep 17 00:00:00 2001
+From 0c0695cd3160ccdb95bae29b7668918015c0b6aa Mon Sep 17 00:00:00 2001
 From: Peter Hoyes <Peter.Hoyes@arm.com>
 Date: Tue, 1 Feb 2022 11:28:46 +0000
 Subject: [PATCH] Makefile: Change COUNTER_FREQ to 100 MHz
@@ -17,7 +17,7 @@ Change-Id: Ia9ad0f8ee488d1a887791f1fa1d8f3bf9c5887fd
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 40bc5d6..b48173c 100644
+index 6604baa..cc6504e 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -13,7 +13,7 @@ SCRIPT_DIR	:=3D $(top_srcdir)/scripts
@@ -29,6 +29,3 @@ index 40bc5d6..b48173c 100644
 =20
  CPU_IDS		:=3D $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findcpuids.pl=
 $(KERNEL_DTB))
  NR_CPUS         :=3D $(shell echo $(CPU_IDS) | tr ',' ' ' | wc -w)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0017-PSCI-Apply-flush-cache-after-setting-branch_data.patch b/=
meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/00=
17-PSCI-Apply-flush-cache-after-setting-branch_data.patch
index 8d981f52..b63d8d1d 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0017-PSCI-Apply-flush-cache-after-setting-branch_data.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0017-PSCI-Apply-flush-cache-after-setting-branch_data.patch
@@ -1,4 +1,4 @@
-From 6923f2a0c59cf92ba5ad50ec1d658a357b4ba5d7 Mon Sep 17 00:00:00 2001
+From fa73d885be85eee4369b292ec601e7b024a68807 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 2 Nov 2021 10:48:39 +0800
 Subject: [PATCH] PSCI: Apply flush cache after setting branch_data
@@ -47,6 +47,3 @@ index 945780b..6efc695 100644
  	return PSCI_RET_SUCCESS;
  }
 =20
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0018-PSCI-Add-function-call-entry-point.patch b/meta-arm-bsp/r=
ecipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0018-PSCI-Add-fu=
nction-call-entry-point.patch
index 97cd3cb9..dd2b9653 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0018-PSCI-Add-function-call-entry-point.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0018-PSCI-Add-function-call-entry-point.patch
@@ -1,4 +1,4 @@
-From ed46e83df2400b1b3f3364169aacf787bd91bd45 Mon Sep 17 00:00:00 2001
+From 9da48e3433b919868650cd60e28827273a42c63b Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 25 Jan 2022 14:56:36 +0800
 Subject: [PATCH] PSCI: Add function call entry point
@@ -69,6 +69,3 @@ index 6efc695..8fdefb5 100644
  void __noreturn psci_first_spin(unsigned int cpu)
  {
  	if (cpu =3D=3D MPIDR_INVALID)
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0019-lds-Rearrange-and-mark-the-sections.patch b/meta-arm-bsp/=
recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0019-lds-Rearra=
nge-and-mark-the-sections.patch
index 1f10209d..c0d1fcbb 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0019-lds-Rearrange-and-mark-the-sections.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0019-lds-Rearrange-and-mark-the-sections.patch
@@ -1,4 +1,4 @@
-From 36b5fa3f4db49ac7aef42ff1d58a895226c7e96c Mon Sep 17 00:00:00 2001
+From 7c5e40d9f8699a55ac2187c035429c643e6d0ef0 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Tue, 2 Nov 2021 15:10:28 +0800
 Subject: [PATCH] lds: Rearrange and mark the sections
@@ -56,6 +56,3 @@ index ab98ddf..85451f9 100644
  	PROVIDE(firmware_end =3D .);
 =20
  	ASSERT(etext <=3D (PHYS_OFFSET + TEXT_LIMIT), ".text overflow!")
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0020-common-Provide-firmware-info-using-libfdt.patch b/meta-ar=
m-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0020-comm=
on-Provide-firmware-info-using-libfdt.patch
index cafcc09b..1573be05 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0020-common-Provide-firmware-info-using-libfdt.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0020-common-Provide-firmware-info-using-libfdt.patch
@@ -1,4 +1,4 @@
-From 8bdbb64d13f14d40546b71dbcfee2b2a8ea002a5 Mon Sep 17 00:00:00 2001
+From 3c1140c29c39561848056fb4b9a03042b00279f3 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Wed, 29 Dec 2021 15:17:38 +0800
 Subject: [PATCH] common: Provide firmware info using libfdt
@@ -340,6 +340,3 @@ index 4d0876c..7f7befc 100644
 +
 +	dt_dump_all(fw_node);
 +}
---=20
-2.25.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0021-boot-Enable-firmware-node-initialization.patch b/meta-arm=
-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0021-boot-=
Enable-firmware-node-initialization.patch
index 943afdee..9b367a7b 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0021-boot-Enable-firmware-node-initialization.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0021-boot-Enable-firmware-node-initialization.patch
@@ -1,4 +1,4 @@
-From 6dfc937d1ae54d2ae9f8c60ca29ba73ca14dc8c4 Mon Sep 17 00:00:00 2001
+From b1105e862e8f770fc195bc20e9c64d231dd32f66 Mon Sep 17 00:00:00 2001
 From: Jaxson Han <jaxson.han@arm.com>
 Date: Wed, 29 Dec 2021 15:33:17 +0800
 Subject: [PATCH] boot: Enable firmware node initialization
@@ -29,7 +29,7 @@ Change-Id: Ib274485a34d26215595fd0cd737be86610289817
  3 files changed, 12 insertions(+), 2 deletions(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index 054becd..b01809c 100644
+index cc6504e..fbe6b81 100644
 --- a/Makefile.am
 +++ b/Makefile.am
 @@ -23,7 +23,7 @@ DEFINES		+=3D -DCPU_IDS=3D$(CPU_IDS)
@@ -41,20 +41,20 @@ index 054becd..b01809c 100644
 =20
  if KERNEL_32
  DEFINES		+=3D -DKERNEL_32
-@@ -132,7 +132,7 @@ CHOSEN_NODE	:=3D chosen {						\
- CPPFLAGS	+=3D $(INITRD_FLAGS)
- CFLAGS		+=3D -I$(top_srcdir)/include/ -I$(top_srcdir)/$(ARCH_SRC)/inclu=
de/
+@@ -134,7 +134,7 @@ CFLAGS		+=3D -I$(top_srcdir)/include/ -I$(top_srcdir=
)/$(ARCH_SRC)/include/
  CFLAGS		+=3D -Wall -fomit-frame-pointer
+ CFLAGS		+=3D -ffreestanding -nostdlib
+ CFLAGS		+=3D -fno-stack-protector
 -CFLAGS 		+=3D -fno-stack-protector
 +CFLAGS 		+=3D -fno-stack-protector -fno-builtin
  CFLAGS		+=3D -ffunction-sections -fdata-sections
  CFLAGS		+=3D -fno-pic -fno-pie
  LDFLAGS		+=3D --gc-sections
 diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index 157c097..f310387 100644
+index c079d22..daaa674 100644
 --- a/arch/aarch64/boot.S
 +++ b/arch/aarch64/boot.S
-@@ -240,6 +240,10 @@ el2_init:
+@@ -261,6 +261,10 @@ el2_init:
  #endif
  	ldr	x1, =3Dspsr_to_elx
  	str	w0, [x1]
@@ -65,7 +65,7 @@ index 157c097..f310387 100644
  	// fall through
 =20
  el_max_init:
-@@ -319,3 +323,5 @@ flag_keep_el:
+@@ -340,3 +344,5 @@ flag_keep_el:
  	.long 0
  ASM_DATA(spsr_to_elx)
  	.long 0
@@ -93,6 +93,3 @@ index ee2bea0..38b2dca 100644
 =20
  		*mbox =3D (unsigned long)&entrypoint;
  		sevl();
---=20
-2.25.1
-
diff --git a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch=
64_git.bb b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch6=
4_git.bb
index 411dac0c..cb79069b 100644
--- a/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
+++ b/meta-arm/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64_git.=
bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dbb63326febfb5fb909226c8e7=
ebcef5c"
=20
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/mark/boot-wra=
pper-aarch64.git;branch=3Dmaster"
-SRCREV =3D "1044c77062573985f7c994c3b6cef5695f57e955"
+SRCREV =3D "d3b1a15d18542b2086e72bfdc3fc43f454772a3b"
=20
 # boot-wrapper doesn't make releases
 UPSTREAM_CHECK_COMMITS =3D "1"
--=20
2.25.1


