Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 079B9C433FE
	for <webhook@archiver.kernel.org>; Thu, 17 Feb 2022 16:11:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1808.1645114276190092385
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Feb 2022 08:11:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB99A113E;
	Thu, 17 Feb 2022 08:11:15 -0800 (PST)
Received: from e125920.arm.com (unknown [10.57.87.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 303DB3F718;
	Thu, 17 Feb 2022 08:11:14 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/6] arm-bsp/boot-wrapper-aarch64: Update patches for
 fvp-baser-aemv8r64
Date: Thu, 17 Feb 2022 16:09:55 +0000
Message-Id: <20220217160959.4157807-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217160959.4157807-1-peter.hoyes@arm.com>
References: <20220217160959.4157807-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Feb 2022 16:11:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3017

From: Peter Hoyes <Peter.Hoyes@arm.com>

Update the machine-specific patches, which makes the following changes:
 * Add PSCI services to /memreserve/ in the device tree using libfdt.
 * Add --enable-keep-el option, which allows boot-wrapper-aarch64 to
   boot the next stage at the same exception level.
 * Update the counter frequency to 100 MHz.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I41843e958cf629d69de644bb57b660fb542fc8b7
---
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   19 +-
 ...M_SYS-config-by-auto-detect-dtb-node.patch |   67 -
 ...abels-and-prepare-for-lower-EL-booti.patch |  135 +
 ...0002-aarch64-Prepare-for-EL1-booting.patch |   48 +
 ...4-Introduce-EL2-boot-code-for-v8-r64.patch |  314 -
 ...aarch64-Prepare-for-lower-EL-booting.patch |   55 +
 ...04-gic-v3-Prepare-for-gicv3-with-EL2.patch |  105 +
 ...aarch64-Prepare-for-booting-with-EL2.patch |   63 +
 ...ce-EL2-boot-code-for-Armv8-R-AArch64.patch |  182 +
 ...-psci-to-choose-between-smc-and-hvc.patch} |   42 +-
 ...4-Disable-CNTPCT_EL0-trap-for-v8-R64.patch |   48 +
 .../0009-lds-Mark-the-mem-range.patch         |   38 +
 .../0010-common-Introduce-the-libfdt.patch    | 6044 +++++++++++++++++
 ...-common-Add-essential-libc-functions.patch |  101 +
 ...dd-the-libfdt-to-the-Makefile-system.patch |   61 +
 .../0013-platform-Add-print_hex-func.patch    |   67 +
 ...4-common-Add-mem-usage-to-memreserve.patch |   96 +
 ...dd-the-enable-keep-el-compile-option.patch |  102 +
 ...efile-Change-COUNTER_FREQ-to-100-MHz.patch |   34 +
 19 files changed, 7219 insertions(+), 402 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.pa=
tch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-boo=
ti.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0002-aarch64-Prepare-for-EL1-booting.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0003-aarch64-Prepare-for-lower-EL-booting.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0005-aarch64-Prepare-for-booting-with-EL2.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch6=
4.patch
 rename meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aem=
v8r64/{0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch =3D> 00=
07-Allow-enable-psci-to-choose-between-smc-and-hvc.patch} (71%)
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0009-lds-Mark-the-mem-range.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0010-common-Introduce-the-libfdt.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0011-common-Add-essential-libc-functions.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.pat=
ch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0013-platform-Add-print_hex-func.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0014-common-Add-mem-usage-to-memreserve.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/f=
vp-baser-aemv8r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch

diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-a=
arch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aar=
ch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index f1bf614..628571f 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
@@ -2,9 +2,22 @@ COMPATIBLE_MACHINE =3D "fvp-baser-aemv8r64"
=20
 FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files/${MACHINE}:"
 SRC_URI:append =3D " \
-    file://0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch \
-    file://0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch \
-    file://0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch \
+    file://0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.pat=
ch \
+    file://0002-aarch64-Prepare-for-EL1-booting.patch \
+    file://0003-aarch64-Prepare-for-lower-EL-booting.patch \
+    file://0004-gic-v3-Prepare-for-gicv3-with-EL2.patch \
+    file://0005-aarch64-Prepare-for-booting-with-EL2.patch \
+    file://0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patc=
h \
+    file://0007-Allow-enable-psci-to-choose-between-smc-and-hvc.patch \
+    file://0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch \
+    file://0009-lds-Mark-the-mem-range.patch \
+    file://0010-common-Introduce-the-libfdt.patch \
+    file://0011-common-Add-essential-libc-functions.patch \
+    file://0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch \
+    file://0013-platform-Add-print_hex-func.patch \
+    file://0014-common-Add-mem-usage-to-memreserve.patch \
+    file://0015-boot-Add-the-enable-keep-el-compile-option.patch \
+    file://0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch \
     "
=20
 BOOT_WRAPPER_AARCH64_CMDLINE =3D "\
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch b/m=
eta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/000=
1-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch
deleted file mode 100644
index f3e03c4..0000000
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0001-Decouple-V2M_SYS-config-by-auto-detect-dtb-node.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From 7b8c821c22929cd2d3532f937672fcf05dc7d5d0 Mon Sep 17 00:00:00 2001
-Message-Id: <7b8c821c22929cd2d3532f937672fcf05dc7d5d0.1616744115.git.die=
go.sueiro@arm.com>
-From: Jaxson Han <jaxson.han@arm.com>
-Date: Thu, 25 Mar 2021 12:35:13 +0800
-Subject: [PATCH 1/2] Decouple V2M_SYS config by auto-detect dtb node
-
-An auto-detect switch is added to make it an option to enable/disable
-'arm,vexpress-sysreg', because not all platforms support this feature.
-
-Issue-ID: SCM-2221
-Signed-off-by: Jaxson Han <jaxson.han@arm.com>
-Change-Id: Ib8738aa62ca3902f7bdae2ad9a5a63aa2d225abf
-
-Upstream-Status: Pending
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- Makefile.am | 2 +-
- platform.c  | 4 ++++
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index af694b7..e131207 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -19,7 +19,7 @@ NR_CPUS         :=3D $(shell echo $(CPU_IDS) | tr ',' =
' ' | wc -w)
- DEFINES		=3D -DCNTFRQ=3D$(CNTFRQ)
- DEFINES		+=3D -DCPU_IDS=3D$(CPU_IDS)
- DEFINES		+=3D -DNR_CPUS=3D$(NR_CPUS)
--DEFINES		+=3D -DSYSREGS_BASE=3D$(SYSREGS_BASE)
-+DEFINES		+=3D $(if $(SYSREGS_BASE), -DSYSREGS_BASE=3D$(SYSREGS_BASE), )
- DEFINES		+=3D -DUART_BASE=3D$(UART_BASE)
- DEFINES		+=3D -DSTACK_SIZE=3D256
-=20
-diff --git a/platform.c b/platform.c
-index a528a55..d11f568 100644
---- a/platform.c
-+++ b/platform.c
-@@ -23,10 +23,12 @@
-=20
- #define PL011(reg)	((void *)UART_BASE + PL011_##reg)
-=20
-+#ifdef SYSREGS_BASE
- #define V2M_SYS_CFGDATA		0xa0
- #define V2M_SYS_CFGCTRL		0xa4
-=20
- #define V2M_SYS(reg)	((void *)SYSREGS_BASE + V2M_SYS_##reg)
-+#endif
-=20
- static void print_string(const char *str)
- {
-@@ -59,6 +61,7 @@ void init_platform(void)
-=20
- 	print_string("Boot-wrapper v0.2\r\n\r\n");
-=20
-+#ifdef SYSREGS_BASE
- 	/*
- 	 * CLCD output site MB
- 	 */
-@@ -66,4 +69,5 @@ void init_platform(void)
- 	/* START | WRITE | MUXFPGA | SITE_MB */
- 	raw_writel((1 << 31) | (1 << 30) | (7 << 20) | (0 << 16),
- 				V2M_SYS(CFGCTRL));
-+#endif
- }
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patc=
h b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r6=
4/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patch
new file mode 100644
index 0000000..566070a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0001-aarch64-Rename-labels-and-prepare-for-lower-EL-booti.patch
@@ -0,0 +1,135 @@
+From 3e7cfbe39a2a053d2a6b0d928cc172ed9d1c6da8 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 May 2021 07:25:00 +0100
+Subject: [PATCH] aarch64: Rename labels and prepare for lower EL booting
+
+Prepare for booting from lower EL. Rename *_el3 relavant labels with
+*_el_max and *_no_el3 with *_keep_el. Since the original _no_el3 means
+"We neither do init sequence at this highest EL nor drop to lower EL
+when entering to kernel", we rename it with _keep_el to make it more
+clear for lower EL initialisation.
+
+Upstream-Status: Pending
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+---
+ arch/aarch64/boot.S | 28 ++++++++++++++++++++--------
+ arch/aarch64/psci.S |  9 +++++----
+ arch/aarch64/spin.S |  4 ++--
+ 3 files changed, 27 insertions(+), 14 deletions(-)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index 27ba449..84e1646 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -21,18 +21,30 @@ ASM_FUNC(_start)
+=20
+ 	/*
+ 	 * EL3 initialisation
++	 * Boot sequence
++	 * If CurrentEL =3D=3D EL3, then goto EL3 initialisation and drop to
++	 *   lower EL before entering the kernel.
++	 * Else, no initialisation and keep the current EL before
++	 *   entering the kernel.
+ 	 */
+ 	mrs	x0, CurrentEL
+ 	cmp	x0, #CURRENTEL_EL3
+-	b.eq	1f
++	b.eq	el3_init
+=20
++	/*
++	 * We stay in the current EL for entering the kernel
++	 */
+ 	mov	w0, #1
+-	ldr	x1, =3Dflag_no_el3
++	ldr	x1, =3Dflag_keep_el
+ 	str	w0, [x1]
+=20
+-	b	start_no_el3
++	b	start_keep_el
+=20
+-1:	mov	x0, #0x30			// RES1
++	/*
++	 * EL3 initialisation
++	 */
++el3_init:
++	mov	x0, #0x30			// RES1
+ 	orr	x0, x0, #(1 << 0)		// Non-secure EL1
+ 	orr	x0, x0, #(1 << 8)		// HVC enable
+=20
+@@ -124,7 +136,7 @@ ASM_FUNC(_start)
+=20
+ 	bl	gic_secure_init
+=20
+-	b	start_el3
++	b	start_el_max
+=20
+ err_invalid_id:
+ 	b	.
+@@ -151,7 +163,7 @@ ASM_FUNC(jump_kernel)
+ 	bl	find_logical_id
+ 	bl	setup_stack		// Reset stack pointer
+=20
+-	ldr	w0, flag_no_el3
++	ldr	w0, flag_keep_el
+ 	cmp	w0, #0			// Prepare Z flag
+=20
+ 	mov	x0, x20
+@@ -160,7 +172,7 @@ ASM_FUNC(jump_kernel)
+ 	mov	x3, x23
+=20
+ 	b.eq	1f
+-	br	x19			// No EL3
++	br	x19			// Keep current EL
+=20
+ 1:	mov	x4, #SPSR_KERNEL
+=20
+@@ -178,5 +190,5 @@ ASM_FUNC(jump_kernel)
+=20
+ 	.data
+ 	.align 3
+-flag_no_el3:
++flag_keep_el:
+ 	.long 0
+diff --git a/arch/aarch64/psci.S b/arch/aarch64/psci.S
+index 8bd224b..7b8919a 100644
+--- a/arch/aarch64/psci.S
++++ b/arch/aarch64/psci.S
+@@ -79,7 +79,7 @@ smc_exit:
+ 	ldp	x18, x19, [sp], #16
+ 	eret
+=20
+-ASM_FUNC(start_el3)
++ASM_FUNC(start_el_max)
+ 	ldr	x0, =3Dvector
+ 	bl	setup_vector
+=20
+@@ -89,10 +89,11 @@ ASM_FUNC(start_el3)
+ 	b	psci_first_spin
+=20
+ /*
+- * This PSCI implementation requires EL3. Without EL3 we'll only boot t=
he
+- * primary cpu, all others will be trapped in an infinite loop.
++ * This PSCI implementation requires the highest EL(EL3 or Armv8-R EL2)=
.
++ * Without the highest EL, we'll only boot the primary cpu, all othersr
++ * will be trapped in an infinite loop.
+  */
+-ASM_FUNC(start_no_el3)
++ASM_FUNC(start_keep_el)
+ 	cpuid	x0, x1
+ 	bl	find_logical_id
+ 	cbz	x0, psci_first_spin
+diff --git a/arch/aarch64/spin.S b/arch/aarch64/spin.S
+index 1ea1c0b..bfb1d47 100644
+--- a/arch/aarch64/spin.S
++++ b/arch/aarch64/spin.S
+@@ -12,8 +12,8 @@
+=20
+ 	.text
+=20
+-ASM_FUNC(start_el3)
+-ASM_FUNC(start_no_el3)
++ASM_FUNC(start_el_max)
++ASM_FUNC(start_keep_el)
+ 	cpuid	x0, x1
+ 	bl	find_logical_id
+=20
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0002-aarch64-Prepare-for-EL1-booting.patch b/meta-arm-bsp/reci=
pes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-aarch64-Prepar=
e-for-EL1-booting.patch
new file mode 100644
index 0000000..46447b8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0002-aarch64-Prepare-for-EL1-booting.patch
@@ -0,0 +1,48 @@
+From 26f9b5354c2de9cc052531096ff92b04c3a3846f Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 May 2021 07:25:00 +0100
+Subject: [PATCH] aarch64: Prepare for EL1 booting
+
+When booting from EL1, add a check and skip the init of
+sctlr_el2 in jump_kernel
+
+Upstream-Status: Pending
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Reviewed-by: Andre Przywara <andre.przywara@arm.com>
+---
+ arch/aarch64/boot.S            | 6 +++++-
+ arch/aarch64/include/asm/cpu.h | 1 +
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index 84e1646..b589744 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -156,10 +156,14 @@ ASM_FUNC(jump_kernel)
+ 	ldr	x0, =3DSCTLR_EL1_KERNEL
+ 	msr	sctlr_el1, x0
+=20
++	mrs	x0, CurrentEL
++	cmp	x0, #CURRENTEL_EL2
++	b.lt	1f
++
+ 	ldr	x0, =3DSCTLR_EL2_KERNEL
+ 	msr	sctlr_el2, x0
+=20
+-	cpuid	x0, x1
++1:	cpuid	x0, x1
+ 	bl	find_logical_id
+ 	bl	setup_stack		// Reset stack pointer
+=20
+diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/c=
pu.h
+index 63eb1c3..b1003f4 100644
+--- a/arch/aarch64/include/asm/cpu.h
++++ b/arch/aarch64/include/asm/cpu.h
+@@ -11,6 +11,7 @@
+=20
+ #define MPIDR_ID_BITS		0xff00ffffff
+=20
++#define CURRENTEL_EL2		(2 << 2)
+ #define CURRENTEL_EL3		(3 << 2)
+=20
+ /*
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch b/meta-ar=
m-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0002-arch=
64-Introduce-EL2-boot-code-for-v8-r64.patch
deleted file mode 100644
index 5d039b2..0000000
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0002-arch64-Introduce-EL2-boot-code-for-v8-r64.patch
+++ /dev/null
@@ -1,314 +0,0 @@
-From 81fcc5cc80c9c3c812d92000b9116f6a02ff7e6c Mon Sep 17 00:00:00 2001
-Message-Id: <81fcc5cc80c9c3c812d92000b9116f6a02ff7e6c.1616744115.git.die=
go.sueiro@arm.com>
-In-Reply-To: <7b8c821c22929cd2d3532f937672fcf05dc7d5d0.1616744115.git.di=
ego.sueiro@arm.com>
-References: <7b8c821c22929cd2d3532f937672fcf05dc7d5d0.1616744115.git.die=
go.sueiro@arm.com>
-From: Jaxson Han <jaxson.han@arm.com>
-Date: Thu, 25 Mar 2021 12:47:02 +0800
-Subject: [PATCH 2/2] arch64: Introduce EL2 boot code for v8-r64
-
-The v8-r64 boots from EL2 mode. In order to boot linux, EL2 boot mode
-is needed. Because there is no MMU supported for v8-r64 under EL2 mode,
-bootwrapper needs to switch to EL1 mode when jumpping to the kernel.
-
-Some register in gic-v3.h need to be auto-detected.
-
-Issue-ID: SCM-2221
-Signed-off-by: Jaxson Han <jaxson.han@arm.com>
-Change-Id: I52ca3f045f1ab50f32945420144752f396d95193
-
-Upstream-Status: Pending
-Signed-off-by: Diego Sueiro <diego.sueiro@arm.com>
----
- arch/aarch64/boot.S               | 76 +++++++++++++++++++++++++++----
- arch/aarch64/include/asm/cpu.h    |  3 ++
- arch/aarch64/include/asm/gic-v3.h | 23 ++++++++--
- arch/aarch64/psci.S               | 13 +++---
- arch/aarch64/spin.S               |  8 ++--
- arch/aarch64/utils.S              |  8 ++++
- 6 files changed, 110 insertions(+), 21 deletions(-)
-
-diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
-index e47cf59..5c3eb73 100644
---- a/arch/aarch64/boot.S
-+++ b/arch/aarch64/boot.S
-@@ -22,20 +22,30 @@ _start:
- 	bl	setup_stack
-=20
- 	/*
--	 * EL3 initialisation
-+	 * Boot sequence
-+	 * If EL3, goto EL3 initialisation
-+	 * If EL2 && id_aa64mmfr0_el1.MSA =3D=3D 0xf, do Armv8r initialisation
-+	 * Else no initialisation sequence
- 	 */
- 	mrs	x0, CurrentEL
- 	cmp	x0, #CURRENTEL_EL3
--	b.eq	1f
-+	beq	el3_init
-+	cmp	x0, #CURRENTEL_EL2
-+	beq	el2_init
-=20
-+no_el_max:
- 	mov	w0, #1
- 	ldr	x1, =3Dflag_no_el3
- 	str	w0, [x1]
-=20
- 	bl	setup_stack
--	b	start_no_el3
-+	b	start_no_el_max
-=20
--1:	mov	x0, #0x30			// RES1
-+	/*
-+	 * EL3 initialisation
-+	 */
-+el3_init:
-+	mov	x0, #0x30			// RES1
- 	orr	x0, x0, #(1 << 0)		// Non-secure EL1
- 	orr	x0, x0, #(1 << 8)		// HVC enable
-=20
-@@ -93,14 +103,54 @@ _start:
- 	mov	x0, #ZCR_EL3_LEN_MASK		// SVE: Enable full vector len
- 	msr	ZCR_EL3, x0			// for EL2.
-=20
--1:
-+	mov	w0, #SPSR_KERNEL
-+	ldr	x1, =3Dspsr_to_elx
-+	str	w0, [x1]
-+	b	el_max_init
-+
-+	/*
-+	 * EL2 Armv8r initialisation
-+	 */
-+el2_init:
-+	/* Detect Armv8r */
-+	mrs	x1, id_aa64mmfr0_el1
-+	ubfx	x1, x1, #48, #4			// MSA
-+	cmp	x1, 0xf				// 0xf means Armv8r
-+	bne	no_el_max
-+
-+	mrs	x0, midr_el1
-+	msr	vpidr_el2, x0
-+
-+	mrs	x0, mpidr_el1
-+	msr	vmpidr_el2, x0
-+
-+	mov	x0, #(1 << 31)			// VTCR_MSA: VMSAv8-64 support
-+	msr	vtcr_el2, x0
-+
-+	/* Enable pointer authentication if present */
-+	mrs	x1, id_aa64isar1_el1
-+	ldr	x2, =3D(((0xff) << 24) | (0xff << 4))
-+	and	x1, x1, x2
-+	cbz	x1, 1f
-+
-+	mrs	x0, hcr_el2
-+	orr	x0, x0, #(1 << 40)		// AP key enable
-+	orr	x0, x0, #(1 << 41)		// AP insn enable
-+	msr	hcr_el2, x0
-+
-+1:	isb
-+	mov	w0, #SPSR_KERNEL_EL1
-+	ldr	x1, =3Dspsr_to_elx
-+	str	w0, [x1]
-+	b	el_max_init
-+
-+el_max_init:
- 	ldr	x0, =3DCNTFRQ
- 	msr	cntfrq_el0, x0
-=20
- 	bl	gic_secure_init
-=20
--	b	start_el3
--
-+	b	start_el_max
- err_invalid_id:
- 	b	.
-=20
-@@ -137,7 +187,7 @@ jump_kernel:
- 	b.eq	1f
- 	br	x19			// No EL3
-=20
--1:	mov	x4, #SPSR_KERNEL
-+1:	ldr	w4, spsr_to_elx
-=20
- 	/*
- 	 * If bit 0 of the kernel address is set, we're entering in AArch32
-@@ -145,13 +195,23 @@ jump_kernel:
- 	 */
- 	bfi	x4, x19, #5, #1
-=20
-+	mrs	x18, CurrentEL
-+	cmp	x18, #CURRENTEL_EL2
-+	b.eq	1f
-+
- 	msr	elr_el3, x19
- 	msr	spsr_el3, x4
- 	eret
-=20
-+1:	msr	elr_el2, x19
-+	msr	spsr_el2, x4
-+	eret
-+
- 	.ltorg
-=20
- 	.data
- 	.align 3
- flag_no_el3:
- 	.long 0
-+spsr_to_elx:
-+	.long 0
-diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/c=
pu.h
-index ccb5397..2b3a0a4 100644
---- a/arch/aarch64/include/asm/cpu.h
-+++ b/arch/aarch64/include/asm/cpu.h
-@@ -11,6 +11,7 @@
-=20
- #define MPIDR_ID_BITS		0xff00ffffff
-=20
-+#define CURRENTEL_EL2		(2 << 2)
- #define CURRENTEL_EL3		(3 << 2)
-=20
- /*
-@@ -24,6 +25,7 @@
- #define SPSR_I			(1 << 7)	/* IRQ masked */
- #define SPSR_F			(1 << 6)	/* FIQ masked */
- #define SPSR_T			(1 << 5)	/* Thumb */
-+#define SPSR_EL1H		(5 << 0)	/* EL1 Handler mode */
- #define SPSR_EL2H		(9 << 0)	/* EL2 Handler mode */
- #define SPSR_HYP		(0x1a << 0)	/* M[3:0] =3D hyp, M[4] =3D AArch32 */
-=20
-@@ -42,6 +44,7 @@
- #else
- #define SCTLR_EL1_RESET		SCTLR_EL1_RES1
- #define SPSR_KERNEL		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL2H)
-+#define SPSR_KERNEL_EL1		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL1H=
)
- #endif
-=20
- #ifndef __ASSEMBLY__
-diff --git a/arch/aarch64/include/asm/gic-v3.h b/arch/aarch64/include/as=
m/gic-v3.h
-index e743c02..f8ddb27 100644
---- a/arch/aarch64/include/asm/gic-v3.h
-+++ b/arch/aarch64/include/asm/gic-v3.h
-@@ -15,21 +15,38 @@
- #define ICC_CTLR_EL3	"S3_6_C12_C12_4"
- #define ICC_PMR_EL1	"S3_0_C4_C6_0"
-=20
-+static inline uint32_t current_el(void)
-+{
-+	uint32_t val;
-+
-+	asm volatile ("mrs %0, CurrentEL" : "=3Dr" (val));
-+	return val;
-+}
-+
- static inline uint32_t gic_read_icc_sre(void)
- {
- 	uint32_t val;
--	asm volatile ("mrs %0, " ICC_SRE_EL3 : "=3Dr" (val));
-+
-+	if(current_el() =3D=3D CURRENTEL_EL3)
-+		asm volatile ("mrs %0, " ICC_SRE_EL3 : "=3Dr" (val));
-+	else
-+		asm volatile ("mrs %0, " ICC_SRE_EL2 : "=3Dr" (val));
-+
- 	return val;
- }
-=20
- static inline void gic_write_icc_sre(uint32_t val)
- {
--	asm volatile ("msr " ICC_SRE_EL3 ", %0" : : "r" (val));
-+	if(current_el() =3D=3D CURRENTEL_EL3)
-+		asm volatile ("msr " ICC_SRE_EL3 ", %0" : : "r" (val));
-+	else
-+		asm volatile ("msr " ICC_SRE_EL2 ", %0" : : "r" (val));
- }
-=20
- static inline void gic_write_icc_ctlr(uint32_t val)
- {
--	asm volatile ("msr " ICC_CTLR_EL3 ", %0" : : "r" (val));
-+	if(current_el() =3D=3D CURRENTEL_EL3)
-+		asm volatile ("msr " ICC_CTLR_EL3 ", %0" : : "r" (val));
- }
-=20
- #endif
-diff --git a/arch/aarch64/psci.S b/arch/aarch64/psci.S
-index 01ebe7d..0681d5e 100644
---- a/arch/aarch64/psci.S
-+++ b/arch/aarch64/psci.S
-@@ -45,8 +45,8 @@ vector:
-=20
- 	.text
-=20
--	.globl start_no_el3
--	.globl start_el3
-+	.globl start_no_el_max
-+	.globl start_el_max
-=20
- err_exception:
- 	b err_exception
-@@ -101,7 +101,7 @@ smc_exit:
- 	eret
-=20
-=20
--start_el3:
-+start_el_max:
- 	ldr	x0, =3Dvector
- 	bl	setup_vector
-=20
-@@ -111,10 +111,11 @@ start_el3:
- 	b	psci_first_spin
-=20
- /*
-- * This PSCI implementation requires EL3. Without EL3 we'll only boot t=
he
-- * primary cpu, all others will be trapped in an infinite loop.
-+ * This PSCI implementation requires EL3 or AArch64-R EL2. Without EL m=
ax
-+ * we'll only boot the primary cpu, all others will be trapped in an in=
finite
-+ * loop.
-  */
--start_no_el3:
-+start_no_el_max:
- 	cpuid	x0, x1
- 	bl	find_logical_id
- 	cbz	x0, psci_first_spin
-diff --git a/arch/aarch64/spin.S b/arch/aarch64/spin.S
-index 72603cf..fa1d657 100644
---- a/arch/aarch64/spin.S
-+++ b/arch/aarch64/spin.S
-@@ -11,11 +11,11 @@
-=20
- 	.text
-=20
--	.globl start_no_el3
--	.globl start_el3
-+	.globl start_no_el_max
-+	.globl start_el_max
-=20
--start_el3:
--start_no_el3:
-+start_el_max:
-+start_no_el_max:
- 	cpuid	x0, x1
- 	bl	find_logical_id
-=20
-diff --git a/arch/aarch64/utils.S b/arch/aarch64/utils.S
-index ae22ea7..2a63fa7 100644
---- a/arch/aarch64/utils.S
-+++ b/arch/aarch64/utils.S
-@@ -41,6 +41,14 @@ find_logical_id:
-  * x0: vector address
-  */
- setup_vector:
-+	mrs	x1, CurrentEL
-+	cmp	x1, #CURRENTEL_EL2
-+	b.eq	1f
-+
- 	msr	VBAR_EL3, x0
- 	isb
- 	ret
-+
-+1:	msr	VBAR_EL2, x0
-+	isb
-+	ret
---=20
-2.17.1
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0003-aarch64-Prepare-for-lower-EL-booting.patch b/meta-arm-bsp=
/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0003-aarch64-P=
repare-for-lower-EL-booting.patch
new file mode 100644
index 0000000..db81355
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0003-aarch64-Prepare-for-lower-EL-booting.patch
@@ -0,0 +1,55 @@
+From ce628de7699dd6401ddf713efaa49872e2733619 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 May 2021 07:25:00 +0100
+Subject: [PATCH] aarch64: Prepare for lower EL booting
+
+Save SPSR_KERNEL into spsr_to_elx during el3_init.
+The jump_kernel will load spsr_to_elx into spsr_el3.
+
+This change will make it easier to control whether drop to lower EL
+before jumping to the kernel.
+
+Upstream-Status: Pending
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Reviewed-by: Andre Przywara <andre.przywara@arm.com>
+---
+ arch/aarch64/boot.S | 15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index b589744..6b45afc 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -130,7 +130,16 @@ el3_init:
+ 	mov	x0, #ZCR_EL3_LEN_MASK		// SVE: Enable full vector len
+ 	msr	ZCR_EL3, x0			// for EL2.
+=20
+-1:
++	/*
++	 * Save SPSR_KERNEL into spsr_to_elx.
++	 * The jump_kernel will load spsr_to_elx into spsr_el3
++	 */
++1:	mov	w0, #SPSR_KERNEL
++	ldr	x1, =3Dspsr_to_elx
++	str	w0, [x1]
++	b	el_max_init
++
++el_max_init:
+ 	ldr	x0, =3DCOUNTER_FREQ
+ 	msr	cntfrq_el0, x0
+=20
+@@ -178,7 +187,7 @@ ASM_FUNC(jump_kernel)
+ 	b.eq	1f
+ 	br	x19			// Keep current EL
+=20
+-1:	mov	x4, #SPSR_KERNEL
++1:	ldr	w4, spsr_to_elx
+=20
+ 	/*
+ 	 * If bit 0 of the kernel address is set, we're entering in AArch32
+@@ -196,3 +205,5 @@ ASM_FUNC(jump_kernel)
+ 	.align 3
+ flag_keep_el:
+ 	.long 0
++spsr_to_elx:
++	.long 0
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch b/meta-arm-bsp/re=
cipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0004-gic-v3-Prepa=
re-for-gicv3-with-EL2.patch
new file mode 100644
index 0000000..e10182e
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0004-gic-v3-Prepare-for-gicv3-with-EL2.patch
@@ -0,0 +1,105 @@
+From 483d363bf825082b6db6de3c57d169e741861891 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 May 2021 07:25:00 +0100
+Subject: [PATCH] gic-v3: Prepare for gicv3 with EL2
+
+This is a preparation for allowing boot-wrapper configuring the gicv3
+with EL2.
+
+When confiuring with EL2, since there is no ICC_CTLR_EL2, the
+ICC_CTLR_EL3 cannot be replaced with ICC_CTLR_EL2 simply.
+See [https://developer.arm.com/documentation/ihi0069/latest/].
+
+As the caller, gic_secure_init expects the ICC_CTLR to be written,
+we change the function into gic_init_icc_ctlr(). In the GIC spec,
+the r/w bits in this register ([6:0]) either affect EL3 IRQ routing
+(not applicable since no EL3), non-secure IRQ handling (not applicable
+since only secure state in Armv8-R aarch64), or are aliased to
+ICC_CTLR_EL1 bits.
+So, based on this, the new gic_init_icc_ctlr() would be:
+When currentEL is EL3, init ICC_CTLR_EL3 as before.
+When currentEL is not EL3, init ICC_CTLR_EL1 with ICC_CTLR_EL1_RESET.
+
+Upstream-Status: Pending
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Reviewed-by: Andre Przywara <andre.przywara@arm.com>
+---
+ arch/aarch32/include/asm/gic-v3.h |  7 +++++++
+ arch/aarch64/include/asm/gic-v3.h | 23 ++++++++++++++++++++---
+ common/gic-v3.c                   |  2 +-
+ 3 files changed, 28 insertions(+), 4 deletions(-)
+
+diff --git a/arch/aarch32/include/asm/gic-v3.h b/arch/aarch32/include/as=
m/gic-v3.h
+index 65f38de..11e7bc7 100644
+--- a/arch/aarch32/include/asm/gic-v3.h
++++ b/arch/aarch32/include/asm/gic-v3.h
+@@ -9,6 +9,8 @@
+ #ifndef __ASM_AARCH32_GICV3_H
+ #define __ASM_AARCH32_GICV3_H
+=20
++#define ICC_CTLR_RESET (0UL)
++
+ static inline void gic_write_icc_sre(uint32_t val)
+ {
+ 	asm volatile ("mcr p15, 6, %0, c12, c12, 5" : : "r" (val));
+@@ -19,4 +21,9 @@ static inline void gic_write_icc_ctlr(uint32_t val)
+ 	asm volatile ("mcr p15, 6, %0, c12, c12, 4" : : "r" (val));
+ }
+=20
++static inline void gic_init_icc_ctlr()
++{
++	gic_write_icc_ctlr(ICC_CTLR_RESET);
++}
++
+ #endif
+diff --git a/arch/aarch64/include/asm/gic-v3.h b/arch/aarch64/include/as=
m/gic-v3.h
+index 5b32380..090ab0b 100644
+--- a/arch/aarch64/include/asm/gic-v3.h
++++ b/arch/aarch64/include/asm/gic-v3.h
+@@ -15,14 +15,31 @@
+ #define ICC_CTLR_EL3	"S3_6_C12_C12_4"
+ #define ICC_PMR_EL1	"S3_0_C4_C6_0"
+=20
++#define ICC_CTLR_EL3_RESET     (0UL)
++#define ICC_CTLR_EL1_RESET     (0UL)
++
++static inline uint32_t current_el(void)
++{
++	uint32_t val;
++
++	asm volatile ("mrs %0, CurrentEL" : "=3Dr" (val));
++	return val;
++}
++
+ static inline void gic_write_icc_sre(uint32_t val)
+ {
+-	asm volatile ("msr " ICC_SRE_EL3 ", %0" : : "r" (val));
++	if (current_el() =3D=3D CURRENTEL_EL3)
++		asm volatile ("msr " ICC_SRE_EL3 ", %0" : : "r" (val));
++	else
++		asm volatile ("msr " ICC_SRE_EL2 ", %0" : : "r" (val));
+ }
+=20
+-static inline void gic_write_icc_ctlr(uint32_t val)
++static inline void gic_init_icc_ctlr()
+ {
+-	asm volatile ("msr " ICC_CTLR_EL3 ", %0" : : "r" (val));
++	if (current_el() =3D=3D CURRENTEL_EL3)
++		asm volatile ("msr " ICC_CTLR_EL3 ", %0" : : "r" (ICC_CTLR_EL3_RESET)=
);
++	else
++		asm volatile ("msr " ICC_CTLR_EL1 ", %0" : : "r" (ICC_CTLR_EL1_RESET)=
);
+ }
+=20
+ #endif
+diff --git a/common/gic-v3.c b/common/gic-v3.c
+index 6207007..a0fe564 100644
+--- a/common/gic-v3.c
++++ b/common/gic-v3.c
+@@ -117,6 +117,6 @@ void gic_secure_init(void)
+ 	gic_write_icc_sre(ICC_SRE_Enable | ICC_SRE_DIB | ICC_SRE_DFB | ICC_SRE=
_SRE);
+ 	isb();
+=20
+-	gic_write_icc_ctlr(0);
++	gic_init_icc_ctlr();
+ 	isb();
+ }
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0005-aarch64-Prepare-for-booting-with-EL2.patch b/meta-arm-bsp=
/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0005-aarch64-P=
repare-for-booting-with-EL2.patch
new file mode 100644
index 0000000..3b6f78a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0005-aarch64-Prepare-for-booting-with-EL2.patch
@@ -0,0 +1,63 @@
+From be814863cdd5f61d9a16eec012d500550053c8c6 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 May 2021 07:25:00 +0100
+Subject: [PATCH] aarch64: Prepare for booting with EL2
+
+Prepare for allowing boot-wrapper to be entered in EL2.
+Detect current EL and set the corresponding EL registers.
+
+Upstream-Status: Pending
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Reviewed-by: Andre Przywara <andre.przywara@arm.com>
+---
+ arch/aarch64/boot.S  |  8 ++++++++
+ arch/aarch64/utils.S | 10 +++++++++-
+ 2 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index 6b45afc..908764a 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -195,10 +195,18 @@ ASM_FUNC(jump_kernel)
+ 	 */
+ 	bfi	x4, x19, #5, #1
+=20
++	mrs	x5, CurrentEL
++	cmp	x5, #CURRENTEL_EL2
++	b.eq	1f
++
+ 	msr	elr_el3, x19
+ 	msr	spsr_el3, x4
+ 	eret
+=20
++1:	msr	elr_el2, x19
++	msr	spsr_el2, x4
++	eret
++
+ 	.ltorg
+=20
+ 	.data
+diff --git a/arch/aarch64/utils.S b/arch/aarch64/utils.S
+index 85c7f8a..f02a249 100644
+--- a/arch/aarch64/utils.S
++++ b/arch/aarch64/utils.S
+@@ -34,10 +34,18 @@ ASM_FUNC(find_logical_id)
+ 	ret
+=20
+ /*
+- * Setup EL3 vectors
++ * Setup EL3/EL2 vectors
+  * x0: vector address
+  */
+ ASM_FUNC(setup_vector)
++	mrs	x1, CurrentEL
++	cmp	x1, #CURRENTEL_EL2
++	b.eq    1f
++
+ 	msr	VBAR_EL3, x0
+ 	isb
+ 	ret
++
++1:	msr	VBAR_EL2, x0
++	isb
++	ret
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch=
 b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64=
/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch
new file mode 100644
index 0000000..aaacc72
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0006-aarch64-Introduce-EL2-boot-code-for-Armv8-R-AArch64.patch
@@ -0,0 +1,182 @@
+From 81df76f8d94cb6c31c01739b078a72bdb8497441 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 25 May 2021 07:25:00 +0100
+Subject: [PATCH] aarch64: Introduce EL2 boot code for Armv8-R AArch64
+
+The Armv8-R AArch64 profile does not support the EL3 exception level.
+The Armv8-R AArch64 profile allows for an (optional) VMSAv8-64 MMU
+at EL1, which allows to run off-the-shelf Linux. However EL2 only
+supports a PMSA, which is not supported by Linux, so we need to drop
+into EL1 before entering the kernel.
+
+We add a new err_invalid_arch symbol as a dead loop. If we detect the
+current Armv8-R aarch64 only supports with PMSA, meaning we cannot boot
+Linux anymore, then we jump to err_invalid_arch.
+
+During Armv8-R aarch64 init, to make sure nothing unexpected traps into
+EL2, we auto-detect and config FIEN and EnSCXT in HCR_EL2.
+
+The boot sequence is:
+If CurrentEL =3D=3D EL3, then goto EL3 initialisation and drop to lower =
EL
+  before entering the kernel.
+If CurrentEL =3D=3D EL2 && id_aa64mmfr0_el1.MSA =3D=3D 0xf (Armv8-R aarc=
h64),
+  if id_aa64mmfr0_el1.MSA_frac =3D=3D 0x2,
+    then goto Armv8-R AArch64 initialisation and drop to EL1 before
+    entering the kernel.
+  else, which means VMSA unsupported and cannot boot Linux,
+    goto err_invalid_arch (dead loop).
+Else, no initialisation and keep the current EL before entering the
+  kernel.
+
+Upstream-Status: Pending
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+---
+ arch/aarch64/boot.S            | 92 +++++++++++++++++++++++++++++++++-
+ arch/aarch64/include/asm/cpu.h |  2 +
+ 2 files changed, 92 insertions(+), 2 deletions(-)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index 908764a..def9192 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -24,16 +24,24 @@ ASM_FUNC(_start)
+ 	 * Boot sequence
+ 	 * If CurrentEL =3D=3D EL3, then goto EL3 initialisation and drop to
+ 	 *   lower EL before entering the kernel.
++	 * If CurrentEL =3D=3D EL2 && id_aa64mmfr0_el1.MSA =3D=3D 0xf, then
++	 *   If id_aa64mmfr0_el1.MSA_frac =3D=3D 0x2, then goto
++	 *     Armv8-R AArch64 initialisation and drop to EL1 before
++	 *     entering the kernel.
++	 *   Else, which means VMSA unsupported and cannot boot Linux,
++	 *     goto err_invalid_arch (dead loop).
+ 	 * Else, no initialisation and keep the current EL before
+ 	 *   entering the kernel.
+ 	 */
+ 	mrs	x0, CurrentEL
+-	cmp	x0, #CURRENTEL_EL3
+-	b.eq	el3_init
++	cmp	x0, #CURRENTEL_EL2
++	bgt	el3_init
++	beq	el2_init
+=20
+ 	/*
+ 	 * We stay in the current EL for entering the kernel
+ 	 */
++keep_el:
+ 	mov	w0, #1
+ 	ldr	x1, =3Dflag_keep_el
+ 	str	w0, [x1]
+@@ -139,6 +147,85 @@ el3_init:
+ 	str	w0, [x1]
+ 	b	el_max_init
+=20
++	/*
++	 * EL2 Armv8-R AArch64 initialisation
++	 */
++el2_init:
++	/* Detect Armv8-R AArch64 */
++	mrs	x1, id_aa64mmfr0_el1
++	/*
++	 * Check MSA, bits [51:48]:
++	 * 0xf means Armv8-R AArch64.
++	 * If not 0xf, proceed in Armv8-A EL2.
++	 */
++	ubfx	x0, x1, #48, #4			// MSA
++	cmp	x0, 0xf
++	bne	keep_el
++	/*
++	 * Check MSA_frac, bits [55:52]:
++	 * 0x2 means EL1&0 translation regime also supports VMSAv8-64.
++	 */
++	ubfx	x0, x1, #52, #4			// MSA_frac
++	cmp	x0, 0x2
++	/*
++	 * If not 0x2, no VMSA, so cannot boot Linux and dead loop.
++	 * Also, since the architecture guarantees that those CPUID
++	 * fields never lose features when the value in a field
++	 * increases, we use blt to cover it.
++	*/
++	blt	err_invalid_arch
++
++	mrs	x0, midr_el1
++	msr	vpidr_el2, x0
++
++	mrs	x0, mpidr_el1
++	msr	vmpidr_el2, x0
++
++	mov	x0, #(1 << 31)			// VTCR_MSA: VMSAv8-64 support
++	msr	vtcr_el2, x0
++
++	/* Init HCR_EL2 */
++	mov	x0, #(1 << 31)			// RES1: Armv8-R aarch64 only
++
++	mrs	x1, id_aa64pfr0_el1
++	ubfx	x2, x1, #56, 4			// ID_AA64PFR0_EL1.CSV2
++	cmp	x2, 0x2
++	b.lt	1f
++	/*
++	 * Disable trap when accessing SCTXNUM_EL0 or SCTXNUM_EL1
++	 * if FEAT_CSV2.
++	 */
++	orr	x0, x0, #(1 << 53)		// HCR_EL2.EnSCXT
++
++1:	ubfx	x2, x1, #28, 4			// ID_AA64PFR0_EL1.RAS
++	cmp	x2, 0x2
++	b.lt	1f
++	/* Disable trap when accessing ERXPFGCDN_EL1 if FEAT_RASv1p1. */
++	orr	x0, x0, #(1 << 47)		// HCR_EL2.FIEN
++
++	/* Enable pointer authentication if present */
++1:	mrs	x1, id_aa64isar1_el1
++	/*
++	 * If ID_AA64ISAR1_EL1.{GPI, GPA, API, APA} =3D=3D {0000, 0000, 0000, =
0000}
++	 *   then HCR_EL2.APK and HCR_EL2.API are RES 0.
++	 * Else
++	 *   set HCR_EL2.APK and HCR_EL2.API.
++	 */
++	ldr	x2, =3D(((0xff) << 24) | (0xff << 4))
++	and	x1, x1, x2
++	cbz	x1, 1f
++
++	orr	x0, x0, #(1 << 40)		// HCR_EL2.APK
++	orr	x0, x0, #(1 << 41)		// HCR_EL2.API
++
++1:	msr	hcr_el2, x0
++	isb
++
++	mov	w0, #SPSR_KERNEL_EL1
++	ldr	x1, =3Dspsr_to_elx
++	str	w0, [x1]
++	// fall through
++
+ el_max_init:
+ 	ldr	x0, =3DCOUNTER_FREQ
+ 	msr	cntfrq_el0, x0
+@@ -148,6 +235,7 @@ el_max_init:
+ 	b	start_el_max
+=20
+ err_invalid_id:
++err_invalid_arch:
+ 	b	.
+=20
+ 	/*
+diff --git a/arch/aarch64/include/asm/cpu.h b/arch/aarch64/include/asm/c=
pu.h
+index b1003f4..91f803c 100644
+--- a/arch/aarch64/include/asm/cpu.h
++++ b/arch/aarch64/include/asm/cpu.h
+@@ -25,6 +25,7 @@
+ #define SPSR_I			(1 << 7)	/* IRQ masked */
+ #define SPSR_F			(1 << 6)	/* FIQ masked */
+ #define SPSR_T			(1 << 5)	/* Thumb */
++#define SPSR_EL1H		(5 << 0)	/* EL1 Handler mode */
+ #define SPSR_EL2H		(9 << 0)	/* EL2 Handler mode */
+ #define SPSR_HYP		(0x1a << 0)	/* M[3:0] =3D hyp, M[4] =3D AArch32 */
+=20
+@@ -43,6 +44,7 @@
+ #else
+ #define SCTLR_EL1_KERNEL	SCTLR_EL1_RES1
+ #define SPSR_KERNEL		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL2H)
++#define SPSR_KERNEL_EL1		(SPSR_A | SPSR_D | SPSR_I | SPSR_F | SPSR_EL1H=
)
+ #endif
+=20
+ #ifndef __ASSEMBLY__
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch b/m=
eta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/000=
7-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
similarity index 71%
rename from meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser=
-aemv8r64/0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
rename to meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-a=
emv8r64/0007-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
index fcd77b7..b130854 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0003-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0007-Allow-enable-psci-to-choose-between-smc-and-hvc.patch
@@ -1,4 +1,4 @@
-From 5120127e5f767b44a087c741a3438cef1e22ed50 Mon Sep 17 00:00:00 2001
+From f5a31b4f4ea8daaa0d337d5a2322ddb1912083fc Mon Sep 17 00:00:00 2001
 From: Qi Feng <qi.feng@arm.com>
 Date: Wed, 26 May 2021 17:52:01 +0800
 Subject: [PATCH] Allow --enable-psci to choose between smc and hvc
@@ -28,38 +28,47 @@ To use hvc, use --enable-psci=3Dhvc.
 [1]: https://developer.arm.com/documentation/ddi0600/latest/
=20
 Issue-Id: SCM-2654
+Upstream-Status: Pending
 Signed-off-by: Qi Feng <qi.feng@arm.com>
 Change-Id: Ib8afabdad2d98bc37371d165bbb6f1f9b88bfc87
=20
 Upstream-Status: Pending
 Signed-off-by: Huifeng Zhang <Huifeng.Zhang@arm.com>
 ---
- Makefile.am  |  2 +-
+ Makefile.am  | 10 +++++-----
  configure.ac | 14 +++++++++-----
- 2 files changed, 10 insertions(+), 6 deletions(-)
+ 2 files changed, 14 insertions(+), 10 deletions(-)
=20
 diff --git a/Makefile.am b/Makefile.am
-index ef6b793..a9ddd16 100644
+index f941b07..88a27de 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -47,7 +47,7 @@ BOOTMETHOD	:=3D psci.o
- OFILES		+=3D psci.o
- PSCI_NODE	:=3D psci {				\
- 			compatible =3D \"arm,psci\";	\
+@@ -50,11 +50,11 @@ endif
+ if PSCI
+ ARCH_OBJ	+=3D psci.o
+ COMMON_OBJ	+=3D psci.o
+-PSCI_NODE	:=3D psci {				\
+-			compatible =3D \"arm,psci\";	\
 -			method =3D \"smc\";		\
-+			method =3D \"$(PSCI_METHOD)\";	\
- 			cpu_on =3D <$(PSCI_CPU_ON)>;	\
- 			cpu_off =3D <$(PSCI_CPU_OFF)>;	\
+-			cpu_on =3D <$(PSCI_CPU_ON)>;	\
+-			cpu_off =3D <$(PSCI_CPU_OFF)>;	\
++PSCI_NODE	:=3D psci {						\
++			compatible =3D \"arm,psci\";			\
++			method =3D \"$(PSCI_METHOD)\";			\
++			cpu_on =3D <$(PSCI_CPU_ON)>;			\
++			cpu_off =3D <$(PSCI_CPU_OFF)>;			\
  		   };
+ CPU_NODES	:=3D $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/addpsci.pl $=
(KERNEL_DTB))
+ else
 diff --git a/configure.ac b/configure.ac
-index 6914eb4..9aab4a1 100644
+index 9e3b722..53e51be 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -83,13 +83,17 @@ AS_IF([test "x$X_IMAGE" !=3D "x"],
  # Allow a user to pass --enable-psci
  AC_ARG_ENABLE([psci],
- 	AS_HELP_STRING([--enable-psci], [enable the psci boot method]),
--	[USE_PSCI=3D$enableval])
+ 	AS_HELP_STRING([--disable-psci], [disable the psci boot method]),
+-	[USE_PSCI=3D$enableval], [USE_PSCI=3D"yes"])
 -AM_CONDITIONAL([PSCI], [test "x$USE_PSCI" =3D "xyes"])
 -AS_IF([test "x$USE_PSCI" =3D "xyes"], [], [USE_PSCI=3Dno])
 -
@@ -68,7 +77,7 @@ index 6914eb4..9aab4a1 100644
 +		yes|smc) USE_PSCI=3Dsmc ;;
 +		hvc) USE_PSCI=3Dhvc ;;
 +		*) AC_MSG_ERROR([Bad value "${enableval}" for --enable-psci. Use "smc=
" or "hvc"]) ;;
-+	esac])
++	esac], [USE_PSCI=3D"yes"])
 +AM_CONDITIONAL([PSCI], [test "x$USE_PSCI" =3D "xyes" -o "x$USE_PSCI" =3D=
 "xsmc" -o "x$USE_PSCI" =3D "xhvc"])
 +
 +AS_IF([test "x$USE_PSCI" =3D "xno" -a "x$KERNEL_ES" =3D "x32"],
@@ -78,6 +87,3 @@ index 6914eb4..9aab4a1 100644
 =20
  # Allow a user to pass --with-initrd
  AC_ARG_WITH([initrd],
---=20
-2.32.0
-
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch b/meta-a=
rm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0008-aar=
ch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
new file mode 100644
index 0000000..a14e54a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0008-aarch64-Disable-CNTPCT_EL0-trap-for-v8-R64.patch
@@ -0,0 +1,48 @@
+From 3f4614e02f0f8d2522510578da2752f8e3511bb3 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Mon, 25 Oct 2021 17:09:13 +0800
+Subject: [PATCH] aarch64: Disable CNTPCT_EL0 trap for v8-R64
+
+To allow EL1 to access CNTPCT_EL0 without traping into EL2, we need to
+set CNTHCTL_EL2.EL1PCTEN to 1.
+
+For v8-R64, the CNTHCTL_EL2 register follows the v8-A architecture.
+However, as described in the v8-A architecture profile, the
+CNTHCTL_EL2's bit assignments are different according to whether the
+FEAT_VHE is implemented.
+
+Since v8-R64 does not support FEAT_VHE, we do not need to detect
+FEAT_VHE. We can simply set CNTHCTL_EL2.EL1PCTEN to 1.
+
+Issue-ID: SCM-3508
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I4147e66341c8153312021e6f2ab67d0037246da1
+---
+ arch/aarch64/boot.S | 12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index def9192..6dbd5cc 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -219,6 +219,18 @@ el2_init:
+ 	orr	x0, x0, #(1 << 41)		// HCR_EL2.API
+=20
+ 1:	msr	hcr_el2, x0
++
++	/*
++	 * To disable trap when accessing CNTPCT_EL0, we need to set
++	 * CNTHCTL_EL2.EL1PCTEN to 1. However, the CNTHCTL_EL2 bit assignments
++	 * are different according to whether the FEAT_VHE is implemented.
++	 *
++	 * For Armv8-R AArch64, FEAT_VHE is not supported, so we do not need t=
o
++	 * detect FEAT_VHE(ID_AA64MMFR1_EL1.VH) and simply set
++	 * CNTHCTL_EL2.EL1PCTEN to 1.
++	 */
++	mov	x0, #1				// CNTHCTL_EL2.EL1PCTEN
++	msr	cnthctl_el2, x0
+ 	isb
+=20
+ 	mov	w0, #SPSR_KERNEL_EL1
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0009-lds-Mark-the-mem-range.patch b/meta-arm-bsp/recipes-bsp/b=
oot-wrapper-aarch64/files/fvp-baser-aemv8r64/0009-lds-Mark-the-mem-range.=
patch
new file mode 100644
index 0000000..3d4fec8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0009-lds-Mark-the-mem-range.patch
@@ -0,0 +1,38 @@
+From 2851f0e6c1216894b9498d7b91256bb1ef49e544 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 2 Nov 2021 15:10:28 +0800
+Subject: [PATCH] lds: Mark the mem range
+
+Add firmware_start and firmware_end, so that we can use them to
+calculate the mem range of boot-wrapper and then set the range to
+/memreserve/ of dtb.
+
+Issue-ID: SCM-3815
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: Idc5a2894e193c75381049a0f359b4b2a51c567ee
+---
+ model.lds.S | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/model.lds.S b/model.lds.S
+index d4e7e13..ab98ddf 100644
+--- a/model.lds.S
++++ b/model.lds.S
+@@ -64,6 +64,7 @@ SECTIONS
+ #endif
+=20
+ 	.boot PHYS_OFFSET: {
++		PROVIDE(firmware_start =3D .);
+ 		*(.init)
+ 		*(.text*)
+ 		*(.data* .rodata* .bss* COMMON)
+@@ -76,6 +77,7 @@ SECTIONS
+ 		mbox =3D .;
+ 		QUAD(0x0)
+ 	}
++	PROVIDE(firmware_end =3D .);
+=20
+ 	ASSERT(etext <=3D (PHYS_OFFSET + TEXT_LIMIT), ".text overflow!")
+ }
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0010-common-Introduce-the-libfdt.patch b/meta-arm-bsp/recipes-=
bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0010-common-Introduce-t=
he-libfdt.patch
new file mode 100644
index 0000000..e0496dc
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0010-common-Introduce-the-libfdt.patch
@@ -0,0 +1,6044 @@
+From fadf04f44b679d85e55b2e5f220fecbebb52ad03 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 28 Dec 2021 17:02:17 +0800
+Subject: [PATCH] common: Introduce the libfdt
+
+We introduce libfdt (v1.6.1) [1] to boot-wrapper, so we can dynamically
+add the firmware node.
+
+According to [2]: The libfdt is GPL/BSD dual-licensed which means it can
+be used either under the terms of GPL, or under the terms of BSD.
+We choose BSD because the boot-wrapper is under BSD.
+
+[1]: https://github.com/dgibson/dtc/tree/v1.6.1/libfdt
+[2]: https://github.com/dgibson/dtc/blob/v1.6.1/README.license
+
+Issue-Id: SCM-3814
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: Iec2f469053c8ac0ed38838c597b21a42bdf67b38
+---
+ common/libfdt/README.license    |   56 +
+ common/libfdt/fdt.c             |  335 +++++
+ common/libfdt/fdt_addresses.c   |  101 ++
+ common/libfdt/fdt_check.c       |   93 ++
+ common/libfdt/fdt_empty_tree.c  |   38 +
+ common/libfdt/fdt_overlay.c     |  882 +++++++++++++
+ common/libfdt/fdt_ro.c          |  859 +++++++++++++
+ common/libfdt/fdt_rw.c          |  500 +++++++
+ common/libfdt/fdt_strerror.c    |   59 +
+ common/libfdt/fdt_sw.c          |  384 ++++++
+ common/libfdt/fdt_wip.c         |   94 ++
+ common/libfdt/libfdt_internal.h |  192 +++
+ include/fdt.h                   |   66 +
+ include/libfdt.h                | 2147 +++++++++++++++++++++++++++++++
+ include/libfdt_env.h            |   95 ++
+ 15 files changed, 5901 insertions(+)
+ create mode 100644 common/libfdt/README.license
+ create mode 100644 common/libfdt/fdt.c
+ create mode 100644 common/libfdt/fdt_addresses.c
+ create mode 100644 common/libfdt/fdt_check.c
+ create mode 100644 common/libfdt/fdt_empty_tree.c
+ create mode 100644 common/libfdt/fdt_overlay.c
+ create mode 100644 common/libfdt/fdt_ro.c
+ create mode 100644 common/libfdt/fdt_rw.c
+ create mode 100644 common/libfdt/fdt_strerror.c
+ create mode 100644 common/libfdt/fdt_sw.c
+ create mode 100644 common/libfdt/fdt_wip.c
+ create mode 100644 common/libfdt/libfdt_internal.h
+ create mode 100644 include/fdt.h
+ create mode 100644 include/libfdt.h
+ create mode 100644 include/libfdt_env.h
+
+diff --git a/common/libfdt/README.license b/common/libfdt/README.license
+new file mode 100644
+index 0000000..102b004
+--- /dev/null
++++ b/common/libfdt/README.license
+@@ -0,0 +1,56 @@
++Licensing and contribution policy of dtc and libfdt
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
++
++This dtc package contains two pieces of software: dtc itself, and
++libfdt which comprises the files in the libfdt/ subdirectory.  These
++two pieces of software, although closely related, are quite distinct.
++dtc does not incorporate or rely on libfdt for its operation, nor vice
++versa.  It is important that these two pieces of software have
++different license conditions.
++
++As SPDX license tags in each source file attest, dtc is licensed
++under the GNU GPL.  The full text of the GPL can be found in the file
++entitled 'GPL' which should be included in this package.  dtc code,
++therefore, may not be incorporated into works which do not have a GPL
++compatible license.
++
++libfdt, however, is GPL/BSD dual-licensed.  That is, it may be used
++either under the terms of the GPL, or under the terms of the 2-clause
++BSD license (aka the ISC license).  The full terms of that license can
++be found are in the file entitled 'BSD-2-Clause'. This is, in
++practice, equivalent to being BSD licensed, since the terms of the BSD
++license are strictly more permissive than the GPL.
++
++I made the decision to license libfdt in this way because I want to
++encourage widespread and correct usage of flattened device trees,
++including by proprietary or otherwise GPL-incompatible firmware or
++tools.  Allowing libfdt to be used under the terms of the BSD license
++makes that it easier for vendors or authors of such software to do so.
++
++This does mean that libfdt code could be "stolen" - say, included in a
++proprietary fimware and extended without contributing those extensions
++back to the libfdt mainline.  While I hope that doesn't happen, I
++believe the goal of allowing libfdt to be widely used is more
++important than avoiding that.  libfdt is quite small, and hardly
++rocket science; so the incentive for such impolite behaviour is small,
++and the inconvenience caused thereby is not dire.
++
++Licenses such as the LGPL which would allow code to be used in non-GPL
++software, but also require contributions to be returned were
++considered.  However, libfdt is designed to be used in firmwares and
++other environments with unusual technical constraints.  It's difficult
++to anticipate all possible changes which might be needed to meld
++libfdt into such environments and so difficult to suitably word a
++license that puts the boundary between what is and isn't permitted in
++the intended place.  Again, I judged encouraging widespread use of
++libfdt by keeping the license terms simple and familiar to be the more
++important goal.
++
++**IMPORTANT** It's intended that all of libfdt as released remain
++permissively licensed this way.  Therefore only contributions which
++are released under these terms can be merged into the libfdt mainline.
++
++
++David Gibson <david@gibson.dropbear.id.au>
++(principal original author of dtc and libfdt)
++2 November 2007
+diff --git a/common/libfdt/fdt.c b/common/libfdt/fdt.c
+new file mode 100644
+index 0000000..9fe7cf4
+--- /dev/null
++++ b/common/libfdt/fdt.c
+@@ -0,0 +1,335 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++/*
++ * Minimal sanity check for a read-only tree. fdt_ro_probe_() checks
++ * that the given buffer contains what appears to be a flattened
++ * device tree with sane information in its header.
++ */
++int32_t fdt_ro_probe_(const void *fdt)
++{
++	uint32_t totalsize =3D fdt_totalsize(fdt);
++
++	if (can_assume(VALID_DTB))
++		return totalsize;
++
++	/* The device tree must be at an 8-byte aligned address */
++	if ((uintptr_t)fdt & 7)
++		return -FDT_ERR_ALIGNMENT;
++
++	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
++		/* Complete tree */
++		if (!can_assume(LATEST)) {
++			if (fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
++				return -FDT_ERR_BADVERSION;
++			if (fdt_last_comp_version(fdt) >
++					FDT_LAST_SUPPORTED_VERSION)
++				return -FDT_ERR_BADVERSION;
++		}
++	} else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
++		/* Unfinished sequential-write blob */
++		if (!can_assume(VALID_INPUT) && fdt_size_dt_struct(fdt) =3D=3D 0)
++			return -FDT_ERR_BADSTATE;
++	} else {
++		return -FDT_ERR_BADMAGIC;
++	}
++
++	if (totalsize < INT32_MAX)
++		return totalsize;
++	else
++		return -FDT_ERR_TRUNCATED;
++}
++
++static int check_off_(uint32_t hdrsize, uint32_t totalsize, uint32_t of=
f)
++{
++	return (off >=3D hdrsize) && (off <=3D totalsize);
++}
++
++static int check_block_(uint32_t hdrsize, uint32_t totalsize,
++			uint32_t base, uint32_t size)
++{
++	if (!check_off_(hdrsize, totalsize, base))
++		return 0; /* block start out of bounds */
++	if ((base + size) < base)
++		return 0; /* overflow */
++	if (!check_off_(hdrsize, totalsize, base + size))
++		return 0; /* block end out of bounds */
++	return 1;
++}
++
++size_t fdt_header_size_(uint32_t version)
++{
++	if (version <=3D 1)
++		return FDT_V1_SIZE;
++	else if (version <=3D 2)
++		return FDT_V2_SIZE;
++	else if (version <=3D 3)
++		return FDT_V3_SIZE;
++	else if (version <=3D 16)
++		return FDT_V16_SIZE;
++	else
++		return FDT_V17_SIZE;
++}
++
++size_t fdt_header_size(const void *fdt)
++{
++	return can_assume(LATEST) ? FDT_V17_SIZE :
++		fdt_header_size_(fdt_version(fdt));
++}
++
++int fdt_check_header(const void *fdt)
++{
++	size_t hdrsize;
++
++	/* The device tree must be at an 8-byte aligned address */
++	if ((uintptr_t)fdt & 7)
++		return -FDT_ERR_ALIGNMENT;
++
++	if (fdt_magic(fdt) !=3D FDT_MAGIC)
++		return -FDT_ERR_BADMAGIC;
++	if (!can_assume(LATEST)) {
++		if ((fdt_version(fdt) < FDT_FIRST_SUPPORTED_VERSION)
++		    || (fdt_last_comp_version(fdt) >
++			FDT_LAST_SUPPORTED_VERSION))
++			return -FDT_ERR_BADVERSION;
++		if (fdt_version(fdt) < fdt_last_comp_version(fdt))
++			return -FDT_ERR_BADVERSION;
++	}
++	hdrsize =3D fdt_header_size(fdt);
++	if (!can_assume(VALID_DTB)) {
++
++		if ((fdt_totalsize(fdt) < hdrsize)
++		    || (fdt_totalsize(fdt) > INT_MAX))
++			return -FDT_ERR_TRUNCATED;
++
++		/* Bounds check memrsv block */
++		if (!check_off_(hdrsize, fdt_totalsize(fdt),
++				fdt_off_mem_rsvmap(fdt)))
++			return -FDT_ERR_TRUNCATED;
++	}
++
++	if (!can_assume(VALID_DTB)) {
++		/* Bounds check structure block */
++		if (!can_assume(LATEST) && fdt_version(fdt) < 17) {
++			if (!check_off_(hdrsize, fdt_totalsize(fdt),
++					fdt_off_dt_struct(fdt)))
++				return -FDT_ERR_TRUNCATED;
++		} else {
++			if (!check_block_(hdrsize, fdt_totalsize(fdt),
++					  fdt_off_dt_struct(fdt),
++					  fdt_size_dt_struct(fdt)))
++				return -FDT_ERR_TRUNCATED;
++		}
++
++		/* Bounds check strings block */
++		if (!check_block_(hdrsize, fdt_totalsize(fdt),
++				  fdt_off_dt_strings(fdt),
++				  fdt_size_dt_strings(fdt)))
++			return -FDT_ERR_TRUNCATED;
++	}
++
++	return 0;
++}
++
++const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int le=
n)
++{
++	unsigned int uoffset =3D offset;
++	unsigned int absoffset =3D offset + fdt_off_dt_struct(fdt);
++
++	if (offset < 0)
++		return NULL;
++
++	if (!can_assume(VALID_INPUT))
++		if ((absoffset < uoffset)
++		    || ((absoffset + len) < absoffset)
++		    || (absoffset + len) > fdt_totalsize(fdt))
++			return NULL;
++
++	if (can_assume(LATEST) || fdt_version(fdt) >=3D 0x11)
++		if (((uoffset + len) < uoffset)
++		    || ((offset + len) > fdt_size_dt_struct(fdt)))
++			return NULL;
++
++	return fdt_offset_ptr_(fdt, offset);
++}
++
++uint32_t fdt_next_tag(const void *fdt, int startoffset, int *nextoffset=
)
++{
++	const fdt32_t *tagp, *lenp;
++	uint32_t tag;
++	int offset =3D startoffset;
++	const char *p;
++
++	*nextoffset =3D -FDT_ERR_TRUNCATED;
++	tagp =3D fdt_offset_ptr(fdt, offset, FDT_TAGSIZE);
++	if (!can_assume(VALID_DTB) && !tagp)
++		return FDT_END; /* premature end */
++	tag =3D fdt32_to_cpu(*tagp);
++	offset +=3D FDT_TAGSIZE;
++
++	*nextoffset =3D -FDT_ERR_BADSTRUCTURE;
++	switch (tag) {
++	case FDT_BEGIN_NODE:
++		/* skip name */
++		do {
++			p =3D fdt_offset_ptr(fdt, offset++, 1);
++		} while (p && (*p !=3D '\0'));
++		if (!can_assume(VALID_DTB) && !p)
++			return FDT_END; /* premature end */
++		break;
++
++	case FDT_PROP:
++		lenp =3D fdt_offset_ptr(fdt, offset, sizeof(*lenp));
++		if (!can_assume(VALID_DTB) && !lenp)
++			return FDT_END; /* premature end */
++		/* skip-name offset, length and value */
++		offset +=3D sizeof(struct fdt_property) - FDT_TAGSIZE
++			+ fdt32_to_cpu(*lenp);
++		if (!can_assume(LATEST) &&
++		    fdt_version(fdt) < 0x10 && fdt32_to_cpu(*lenp) >=3D 8 &&
++		    ((offset - fdt32_to_cpu(*lenp)) % 8) !=3D 0)
++			offset +=3D 4;
++		break;
++
++	case FDT_END:
++	case FDT_END_NODE:
++	case FDT_NOP:
++		break;
++
++	default:
++		return FDT_END;
++	}
++
++	if (!fdt_offset_ptr(fdt, startoffset, offset - startoffset))
++		return FDT_END; /* premature end */
++
++	*nextoffset =3D FDT_TAGALIGN(offset);
++	return tag;
++}
++
++int fdt_check_node_offset_(const void *fdt, int offset)
++{
++	if (!can_assume(VALID_INPUT)
++	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
++		return -FDT_ERR_BADOFFSET;
++
++	if (fdt_next_tag(fdt, offset, &offset) !=3D FDT_BEGIN_NODE)
++		return -FDT_ERR_BADOFFSET;
++
++	return offset;
++}
++
++int fdt_check_prop_offset_(const void *fdt, int offset)
++{
++	if (!can_assume(VALID_INPUT)
++	    && ((offset < 0) || (offset % FDT_TAGSIZE)))
++		return -FDT_ERR_BADOFFSET;
++
++	if (fdt_next_tag(fdt, offset, &offset) !=3D FDT_PROP)
++		return -FDT_ERR_BADOFFSET;
++
++	return offset;
++}
++
++int fdt_next_node(const void *fdt, int offset, int *depth)
++{
++	int nextoffset =3D 0;
++	uint32_t tag;
++
++	if (offset >=3D 0)
++		if ((nextoffset =3D fdt_check_node_offset_(fdt, offset)) < 0)
++			return nextoffset;
++
++	do {
++		offset =3D nextoffset;
++		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
++
++		switch (tag) {
++		case FDT_PROP:
++		case FDT_NOP:
++			break;
++
++		case FDT_BEGIN_NODE:
++			if (depth)
++				(*depth)++;
++			break;
++
++		case FDT_END_NODE:
++			if (depth && ((--(*depth)) < 0))
++				return nextoffset;
++			break;
++
++		case FDT_END:
++			if ((nextoffset >=3D 0)
++			    || ((nextoffset =3D=3D -FDT_ERR_TRUNCATED) && !depth))
++				return -FDT_ERR_NOTFOUND;
++			else
++				return nextoffset;
++		}
++	} while (tag !=3D FDT_BEGIN_NODE);
++
++	return offset;
++}
++
++int fdt_first_subnode(const void *fdt, int offset)
++{
++	int depth =3D 0;
++
++	offset =3D fdt_next_node(fdt, offset, &depth);
++	if (offset < 0 || depth !=3D 1)
++		return -FDT_ERR_NOTFOUND;
++
++	return offset;
++}
++
++int fdt_next_subnode(const void *fdt, int offset)
++{
++	int depth =3D 1;
++
++	/*
++	 * With respect to the parent, the depth of the next subnode will be
++	 * the same as the last.
++	 */
++	do {
++		offset =3D fdt_next_node(fdt, offset, &depth);
++		if (offset < 0 || depth < 1)
++			return -FDT_ERR_NOTFOUND;
++	} while (depth > 1);
++
++	return offset;
++}
++
++const char *fdt_find_string_(const char *strtab, int tabsize, const cha=
r *s)
++{
++	int len =3D strlen(s) + 1;
++	const char *last =3D strtab + tabsize - len;
++	const char *p;
++
++	for (p =3D strtab; p <=3D last; p++)
++		if (memcmp(p, s, len) =3D=3D 0)
++			return p;
++	return NULL;
++}
++
++int fdt_move(const void *fdt, void *buf, int bufsize)
++{
++	if (!can_assume(VALID_INPUT) && bufsize < 0)
++		return -FDT_ERR_NOSPACE;
++
++	FDT_RO_PROBE(fdt);
++
++	if (fdt_totalsize(fdt) > (unsigned int)bufsize)
++		return -FDT_ERR_NOSPACE;
++
++	memmove(buf, fdt, fdt_totalsize(fdt));
++	return 0;
++}
+diff --git a/common/libfdt/fdt_addresses.c b/common/libfdt/fdt_addresses=
.c
+new file mode 100644
+index 0000000..9a82cd0
+--- /dev/null
++++ b/common/libfdt/fdt_addresses.c
+@@ -0,0 +1,101 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2014 David Gibson <david@gibson.dropbear.id.au>
++ * Copyright (C) 2018 embedded brains GmbH
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++static int fdt_cells(const void *fdt, int nodeoffset, const char *name)
++{
++	const fdt32_t *c;
++	uint32_t val;
++	int len;
++
++	c =3D fdt_getprop(fdt, nodeoffset, name, &len);
++	if (!c)
++		return len;
++
++	if (len !=3D sizeof(*c))
++		return -FDT_ERR_BADNCELLS;
++
++	val =3D fdt32_to_cpu(*c);
++	if (val > FDT_MAX_NCELLS)
++		return -FDT_ERR_BADNCELLS;
++
++	return (int)val;
++}
++
++int fdt_address_cells(const void *fdt, int nodeoffset)
++{
++	int val;
++
++	val =3D fdt_cells(fdt, nodeoffset, "#address-cells");
++	if (val =3D=3D 0)
++		return -FDT_ERR_BADNCELLS;
++	if (val =3D=3D -FDT_ERR_NOTFOUND)
++		return 2;
++	return val;
++}
++
++int fdt_size_cells(const void *fdt, int nodeoffset)
++{
++	int val;
++
++	val =3D fdt_cells(fdt, nodeoffset, "#size-cells");
++	if (val =3D=3D -FDT_ERR_NOTFOUND)
++		return 1;
++	return val;
++}
++
++/* This function assumes that [address|size]_cells is 1 or 2 */
++int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
++			     const char *name, uint64_t addr, uint64_t size)
++{
++	int addr_cells, size_cells, ret;
++	uint8_t data[sizeof(fdt64_t) * 2], *prop;
++
++	ret =3D fdt_address_cells(fdt, parent);
++	if (ret < 0)
++		return ret;
++	addr_cells =3D ret;
++
++	ret =3D fdt_size_cells(fdt, parent);
++	if (ret < 0)
++		return ret;
++	size_cells =3D ret;
++
++	/* check validity of address */
++	prop =3D data;
++	if (addr_cells =3D=3D 1) {
++		if ((addr > UINT32_MAX) || ((UINT32_MAX + 1 - addr) < size))
++			return -FDT_ERR_BADVALUE;
++
++		fdt32_st(prop, (uint32_t)addr);
++	} else if (addr_cells =3D=3D 2) {
++		fdt64_st(prop, addr);
++	} else {
++		return -FDT_ERR_BADNCELLS;
++	}
++
++	/* check validity of size */
++	prop +=3D addr_cells * sizeof(fdt32_t);
++	if (size_cells =3D=3D 1) {
++		if (size > UINT32_MAX)
++			return -FDT_ERR_BADVALUE;
++
++		fdt32_st(prop, (uint32_t)size);
++	} else if (size_cells =3D=3D 2) {
++		fdt64_st(prop, size);
++	} else {
++		return -FDT_ERR_BADNCELLS;
++	}
++
++	return fdt_appendprop(fdt, nodeoffset, name, data,
++			      (addr_cells + size_cells) * sizeof(fdt32_t));
++}
+diff --git a/common/libfdt/fdt_check.c b/common/libfdt/fdt_check.c
+new file mode 100644
+index 0000000..fa410a8
+--- /dev/null
++++ b/common/libfdt/fdt_check.c
+@@ -0,0 +1,93 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++int fdt_check_full(const void *fdt, size_t bufsize)
++{
++	int err;
++	int num_memrsv;
++	int offset, nextoffset =3D 0;
++	uint32_t tag;
++	unsigned int depth =3D 0;
++	const void *prop;
++	const char *propname;
++	bool expect_end =3D false;
++
++	if (bufsize < FDT_V1_SIZE)
++		return -FDT_ERR_TRUNCATED;
++	if (bufsize < fdt_header_size(fdt))
++		return -FDT_ERR_TRUNCATED;
++	err =3D fdt_check_header(fdt);
++	if (err !=3D 0)
++		return err;
++	if (bufsize < fdt_totalsize(fdt))
++		return -FDT_ERR_TRUNCATED;
++
++	num_memrsv =3D fdt_num_mem_rsv(fdt);
++	if (num_memrsv < 0)
++		return num_memrsv;
++
++	while (1) {
++		offset =3D nextoffset;
++		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
++
++		if (nextoffset < 0)
++			return nextoffset;
++
++		/* If we see two root nodes, something is wrong */
++		if (expect_end && tag !=3D FDT_END)
++			return -FDT_ERR_BADSTRUCTURE;
++
++		switch (tag) {
++		case FDT_NOP:
++			break;
++
++		case FDT_END:
++			if (depth !=3D 0)
++				return -FDT_ERR_BADSTRUCTURE;
++			return 0;
++
++		case FDT_BEGIN_NODE:
++			depth++;
++			if (depth > INT_MAX)
++				return -FDT_ERR_BADSTRUCTURE;
++
++			/* The root node must have an empty name */
++			if (depth =3D=3D 1) {
++				const char *name;
++				int len;
++
++				name =3D fdt_get_name(fdt, offset, &len);
++				if (*name || len)
++					return -FDT_ERR_BADSTRUCTURE;
++			}
++			break;
++
++		case FDT_END_NODE:
++			if (depth =3D=3D 0)
++				return -FDT_ERR_BADSTRUCTURE;
++			depth--;
++			if (depth =3D=3D 0)
++				expect_end =3D true;
++			break;
++
++		case FDT_PROP:
++			prop =3D fdt_getprop_by_offset(fdt, offset, &propname,
++						     &err);
++			if (!prop)
++				return err;
++			break;
++
++		default:
++			return -FDT_ERR_INTERNAL;
++		}
++	}
++}
+diff --git a/common/libfdt/fdt_empty_tree.c b/common/libfdt/fdt_empty_tr=
ee.c
+new file mode 100644
+index 0000000..49d54d4
+--- /dev/null
++++ b/common/libfdt/fdt_empty_tree.c
+@@ -0,0 +1,38 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2012 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++int fdt_create_empty_tree(void *buf, int bufsize)
++{
++	int err;
++
++	err =3D fdt_create(buf, bufsize);
++	if (err)
++		return err;
++
++	err =3D fdt_finish_reservemap(buf);
++	if (err)
++		return err;
++
++	err =3D fdt_begin_node(buf, "");
++	if (err)
++		return err;
++
++	err =3D  fdt_end_node(buf);
++	if (err)
++		return err;
++
++	err =3D fdt_finish(buf);
++	if (err)
++		return err;
++
++	return fdt_open_into(buf, buf, bufsize);
++}
+diff --git a/common/libfdt/fdt_overlay.c b/common/libfdt/fdt_overlay.c
+new file mode 100644
+index 0000000..d217e79
+--- /dev/null
++++ b/common/libfdt/fdt_overlay.c
+@@ -0,0 +1,882 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2016 Free Electrons
++ * Copyright (C) 2016 NextThing Co.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++/**
++ * overlay_get_target_phandle - retrieves the target phandle of a fragm=
ent
++ * @fdto: pointer to the device tree overlay blob
++ * @fragment: node offset of the fragment in the overlay
++ *
++ * overlay_get_target_phandle() retrieves the target phandle of an
++ * overlay fragment when that fragment uses a phandle (target
++ * property) instead of a path (target-path property).
++ *
++ * returns:
++ *      the phandle pointed by the target property
++ *      0, if the phandle was not found
++ *	-1, if the phandle was malformed
++ */
++static uint32_t overlay_get_target_phandle(const void *fdto, int fragme=
nt)
++{
++	const fdt32_t *val;
++	int len;
++
++	val =3D fdt_getprop(fdto, fragment, "target", &len);
++	if (!val)
++		return 0;
++
++	if ((len !=3D sizeof(*val)) || (fdt32_to_cpu(*val) =3D=3D (uint32_t)-1=
))
++		return (uint32_t)-1;
++
++	return fdt32_to_cpu(*val);
++}
++
++/**
++ * overlay_get_target - retrieves the offset of a fragment's target
++ * @fdt: Base device tree blob
++ * @fdto: Device tree overlay blob
++ * @fragment: node offset of the fragment in the overlay
++ * @pathp: pointer which receives the path of the target (or NULL)
++ *
++ * overlay_get_target() retrieves the target offset in the base
++ * device tree of a fragment, no matter how the actual targeting is
++ * done (through a phandle or a path)
++ *
++ * returns:
++ *      the targeted node offset in the base device tree
++ *      Negative error code on error
++ */
++static int overlay_get_target(const void *fdt, const void *fdto,
++			      int fragment, char const **pathp)
++{
++	uint32_t phandle;
++	const char *path =3D NULL;
++	int path_len =3D 0, ret;
++
++	/* Try first to do a phandle based lookup */
++	phandle =3D overlay_get_target_phandle(fdto, fragment);
++	if (phandle =3D=3D (uint32_t)-1)
++		return -FDT_ERR_BADPHANDLE;
++
++	/* no phandle, try path */
++	if (!phandle) {
++		/* And then a path based lookup */
++		path =3D fdt_getprop(fdto, fragment, "target-path", &path_len);
++		if (path)
++			ret =3D fdt_path_offset(fdt, path);
++		else
++			ret =3D path_len;
++	} else
++		ret =3D fdt_node_offset_by_phandle(fdt, phandle);
++
++	/*
++	* If we haven't found either a target or a
++	* target-path property in a node that contains a
++	* __overlay__ subnode (we wouldn't be called
++	* otherwise), consider it a improperly written
++	* overlay
++	*/
++	if (ret < 0 && path_len =3D=3D -FDT_ERR_NOTFOUND)
++		ret =3D -FDT_ERR_BADOVERLAY;
++
++	/* return on error */
++	if (ret < 0)
++		return ret;
++
++	/* return pointer to path (if available) */
++	if (pathp)
++		*pathp =3D path ? path : NULL;
++
++	return ret;
++}
++
++/**
++ * overlay_phandle_add_offset - Increases a phandle by an offset
++ * @fdt: Base device tree blob
++ * @node: Device tree overlay blob
++ * @name: Name of the property to modify (phandle or linux,phandle)
++ * @delta: offset to apply
++ *
++ * overlay_phandle_add_offset() increments a node phandle by a given
++ * offset.
++ *
++ * returns:
++ *      0 on success.
++ *      Negative error code on error
++ */
++static int overlay_phandle_add_offset(void *fdt, int node,
++				      const char *name, uint32_t delta)
++{
++	const fdt32_t *val;
++	uint32_t adj_val;
++	int len;
++
++	val =3D fdt_getprop(fdt, node, name, &len);
++	if (!val)
++		return len;
++
++	if (len !=3D sizeof(*val))
++		return -FDT_ERR_BADPHANDLE;
++
++	adj_val =3D fdt32_to_cpu(*val);
++	if ((adj_val + delta) < adj_val)
++		return -FDT_ERR_NOPHANDLES;
++
++	adj_val +=3D delta;
++	if (adj_val =3D=3D (uint32_t)-1)
++		return -FDT_ERR_NOPHANDLES;
++
++	return fdt_setprop_inplace_u32(fdt, node, name, adj_val);
++}
++
++/**
++ * overlay_adjust_node_phandles - Offsets the phandles of a node
++ * @fdto: Device tree overlay blob
++ * @node: Offset of the node we want to adjust
++ * @delta: Offset to shift the phandles of
++ *
++ * overlay_adjust_node_phandles() adds a constant to all the phandles
++ * of a given node. This is mainly use as part of the overlay
++ * application process, when we want to update all the overlay
++ * phandles to not conflict with the overlays of the base device tree.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_adjust_node_phandles(void *fdto, int node,
++					uint32_t delta)
++{
++	int child;
++	int ret;
++
++	ret =3D overlay_phandle_add_offset(fdto, node, "phandle", delta);
++	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
++		return ret;
++
++	ret =3D overlay_phandle_add_offset(fdto, node, "linux,phandle", delta)=
;
++	if (ret && ret !=3D -FDT_ERR_NOTFOUND)
++		return ret;
++
++	fdt_for_each_subnode(child, fdto, node) {
++		ret =3D overlay_adjust_node_phandles(fdto, child, delta);
++		if (ret)
++			return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * overlay_adjust_local_phandles - Adjust the phandles of a whole overl=
ay
++ * @fdto: Device tree overlay blob
++ * @delta: Offset to shift the phandles of
++ *
++ * overlay_adjust_local_phandles() adds a constant to all the
++ * phandles of an overlay. This is mainly use as part of the overlay
++ * application process, when we want to update all the overlay
++ * phandles to not conflict with the overlays of the base device tree.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_adjust_local_phandles(void *fdto, uint32_t delta)
++{
++	/*
++	 * Start adjusting the phandles from the overlay root
++	 */
++	return overlay_adjust_node_phandles(fdto, 0, delta);
++}
++
++/**
++ * overlay_update_local_node_references - Adjust the overlay references
++ * @fdto: Device tree overlay blob
++ * @tree_node: Node offset of the node to operate on
++ * @fixup_node: Node offset of the matching local fixups node
++ * @delta: Offset to shift the phandles of
++ *
++ * overlay_update_local_nodes_references() update the phandles
++ * pointing to a node within the device tree overlay by adding a
++ * constant delta.
++ *
++ * This is mainly used as part of a device tree application process,
++ * where you want the device tree overlays phandles to not conflict
++ * with the ones from the base device tree before merging them.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_update_local_node_references(void *fdto,
++						int tree_node,
++						int fixup_node,
++						uint32_t delta)
++{
++	int fixup_prop;
++	int fixup_child;
++	int ret;
++
++	fdt_for_each_property_offset(fixup_prop, fdto, fixup_node) {
++		const fdt32_t *fixup_val;
++		const char *tree_val;
++		const char *name;
++		int fixup_len;
++		int tree_len;
++		int i;
++
++		fixup_val =3D fdt_getprop_by_offset(fdto, fixup_prop,
++						  &name, &fixup_len);
++		if (!fixup_val)
++			return fixup_len;
++
++		if (fixup_len % sizeof(uint32_t))
++			return -FDT_ERR_BADOVERLAY;
++		fixup_len /=3D sizeof(uint32_t);
++
++		tree_val =3D fdt_getprop(fdto, tree_node, name, &tree_len);
++		if (!tree_val) {
++			if (tree_len =3D=3D -FDT_ERR_NOTFOUND)
++				return -FDT_ERR_BADOVERLAY;
++
++			return tree_len;
++		}
++
++		for (i =3D 0; i < fixup_len; i++) {
++			fdt32_t adj_val;
++			uint32_t poffset;
++
++			poffset =3D fdt32_to_cpu(fixup_val[i]);
++
++			/*
++			 * phandles to fixup can be unaligned.
++			 *
++			 * Use a memcpy for the architectures that do
++			 * not support unaligned accesses.
++			 */
++			memcpy(&adj_val, tree_val + poffset, sizeof(adj_val));
++
++			adj_val =3D cpu_to_fdt32(fdt32_to_cpu(adj_val) + delta);
++
++			ret =3D fdt_setprop_inplace_namelen_partial(fdto,
++								  tree_node,
++								  name,
++								  strlen(name),
++								  poffset,
++								  &adj_val,
++								  sizeof(adj_val));
++			if (ret =3D=3D -FDT_ERR_NOSPACE)
++				return -FDT_ERR_BADOVERLAY;
++
++			if (ret)
++				return ret;
++		}
++	}
++
++	fdt_for_each_subnode(fixup_child, fdto, fixup_node) {
++		const char *fixup_child_name =3D fdt_get_name(fdto, fixup_child,
++							    NULL);
++		int tree_child;
++
++		tree_child =3D fdt_subnode_offset(fdto, tree_node,
++						fixup_child_name);
++		if (tree_child =3D=3D -FDT_ERR_NOTFOUND)
++			return -FDT_ERR_BADOVERLAY;
++		if (tree_child < 0)
++			return tree_child;
++
++		ret =3D overlay_update_local_node_references(fdto,
++							   tree_child,
++							   fixup_child,
++							   delta);
++		if (ret)
++			return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * overlay_update_local_references - Adjust the overlay references
++ * @fdto: Device tree overlay blob
++ * @delta: Offset to shift the phandles of
++ *
++ * overlay_update_local_references() update all the phandles pointing
++ * to a node within the device tree overlay by adding a constant
++ * delta to not conflict with the base overlay.
++ *
++ * This is mainly used as part of a device tree application process,
++ * where you want the device tree overlays phandles to not conflict
++ * with the ones from the base device tree before merging them.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_update_local_references(void *fdto, uint32_t delta)
++{
++	int fixups;
++
++	fixups =3D fdt_path_offset(fdto, "/__local_fixups__");
++	if (fixups < 0) {
++		/* There's no local phandles to adjust, bail out */
++		if (fixups =3D=3D -FDT_ERR_NOTFOUND)
++			return 0;
++
++		return fixups;
++	}
++
++	/*
++	 * Update our local references from the root of the tree
++	 */
++	return overlay_update_local_node_references(fdto, 0, fixups,
++						    delta);
++}
++
++/**
++ * overlay_fixup_one_phandle - Set an overlay phandle to the base one
++ * @fdt: Base Device Tree blob
++ * @fdto: Device tree overlay blob
++ * @symbols_off: Node offset of the symbols node in the base device tre=
e
++ * @path: Path to a node holding a phandle in the overlay
++ * @path_len: number of path characters to consider
++ * @name: Name of the property holding the phandle reference in the ove=
rlay
++ * @name_len: number of name characters to consider
++ * @poffset: Offset within the overlay property where the phandle is st=
ored
++ * @label: Label of the node referenced by the phandle
++ *
++ * overlay_fixup_one_phandle() resolves an overlay phandle pointing to
++ * a node in the base device tree.
++ *
++ * This is part of the device tree overlay application process, when
++ * you want all the phandles in the overlay to point to the actual
++ * base dt nodes.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_fixup_one_phandle(void *fdt, void *fdto,
++				     int symbols_off,
++				     const char *path, uint32_t path_len,
++				     const char *name, uint32_t name_len,
++				     int poffset, const char *label)
++{
++	const char *symbol_path;
++	uint32_t phandle;
++	fdt32_t phandle_prop;
++	int symbol_off, fixup_off;
++	int prop_len;
++
++	if (symbols_off < 0)
++		return symbols_off;
++
++	symbol_path =3D fdt_getprop(fdt, symbols_off, label,
++				  &prop_len);
++	if (!symbol_path)
++		return prop_len;
++
++	symbol_off =3D fdt_path_offset(fdt, symbol_path);
++	if (symbol_off < 0)
++		return symbol_off;
++
++	phandle =3D fdt_get_phandle(fdt, symbol_off);
++	if (!phandle)
++		return -FDT_ERR_NOTFOUND;
++
++	fixup_off =3D fdt_path_offset_namelen(fdto, path, path_len);
++	if (fixup_off =3D=3D -FDT_ERR_NOTFOUND)
++		return -FDT_ERR_BADOVERLAY;
++	if (fixup_off < 0)
++		return fixup_off;
++
++	phandle_prop =3D cpu_to_fdt32(phandle);
++	return fdt_setprop_inplace_namelen_partial(fdto, fixup_off,
++						   name, name_len, poffset,
++						   &phandle_prop,
++						   sizeof(phandle_prop));
++};
++
++/**
++ * overlay_fixup_phandle - Set an overlay phandle to the base one
++ * @fdt: Base Device Tree blob
++ * @fdto: Device tree overlay blob
++ * @symbols_off: Node offset of the symbols node in the base device tre=
e
++ * @property: Property offset in the overlay holding the list of fixups
++ *
++ * overlay_fixup_phandle() resolves all the overlay phandles pointed
++ * to in a __fixups__ property, and updates them to match the phandles
++ * in use in the base device tree.
++ *
++ * This is part of the device tree overlay application process, when
++ * you want all the phandles in the overlay to point to the actual
++ * base dt nodes.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_fixup_phandle(void *fdt, void *fdto, int symbols_off=
,
++				 int property)
++{
++	const char *value;
++	const char *label;
++	int len;
++
++	value =3D fdt_getprop_by_offset(fdto, property,
++				      &label, &len);
++	if (!value) {
++		if (len =3D=3D -FDT_ERR_NOTFOUND)
++			return -FDT_ERR_INTERNAL;
++
++		return len;
++	}
++
++	do {
++		const char *path, *name, *fixup_end;
++		const char *fixup_str =3D value;
++		uint32_t path_len, name_len;
++		uint32_t fixup_len;
++		char *sep, *endptr;
++		int poffset, ret;
++
++		fixup_end =3D memchr(value, '\0', len);
++		if (!fixup_end)
++			return -FDT_ERR_BADOVERLAY;
++		fixup_len =3D fixup_end - fixup_str;
++
++		len -=3D fixup_len + 1;
++		value +=3D fixup_len + 1;
++
++		path =3D fixup_str;
++		sep =3D memchr(fixup_str, ':', fixup_len);
++		if (!sep || *sep !=3D ':')
++			return -FDT_ERR_BADOVERLAY;
++
++		path_len =3D sep - path;
++		if (path_len =3D=3D (fixup_len - 1))
++			return -FDT_ERR_BADOVERLAY;
++
++		fixup_len -=3D path_len + 1;
++		name =3D sep + 1;
++		sep =3D memchr(name, ':', fixup_len);
++		if (!sep || *sep !=3D ':')
++			return -FDT_ERR_BADOVERLAY;
++
++		name_len =3D sep - name;
++		if (!name_len)
++			return -FDT_ERR_BADOVERLAY;
++
++		poffset =3D strtoul(sep + 1, &endptr, 10);
++		if ((*endptr !=3D '\0') || (endptr <=3D (sep + 1)))
++			return -FDT_ERR_BADOVERLAY;
++
++		ret =3D overlay_fixup_one_phandle(fdt, fdto, symbols_off,
++						path, path_len, name, name_len,
++						poffset, label);
++		if (ret)
++			return ret;
++	} while (len > 0);
++
++	return 0;
++}
++
++/**
++ * overlay_fixup_phandles - Resolve the overlay phandles to the base
++ *                          device tree
++ * @fdt: Base Device Tree blob
++ * @fdto: Device tree overlay blob
++ *
++ * overlay_fixup_phandles() resolves all the overlay phandles pointing
++ * to nodes in the base device tree.
++ *
++ * This is one of the steps of the device tree overlay application
++ * process, when you want all the phandles in the overlay to point to
++ * the actual base dt nodes.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_fixup_phandles(void *fdt, void *fdto)
++{
++	int fixups_off, symbols_off;
++	int property;
++
++	/* We can have overlays without any fixups */
++	fixups_off =3D fdt_path_offset(fdto, "/__fixups__");
++	if (fixups_off =3D=3D -FDT_ERR_NOTFOUND)
++		return 0; /* nothing to do */
++	if (fixups_off < 0)
++		return fixups_off;
++
++	/* And base DTs without symbols */
++	symbols_off =3D fdt_path_offset(fdt, "/__symbols__");
++	if ((symbols_off < 0 && (symbols_off !=3D -FDT_ERR_NOTFOUND)))
++		return symbols_off;
++
++	fdt_for_each_property_offset(property, fdto, fixups_off) {
++		int ret;
++
++		ret =3D overlay_fixup_phandle(fdt, fdto, symbols_off, property);
++		if (ret)
++			return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * overlay_apply_node - Merges a node into the base device tree
++ * @fdt: Base Device Tree blob
++ * @target: Node offset in the base device tree to apply the fragment t=
o
++ * @fdto: Device tree overlay blob
++ * @node: Node offset in the overlay holding the changes to merge
++ *
++ * overlay_apply_node() merges a node into a target base device tree
++ * node pointed.
++ *
++ * This is part of the final step in the device tree overlay
++ * application process, when all the phandles have been adjusted and
++ * resolved and you just have to merge overlay into the base device
++ * tree.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_apply_node(void *fdt, int target,
++			      void *fdto, int node)
++{
++	int property;
++	int subnode;
++
++	fdt_for_each_property_offset(property, fdto, node) {
++		const char *name;
++		const void *prop;
++		int prop_len;
++		int ret;
++
++		prop =3D fdt_getprop_by_offset(fdto, property, &name,
++					     &prop_len);
++		if (prop_len =3D=3D -FDT_ERR_NOTFOUND)
++			return -FDT_ERR_INTERNAL;
++		if (prop_len < 0)
++			return prop_len;
++
++		ret =3D fdt_setprop(fdt, target, name, prop, prop_len);
++		if (ret)
++			return ret;
++	}
++
++	fdt_for_each_subnode(subnode, fdto, node) {
++		const char *name =3D fdt_get_name(fdto, subnode, NULL);
++		int nnode;
++		int ret;
++
++		nnode =3D fdt_add_subnode(fdt, target, name);
++		if (nnode =3D=3D -FDT_ERR_EXISTS) {
++			nnode =3D fdt_subnode_offset(fdt, target, name);
++			if (nnode =3D=3D -FDT_ERR_NOTFOUND)
++				return -FDT_ERR_INTERNAL;
++		}
++
++		if (nnode < 0)
++			return nnode;
++
++		ret =3D overlay_apply_node(fdt, nnode, fdto, subnode);
++		if (ret)
++			return ret;
++	}
++
++	return 0;
++}
++
++/**
++ * overlay_merge - Merge an overlay into its base device tree
++ * @fdt: Base Device Tree blob
++ * @fdto: Device tree overlay blob
++ *
++ * overlay_merge() merges an overlay into its base device tree.
++ *
++ * This is the next to last step in the device tree overlay application
++ * process, when all the phandles have been adjusted and resolved and
++ * you just have to merge overlay into the base device tree.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_merge(void *fdt, void *fdto)
++{
++	int fragment;
++
++	fdt_for_each_subnode(fragment, fdto, 0) {
++		int overlay;
++		int target;
++		int ret;
++
++		/*
++		 * Each fragments will have an __overlay__ node. If
++		 * they don't, it's not supposed to be merged
++		 */
++		overlay =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
++		if (overlay =3D=3D -FDT_ERR_NOTFOUND)
++			continue;
++
++		if (overlay < 0)
++			return overlay;
++
++		target =3D overlay_get_target(fdt, fdto, fragment, NULL);
++		if (target < 0)
++			return target;
++
++		ret =3D overlay_apply_node(fdt, target, fdto, overlay);
++		if (ret)
++			return ret;
++	}
++
++	return 0;
++}
++
++static int get_path_len(const void *fdt, int nodeoffset)
++{
++	int len =3D 0, namelen;
++	const char *name;
++
++	FDT_RO_PROBE(fdt);
++
++	for (;;) {
++		name =3D fdt_get_name(fdt, nodeoffset, &namelen);
++		if (!name)
++			return namelen;
++
++		/* root? we're done */
++		if (namelen =3D=3D 0)
++			break;
++
++		nodeoffset =3D fdt_parent_offset(fdt, nodeoffset);
++		if (nodeoffset < 0)
++			return nodeoffset;
++		len +=3D namelen + 1;
++	}
++
++	/* in case of root pretend it's "/" */
++	if (len =3D=3D 0)
++		len++;
++	return len;
++}
++
++/**
++ * overlay_symbol_update - Update the symbols of base tree after a merg=
e
++ * @fdt: Base Device Tree blob
++ * @fdto: Device tree overlay blob
++ *
++ * overlay_symbol_update() updates the symbols of the base tree with th=
e
++ * symbols of the applied overlay
++ *
++ * This is the last step in the device tree overlay application
++ * process, allowing the reference of overlay symbols by subsequent
++ * overlay operations.
++ *
++ * returns:
++ *      0 on success
++ *      Negative error code on failure
++ */
++static int overlay_symbol_update(void *fdt, void *fdto)
++{
++	int root_sym, ov_sym, prop, path_len, fragment, target;
++	int len, frag_name_len, ret, rel_path_len;
++	const char *s, *e;
++	const char *path;
++	const char *name;
++	const char *frag_name;
++	const char *rel_path;
++	const char *target_path;
++	char *buf;
++	void *p;
++
++	ov_sym =3D fdt_subnode_offset(fdto, 0, "__symbols__");
++
++	/* if no overlay symbols exist no problem */
++	if (ov_sym < 0)
++		return 0;
++
++	root_sym =3D fdt_subnode_offset(fdt, 0, "__symbols__");
++
++	/* it no root symbols exist we should create them */
++	if (root_sym =3D=3D -FDT_ERR_NOTFOUND)
++		root_sym =3D fdt_add_subnode(fdt, 0, "__symbols__");
++
++	/* any error is fatal now */
++	if (root_sym < 0)
++		return root_sym;
++
++	/* iterate over each overlay symbol */
++	fdt_for_each_property_offset(prop, fdto, ov_sym) {
++		path =3D fdt_getprop_by_offset(fdto, prop, &name, &path_len);
++		if (!path)
++			return path_len;
++
++		/* verify it's a string property (terminated by a single \0) */
++		if (path_len < 1 || memchr(path, '\0', path_len) !=3D &path[path_len =
- 1])
++			return -FDT_ERR_BADVALUE;
++
++		/* keep end marker to avoid strlen() */
++		e =3D path + path_len;
++
++		if (*path !=3D '/')
++			return -FDT_ERR_BADVALUE;
++
++		/* get fragment name first */
++		s =3D strchr(path + 1, '/');
++		if (!s) {
++			/* Symbol refers to something that won't end
++			 * up in the target tree */
++			continue;
++		}
++
++		frag_name =3D path + 1;
++		frag_name_len =3D s - path - 1;
++
++		/* verify format; safe since "s" lies in \0 terminated prop */
++		len =3D sizeof("/__overlay__/") - 1;
++		if ((e - s) > len && (memcmp(s, "/__overlay__/", len) =3D=3D 0)) {
++			/* /<fragment-name>/__overlay__/<relative-subnode-path> */
++			rel_path =3D s + len;
++			rel_path_len =3D e - rel_path - 1;
++		} else if ((e - s) =3D=3D len
++			   && (memcmp(s, "/__overlay__", len - 1) =3D=3D 0)) {
++			/* /<fragment-name>/__overlay__ */
++			rel_path =3D "";
++			rel_path_len =3D 0;
++		} else {
++			/* Symbol refers to something that won't end
++			 * up in the target tree */
++			continue;
++		}
++
++		/* find the fragment index in which the symbol lies */
++		ret =3D fdt_subnode_offset_namelen(fdto, 0, frag_name,
++					       frag_name_len);
++		/* not found? */
++		if (ret < 0)
++			return -FDT_ERR_BADOVERLAY;
++		fragment =3D ret;
++
++		/* an __overlay__ subnode must exist */
++		ret =3D fdt_subnode_offset(fdto, fragment, "__overlay__");
++		if (ret < 0)
++			return -FDT_ERR_BADOVERLAY;
++
++		/* get the target of the fragment */
++		ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
++		if (ret < 0)
++			return ret;
++		target =3D ret;
++
++		/* if we have a target path use */
++		if (!target_path) {
++			ret =3D get_path_len(fdt, target);
++			if (ret < 0)
++				return ret;
++			len =3D ret;
++		} else {
++			len =3D strlen(target_path);
++		}
++
++		ret =3D fdt_setprop_placeholder(fdt, root_sym, name,
++				len + (len > 1) + rel_path_len + 1, &p);
++		if (ret < 0)
++			return ret;
++
++		if (!target_path) {
++			/* again in case setprop_placeholder changed it */
++			ret =3D overlay_get_target(fdt, fdto, fragment, &target_path);
++			if (ret < 0)
++				return ret;
++			target =3D ret;
++		}
++
++		buf =3D p;
++		if (len > 1) { /* target is not root */
++			if (!target_path) {
++				ret =3D fdt_get_path(fdt, target, buf, len + 1);
++				if (ret < 0)
++					return ret;
++			} else
++				memcpy(buf, target_path, len + 1);
++
++		} else
++			len--;
++
++		buf[len] =3D '/';
++		memcpy(buf + len + 1, rel_path, rel_path_len);
++		buf[len + 1 + rel_path_len] =3D '\0';
++	}
++
++	return 0;
++}
++
++int fdt_overlay_apply(void *fdt, void *fdto)
++{
++	uint32_t delta;
++	int ret;
++
++	FDT_RO_PROBE(fdt);
++	FDT_RO_PROBE(fdto);
++
++	ret =3D fdt_find_max_phandle(fdt, &delta);
++	if (ret)
++		goto err;
++
++	ret =3D overlay_adjust_local_phandles(fdto, delta);
++	if (ret)
++		goto err;
++
++	ret =3D overlay_update_local_references(fdto, delta);
++	if (ret)
++		goto err;
++
++	ret =3D overlay_fixup_phandles(fdt, fdto);
++	if (ret)
++		goto err;
++
++	ret =3D overlay_merge(fdt, fdto);
++	if (ret)
++		goto err;
++
++	ret =3D overlay_symbol_update(fdt, fdto);
++	if (ret)
++		goto err;
++
++	/*
++	 * The overlay has been damaged, erase its magic.
++	 */
++	fdt_set_magic(fdto, ~0);
++
++	return 0;
++
++err:
++	/*
++	 * The overlay might have been damaged, erase its magic.
++	 */
++	fdt_set_magic(fdto, ~0);
++
++	/*
++	 * The base device tree might have been damaged, erase its
++	 * magic.
++	 */
++	fdt_set_magic(fdt, ~0);
++
++	return ret;
++}
+diff --git a/common/libfdt/fdt_ro.c b/common/libfdt/fdt_ro.c
+new file mode 100644
+index 0000000..17584da
+--- /dev/null
++++ b/common/libfdt/fdt_ro.c
+@@ -0,0 +1,859 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++static int fdt_nodename_eq_(const void *fdt, int offset,
++			    const char *s, int len)
++{
++	int olen;
++	const char *p =3D fdt_get_name(fdt, offset, &olen);
++
++	if (!p || olen < len)
++		/* short match */
++		return 0;
++
++	if (memcmp(p, s, len) !=3D 0)
++		return 0;
++
++	if (p[len] =3D=3D '\0')
++		return 1;
++	else if (!memchr(s, '@', len) && (p[len] =3D=3D '@'))
++		return 1;
++	else
++		return 0;
++}
++
++const char *fdt_get_string(const void *fdt, int stroffset, int *lenp)
++{
++	int32_t totalsize;
++	uint32_t absoffset;
++	size_t len;
++	int err;
++	const char *s, *n;
++
++	if (can_assume(VALID_INPUT)) {
++		s =3D (const char *)fdt + fdt_off_dt_strings(fdt) + stroffset;
++
++		if (lenp)
++			*lenp =3D strlen(s);
++		return s;
++	}
++	totalsize =3D fdt_ro_probe_(fdt);
++	err =3D totalsize;
++	if (totalsize < 0)
++		goto fail;
++
++	err =3D -FDT_ERR_BADOFFSET;
++	absoffset =3D stroffset + fdt_off_dt_strings(fdt);
++	if (absoffset >=3D (unsigned)totalsize)
++		goto fail;
++	len =3D totalsize - absoffset;
++
++	if (fdt_magic(fdt) =3D=3D FDT_MAGIC) {
++		if (stroffset < 0)
++			goto fail;
++		if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
++			if ((unsigned)stroffset >=3D fdt_size_dt_strings(fdt))
++				goto fail;
++			if ((fdt_size_dt_strings(fdt) - stroffset) < len)
++				len =3D fdt_size_dt_strings(fdt) - stroffset;
++		}
++	} else if (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) {
++		unsigned int sw_stroffset =3D -stroffset;
++
++		if ((stroffset >=3D 0) ||
++		    (sw_stroffset > fdt_size_dt_strings(fdt)))
++			goto fail;
++		if (sw_stroffset < len)
++			len =3D sw_stroffset;
++	} else {
++		err =3D -FDT_ERR_INTERNAL;
++		goto fail;
++	}
++
++	s =3D (const char *)fdt + absoffset;
++	n =3D memchr(s, '\0', len);
++	if (!n) {
++		/* missing terminating NULL */
++		err =3D -FDT_ERR_TRUNCATED;
++		goto fail;
++	}
++
++	if (lenp)
++		*lenp =3D n - s;
++	return s;
++
++fail:
++	if (lenp)
++		*lenp =3D err;
++	return NULL;
++}
++
++const char *fdt_string(const void *fdt, int stroffset)
++{
++	return fdt_get_string(fdt, stroffset, NULL);
++}
++
++static int fdt_string_eq_(const void *fdt, int stroffset,
++			  const char *s, int len)
++{
++	int slen;
++	const char *p =3D fdt_get_string(fdt, stroffset, &slen);
++
++	return p && (slen =3D=3D len) && (memcmp(p, s, len) =3D=3D 0);
++}
++
++int fdt_find_max_phandle(const void *fdt, uint32_t *phandle)
++{
++	uint32_t max =3D 0;
++	int offset =3D -1;
++
++	while (true) {
++		uint32_t value;
++
++		offset =3D fdt_next_node(fdt, offset, NULL);
++		if (offset < 0) {
++			if (offset =3D=3D -FDT_ERR_NOTFOUND)
++				break;
++
++			return offset;
++		}
++
++		value =3D fdt_get_phandle(fdt, offset);
++
++		if (value > max)
++			max =3D value;
++	}
++
++	if (phandle)
++		*phandle =3D max;
++
++	return 0;
++}
++
++int fdt_generate_phandle(const void *fdt, uint32_t *phandle)
++{
++	uint32_t max;
++	int err;
++
++	err =3D fdt_find_max_phandle(fdt, &max);
++	if (err < 0)
++		return err;
++
++	if (max =3D=3D FDT_MAX_PHANDLE)
++		return -FDT_ERR_NOPHANDLES;
++
++	if (phandle)
++		*phandle =3D max + 1;
++
++	return 0;
++}
++
++static const struct fdt_reserve_entry *fdt_mem_rsv(const void *fdt, int=
 n)
++{
++	unsigned int offset =3D n * sizeof(struct fdt_reserve_entry);
++	unsigned int absoffset =3D fdt_off_mem_rsvmap(fdt) + offset;
++
++	if (!can_assume(VALID_INPUT)) {
++		if (absoffset < fdt_off_mem_rsvmap(fdt))
++			return NULL;
++		if (absoffset > fdt_totalsize(fdt) -
++		    sizeof(struct fdt_reserve_entry))
++			return NULL;
++	}
++	return fdt_mem_rsv_(fdt, n);
++}
++
++int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t=
 *size)
++{
++	const struct fdt_reserve_entry *re;
++
++	FDT_RO_PROBE(fdt);
++	re =3D fdt_mem_rsv(fdt, n);
++	if (!can_assume(VALID_INPUT) && !re)
++		return -FDT_ERR_BADOFFSET;
++
++	*address =3D fdt64_ld_(&re->address);
++	*size =3D fdt64_ld_(&re->size);
++	return 0;
++}
++
++int fdt_num_mem_rsv(const void *fdt)
++{
++	int i;
++	const struct fdt_reserve_entry *re;
++
++	for (i =3D 0; (re =3D fdt_mem_rsv(fdt, i)) !=3D NULL; i++) {
++		if (fdt64_ld_(&re->size) =3D=3D 0)
++			return i;
++	}
++	return -FDT_ERR_TRUNCATED;
++}
++
++static int nextprop_(const void *fdt, int offset)
++{
++	uint32_t tag;
++	int nextoffset;
++
++	do {
++		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
++
++		switch (tag) {
++		case FDT_END:
++			if (nextoffset >=3D 0)
++				return -FDT_ERR_BADSTRUCTURE;
++			else
++				return nextoffset;
++
++		case FDT_PROP:
++			return offset;
++		}
++		offset =3D nextoffset;
++	} while (tag =3D=3D FDT_NOP);
++
++	return -FDT_ERR_NOTFOUND;
++}
++
++int fdt_subnode_offset_namelen(const void *fdt, int offset,
++			       const char *name, int namelen)
++{
++	int depth;
++
++	FDT_RO_PROBE(fdt);
++
++	for (depth =3D 0;
++	     (offset >=3D 0) && (depth >=3D 0);
++	     offset =3D fdt_next_node(fdt, offset, &depth))
++		if ((depth =3D=3D 1)
++		    && fdt_nodename_eq_(fdt, offset, name, namelen))
++			return offset;
++
++	if (depth < 0)
++		return -FDT_ERR_NOTFOUND;
++	return offset; /* error */
++}
++
++int fdt_subnode_offset(const void *fdt, int parentoffset,
++		       const char *name)
++{
++	return fdt_subnode_offset_namelen(fdt, parentoffset, name, strlen(name=
));
++}
++
++int fdt_path_offset_namelen(const void *fdt, const char *path, int name=
len)
++{
++	const char *end =3D path + namelen;
++	const char *p =3D path;
++	int offset =3D 0;
++
++	FDT_RO_PROBE(fdt);
++
++	/* see if we have an alias */
++	if (*path !=3D '/') {
++		const char *q =3D memchr(path, '/', end - p);
++
++		if (!q)
++			q =3D end;
++
++		p =3D fdt_get_alias_namelen(fdt, p, q - p);
++		if (!p)
++			return -FDT_ERR_BADPATH;
++		offset =3D fdt_path_offset(fdt, p);
++
++		p =3D q;
++	}
++
++	while (p < end) {
++		const char *q;
++
++		while (*p =3D=3D '/') {
++			p++;
++			if (p =3D=3D end)
++				return offset;
++		}
++		q =3D memchr(p, '/', end - p);
++		if (! q)
++			q =3D end;
++
++		offset =3D fdt_subnode_offset_namelen(fdt, offset, p, q-p);
++		if (offset < 0)
++			return offset;
++
++		p =3D q;
++	}
++
++	return offset;
++}
++
++int fdt_path_offset(const void *fdt, const char *path)
++{
++	return fdt_path_offset_namelen(fdt, path, strlen(path));
++}
++
++const char *fdt_get_name(const void *fdt, int nodeoffset, int *len)
++{
++	const struct fdt_node_header *nh =3D fdt_offset_ptr_(fdt, nodeoffset);
++	const char *nameptr;
++	int err;
++
++	if (((err =3D fdt_ro_probe_(fdt)) < 0)
++	    || ((err =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0))
++			goto fail;
++
++	nameptr =3D nh->name;
++
++	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
++		/*
++		 * For old FDT versions, match the naming conventions of V16:
++		 * give only the leaf name (after all /). The actual tree
++		 * contents are loosely checked.
++		 */
++		const char *leaf;
++		leaf =3D strrchr(nameptr, '/');
++		if (leaf =3D=3D NULL) {
++			err =3D -FDT_ERR_BADSTRUCTURE;
++			goto fail;
++		}
++		nameptr =3D leaf+1;
++	}
++
++	if (len)
++		*len =3D strlen(nameptr);
++
++	return nameptr;
++
++ fail:
++	if (len)
++		*len =3D err;
++	return NULL;
++}
++
++int fdt_first_property_offset(const void *fdt, int nodeoffset)
++{
++	int offset;
++
++	if ((offset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
++		return offset;
++
++	return nextprop_(fdt, offset);
++}
++
++int fdt_next_property_offset(const void *fdt, int offset)
++{
++	if ((offset =3D fdt_check_prop_offset_(fdt, offset)) < 0)
++		return offset;
++
++	return nextprop_(fdt, offset);
++}
++
++static const struct fdt_property *fdt_get_property_by_offset_(const voi=
d *fdt,
++						              int offset,
++						              int *lenp)
++{
++	int err;
++	const struct fdt_property *prop;
++
++	if (!can_assume(VALID_INPUT) &&
++	    (err =3D fdt_check_prop_offset_(fdt, offset)) < 0) {
++		if (lenp)
++			*lenp =3D err;
++		return NULL;
++	}
++
++	prop =3D fdt_offset_ptr_(fdt, offset);
++
++	if (lenp)
++		*lenp =3D fdt32_ld_(&prop->len);
++
++	return prop;
++}
++
++const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
++						      int offset,
++						      int *lenp)
++{
++	/* Prior to version 16, properties may need realignment
++	 * and this API does not work. fdt_getprop_*() will, however. */
++
++	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
++		if (lenp)
++			*lenp =3D -FDT_ERR_BADVERSION;
++		return NULL;
++	}
++
++	return fdt_get_property_by_offset_(fdt, offset, lenp);
++}
++
++static const struct fdt_property *fdt_get_property_namelen_(const void =
*fdt,
++						            int offset,
++						            const char *name,
++						            int namelen,
++							    int *lenp,
++							    int *poffset)
++{
++	for (offset =3D fdt_first_property_offset(fdt, offset);
++	     (offset >=3D 0);
++	     (offset =3D fdt_next_property_offset(fdt, offset))) {
++		const struct fdt_property *prop;
++
++		prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
++		if (!can_assume(LIBFDT_FLAWLESS) && !prop) {
++			offset =3D -FDT_ERR_INTERNAL;
++			break;
++		}
++		if (fdt_string_eq_(fdt, fdt32_ld_(&prop->nameoff),
++				   name, namelen)) {
++			if (poffset)
++				*poffset =3D offset;
++			return prop;
++		}
++	}
++
++	if (lenp)
++		*lenp =3D offset;
++	return NULL;
++}
++
++
++const struct fdt_property *fdt_get_property_namelen(const void *fdt,
++						    int offset,
++						    const char *name,
++						    int namelen, int *lenp)
++{
++	/* Prior to version 16, properties may need realignment
++	 * and this API does not work. fdt_getprop_*() will, however. */
++	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10) {
++		if (lenp)
++			*lenp =3D -FDT_ERR_BADVERSION;
++		return NULL;
++	}
++
++	return fdt_get_property_namelen_(fdt, offset, name, namelen, lenp,
++					 NULL);
++}
++
++
++const struct fdt_property *fdt_get_property(const void *fdt,
++					    int nodeoffset,
++					    const char *name, int *lenp)
++{
++	return fdt_get_property_namelen(fdt, nodeoffset, name,
++					strlen(name), lenp);
++}
++
++const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
++				const char *name, int namelen, int *lenp)
++{
++	int poffset;
++	const struct fdt_property *prop;
++
++	prop =3D fdt_get_property_namelen_(fdt, nodeoffset, name, namelen, len=
p,
++					 &poffset);
++	if (!prop)
++		return NULL;
++
++	/* Handle realignment */
++	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
++	    (poffset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >=3D 8)
++		return prop->data + 4;
++	return prop->data;
++}
++
++const void *fdt_getprop_by_offset(const void *fdt, int offset,
++				  const char **namep, int *lenp)
++{
++	const struct fdt_property *prop;
++
++	prop =3D fdt_get_property_by_offset_(fdt, offset, lenp);
++	if (!prop)
++		return NULL;
++	if (namep) {
++		const char *name;
++		int namelen;
++
++		if (!can_assume(VALID_INPUT)) {
++			name =3D fdt_get_string(fdt, fdt32_ld_(&prop->nameoff),
++					      &namelen);
++			if (!name) {
++				if (lenp)
++					*lenp =3D namelen;
++				return NULL;
++			}
++			*namep =3D name;
++		} else {
++			*namep =3D fdt_string(fdt, fdt32_ld_(&prop->nameoff));
++		}
++	}
++
++	/* Handle realignment */
++	if (!can_assume(LATEST) && fdt_version(fdt) < 0x10 &&
++	    (offset + sizeof(*prop)) % 8 && fdt32_ld_(&prop->len) >=3D 8)
++		return prop->data + 4;
++	return prop->data;
++}
++
++const void *fdt_getprop(const void *fdt, int nodeoffset,
++			const char *name, int *lenp)
++{
++	return fdt_getprop_namelen(fdt, nodeoffset, name, strlen(name), lenp);
++}
++
++uint32_t fdt_get_phandle(const void *fdt, int nodeoffset)
++{
++	const fdt32_t *php;
++	int len;
++
++	/* FIXME: This is a bit sub-optimal, since we potentially scan
++	 * over all the properties twice. */
++	php =3D fdt_getprop(fdt, nodeoffset, "phandle", &len);
++	if (!php || (len !=3D sizeof(*php))) {
++		php =3D fdt_getprop(fdt, nodeoffset, "linux,phandle", &len);
++		if (!php || (len !=3D sizeof(*php)))
++			return 0;
++	}
++
++	return fdt32_ld_(php);
++}
++
++const char *fdt_get_alias_namelen(const void *fdt,
++				  const char *name, int namelen)
++{
++	int aliasoffset;
++
++	aliasoffset =3D fdt_path_offset(fdt, "/aliases");
++	if (aliasoffset < 0)
++		return NULL;
++
++	return fdt_getprop_namelen(fdt, aliasoffset, name, namelen, NULL);
++}
++
++const char *fdt_get_alias(const void *fdt, const char *name)
++{
++	return fdt_get_alias_namelen(fdt, name, strlen(name));
++}
++
++int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen=
)
++{
++	int pdepth =3D 0, p =3D 0;
++	int offset, depth, namelen;
++	const char *name;
++
++	FDT_RO_PROBE(fdt);
++
++	if (buflen < 2)
++		return -FDT_ERR_NOSPACE;
++
++	for (offset =3D 0, depth =3D 0;
++	     (offset >=3D 0) && (offset <=3D nodeoffset);
++	     offset =3D fdt_next_node(fdt, offset, &depth)) {
++		while (pdepth > depth) {
++			do {
++				p--;
++			} while (buf[p-1] !=3D '/');
++			pdepth--;
++		}
++
++		if (pdepth >=3D depth) {
++			name =3D fdt_get_name(fdt, offset, &namelen);
++			if (!name)
++				return namelen;
++			if ((p + namelen + 1) <=3D buflen) {
++				memcpy(buf + p, name, namelen);
++				p +=3D namelen;
++				buf[p++] =3D '/';
++				pdepth++;
++			}
++		}
++
++		if (offset =3D=3D nodeoffset) {
++			if (pdepth < (depth + 1))
++				return -FDT_ERR_NOSPACE;
++
++			if (p > 1) /* special case so that root path is "/", not "" */
++				p--;
++			buf[p] =3D '\0';
++			return 0;
++		}
++	}
++
++	if ((offset =3D=3D -FDT_ERR_NOTFOUND) || (offset >=3D 0))
++		return -FDT_ERR_BADOFFSET;
++	else if (offset =3D=3D -FDT_ERR_BADOFFSET)
++		return -FDT_ERR_BADSTRUCTURE;
++
++	return offset; /* error from fdt_next_node() */
++}
++
++int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
++				 int supernodedepth, int *nodedepth)
++{
++	int offset, depth;
++	int supernodeoffset =3D -FDT_ERR_INTERNAL;
++
++	FDT_RO_PROBE(fdt);
++
++	if (supernodedepth < 0)
++		return -FDT_ERR_NOTFOUND;
++
++	for (offset =3D 0, depth =3D 0;
++	     (offset >=3D 0) && (offset <=3D nodeoffset);
++	     offset =3D fdt_next_node(fdt, offset, &depth)) {
++		if (depth =3D=3D supernodedepth)
++			supernodeoffset =3D offset;
++
++		if (offset =3D=3D nodeoffset) {
++			if (nodedepth)
++				*nodedepth =3D depth;
++
++			if (supernodedepth > depth)
++				return -FDT_ERR_NOTFOUND;
++			else
++				return supernodeoffset;
++		}
++	}
++
++	if (!can_assume(VALID_INPUT)) {
++		if ((offset =3D=3D -FDT_ERR_NOTFOUND) || (offset >=3D 0))
++			return -FDT_ERR_BADOFFSET;
++		else if (offset =3D=3D -FDT_ERR_BADOFFSET)
++			return -FDT_ERR_BADSTRUCTURE;
++	}
++
++	return offset; /* error from fdt_next_node() */
++}
++
++int fdt_node_depth(const void *fdt, int nodeoffset)
++{
++	int nodedepth;
++	int err;
++
++	err =3D fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, &nodedepth);
++	if (err)
++		return (can_assume(LIBFDT_FLAWLESS) || err < 0) ? err :
++			-FDT_ERR_INTERNAL;
++	return nodedepth;
++}
++
++int fdt_parent_offset(const void *fdt, int nodeoffset)
++{
++	int nodedepth =3D fdt_node_depth(fdt, nodeoffset);
++
++	if (nodedepth < 0)
++		return nodedepth;
++	return fdt_supernode_atdepth_offset(fdt, nodeoffset,
++					    nodedepth - 1, NULL);
++}
++
++int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
++				  const char *propname,
++				  const void *propval, int proplen)
++{
++	int offset;
++	const void *val;
++	int len;
++
++	FDT_RO_PROBE(fdt);
++
++	/* FIXME: The algorithm here is pretty horrible: we scan each
++	 * property of a node in fdt_getprop(), then if that didn't
++	 * find what we want, we scan over them again making our way
++	 * to the next node.  Still it's the easiest to implement
++	 * approach; performance can come later. */
++	for (offset =3D fdt_next_node(fdt, startoffset, NULL);
++	     offset >=3D 0;
++	     offset =3D fdt_next_node(fdt, offset, NULL)) {
++		val =3D fdt_getprop(fdt, offset, propname, &len);
++		if (val && (len =3D=3D proplen)
++		    && (memcmp(val, propval, len) =3D=3D 0))
++			return offset;
++	}
++
++	return offset; /* error from fdt_next_node() */
++}
++
++int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle)
++{
++	int offset;
++
++	if ((phandle =3D=3D 0) || (phandle =3D=3D ~0U))
++		return -FDT_ERR_BADPHANDLE;
++
++	FDT_RO_PROBE(fdt);
++
++	/* FIXME: The algorithm here is pretty horrible: we
++	 * potentially scan each property of a node in
++	 * fdt_get_phandle(), then if that didn't find what
++	 * we want, we scan over them again making our way to the next
++	 * node.  Still it's the easiest to implement approach;
++	 * performance can come later. */
++	for (offset =3D fdt_next_node(fdt, -1, NULL);
++	     offset >=3D 0;
++	     offset =3D fdt_next_node(fdt, offset, NULL)) {
++		if (fdt_get_phandle(fdt, offset) =3D=3D phandle)
++			return offset;
++	}
++
++	return offset; /* error from fdt_next_node() */
++}
++
++int fdt_stringlist_contains(const char *strlist, int listlen, const cha=
r *str)
++{
++	int len =3D strlen(str);
++	const char *p;
++
++	while (listlen >=3D len) {
++		if (memcmp(str, strlist, len+1) =3D=3D 0)
++			return 1;
++		p =3D memchr(strlist, '\0', listlen);
++		if (!p)
++			return 0; /* malformed strlist.. */
++		listlen -=3D (p-strlist) + 1;
++		strlist =3D p + 1;
++	}
++	return 0;
++}
++
++int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *p=
roperty)
++{
++	const char *list, *end;
++	int length, count =3D 0;
++
++	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
++	if (!list)
++		return length;
++
++	end =3D list + length;
++
++	while (list < end) {
++		length =3D strnlen(list, end - list) + 1;
++
++		/* Abort if the last string isn't properly NUL-terminated. */
++		if (list + length > end)
++			return -FDT_ERR_BADVALUE;
++
++		list +=3D length;
++		count++;
++	}
++
++	return count;
++}
++
++int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *=
property,
++			  const char *string)
++{
++	int length, len, idx =3D 0;
++	const char *list, *end;
++
++	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
++	if (!list)
++		return length;
++
++	len =3D strlen(string) + 1;
++	end =3D list + length;
++
++	while (list < end) {
++		length =3D strnlen(list, end - list) + 1;
++
++		/* Abort if the last string isn't properly NUL-terminated. */
++		if (list + length > end)
++			return -FDT_ERR_BADVALUE;
++
++		if (length =3D=3D len && memcmp(list, string, length) =3D=3D 0)
++			return idx;
++
++		list +=3D length;
++		idx++;
++	}
++
++	return -FDT_ERR_NOTFOUND;
++}
++
++const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
++			       const char *property, int idx,
++			       int *lenp)
++{
++	const char *list, *end;
++	int length;
++
++	list =3D fdt_getprop(fdt, nodeoffset, property, &length);
++	if (!list) {
++		if (lenp)
++			*lenp =3D length;
++
++		return NULL;
++	}
++
++	end =3D list + length;
++
++	while (list < end) {
++		length =3D strnlen(list, end - list) + 1;
++
++		/* Abort if the last string isn't properly NUL-terminated. */
++		if (list + length > end) {
++			if (lenp)
++				*lenp =3D -FDT_ERR_BADVALUE;
++
++			return NULL;
++		}
++
++		if (idx =3D=3D 0) {
++			if (lenp)
++				*lenp =3D length - 1;
++
++			return list;
++		}
++
++		list +=3D length;
++		idx--;
++	}
++
++	if (lenp)
++		*lenp =3D -FDT_ERR_NOTFOUND;
++
++	return NULL;
++}
++
++int fdt_node_check_compatible(const void *fdt, int nodeoffset,
++			      const char *compatible)
++{
++	const void *prop;
++	int len;
++
++	prop =3D fdt_getprop(fdt, nodeoffset, "compatible", &len);
++	if (!prop)
++		return len;
++
++	return !fdt_stringlist_contains(prop, len, compatible);
++}
++
++int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
++				  const char *compatible)
++{
++	int offset, err;
++
++	FDT_RO_PROBE(fdt);
++
++	/* FIXME: The algorithm here is pretty horrible: we scan each
++	 * property of a node in fdt_node_check_compatible(), then if
++	 * that didn't find what we want, we scan over them again
++	 * making our way to the next node.  Still it's the easiest to
++	 * implement approach; performance can come later. */
++	for (offset =3D fdt_next_node(fdt, startoffset, NULL);
++	     offset >=3D 0;
++	     offset =3D fdt_next_node(fdt, offset, NULL)) {
++		err =3D fdt_node_check_compatible(fdt, offset, compatible);
++		if ((err < 0) && (err !=3D -FDT_ERR_NOTFOUND))
++			return err;
++		else if (err =3D=3D 0)
++			return offset;
++	}
++
++	return offset; /* error from fdt_next_node() */
++}
+diff --git a/common/libfdt/fdt_rw.c b/common/libfdt/fdt_rw.c
+new file mode 100644
+index 0000000..3621d36
+--- /dev/null
++++ b/common/libfdt/fdt_rw.c
+@@ -0,0 +1,500 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++static int fdt_blocks_misordered_(const void *fdt,
++				  int mem_rsv_size, int struct_size)
++{
++	return (fdt_off_mem_rsvmap(fdt) < FDT_ALIGN(sizeof(struct fdt_header),=
 8))
++		|| (fdt_off_dt_struct(fdt) <
++		    (fdt_off_mem_rsvmap(fdt) + mem_rsv_size))
++		|| (fdt_off_dt_strings(fdt) <
++		    (fdt_off_dt_struct(fdt) + struct_size))
++		|| (fdt_totalsize(fdt) <
++		    (fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt)));
++}
++
++static int fdt_rw_probe_(void *fdt)
++{
++	if (can_assume(VALID_DTB))
++		return 0;
++	FDT_RO_PROBE(fdt);
++
++	if (!can_assume(LATEST) && fdt_version(fdt) < 17)
++		return -FDT_ERR_BADVERSION;
++	if (fdt_blocks_misordered_(fdt, sizeof(struct fdt_reserve_entry),
++				   fdt_size_dt_struct(fdt)))
++		return -FDT_ERR_BADLAYOUT;
++	if (!can_assume(LATEST) && fdt_version(fdt) > 17)
++		fdt_set_version(fdt, 17);
++
++	return 0;
++}
++
++#define FDT_RW_PROBE(fdt) \
++	{ \
++		int err_; \
++		if ((err_ =3D fdt_rw_probe_(fdt)) !=3D 0) \
++			return err_; \
++	}
++
++static inline unsigned int fdt_data_size_(void *fdt)
++{
++	return fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
++}
++
++static int fdt_splice_(void *fdt, void *splicepoint, int oldlen, int ne=
wlen)
++{
++	char *p =3D splicepoint;
++	unsigned int dsize =3D fdt_data_size_(fdt);
++	size_t soff =3D p - (char *)fdt;
++
++	if ((oldlen < 0) || (soff + oldlen < soff) || (soff + oldlen > dsize))
++		return -FDT_ERR_BADOFFSET;
++	if ((p < (char *)fdt) || (dsize + newlen < (unsigned)oldlen))
++		return -FDT_ERR_BADOFFSET;
++	if (dsize - oldlen + newlen > fdt_totalsize(fdt))
++		return -FDT_ERR_NOSPACE;
++	memmove(p + newlen, p + oldlen, ((char *)fdt + dsize) - (p + oldlen));
++	return 0;
++}
++
++static int fdt_splice_mem_rsv_(void *fdt, struct fdt_reserve_entry *p,
++			       int oldn, int newn)
++{
++	int delta =3D (newn - oldn) * sizeof(*p);
++	int err;
++	err =3D fdt_splice_(fdt, p, oldn * sizeof(*p), newn * sizeof(*p));
++	if (err)
++		return err;
++	fdt_set_off_dt_struct(fdt, fdt_off_dt_struct(fdt) + delta);
++	fdt_set_off_dt_strings(fdt, fdt_off_dt_strings(fdt) + delta);
++	return 0;
++}
++
++static int fdt_splice_struct_(void *fdt, void *p,
++			      int oldlen, int newlen)
++{
++	int delta =3D newlen - oldlen;
++	int err;
++
++	if ((err =3D fdt_splice_(fdt, p, oldlen, newlen)))
++		return err;
++
++	fdt_set_size_dt_struct(fdt, fdt_size_dt_struct(fdt) + delta);
++	fdt_set_off_dt_strings(fdt, fdt_off_dt_strings(fdt) + delta);
++	return 0;
++}
++
++/* Must only be used to roll back in case of error */
++static void fdt_del_last_string_(void *fdt, const char *s)
++{
++	int newlen =3D strlen(s) + 1;
++
++	fdt_set_size_dt_strings(fdt, fdt_size_dt_strings(fdt) - newlen);
++}
++
++static int fdt_splice_string_(void *fdt, int newlen)
++{
++	void *p =3D (char *)fdt
++		+ fdt_off_dt_strings(fdt) + fdt_size_dt_strings(fdt);
++	int err;
++
++	if ((err =3D fdt_splice_(fdt, p, 0, newlen)))
++		return err;
++
++	fdt_set_size_dt_strings(fdt, fdt_size_dt_strings(fdt) + newlen);
++	return 0;
++}
++
++/**
++ * fdt_find_add_string_() - Find or allocate a string
++ *
++ * @fdt: pointer to the device tree to check/adjust
++ * @s: string to find/add
++ * @allocated: Set to 0 if the string was found, 1 if not found and so
++ *	allocated. Ignored if can_assume(NO_ROLLBACK)
++ * @return offset of string in the string table (whether found or added=
)
++ */
++static int fdt_find_add_string_(void *fdt, const char *s, int *allocate=
d)
++{
++	char *strtab =3D (char *)fdt + fdt_off_dt_strings(fdt);
++	const char *p;
++	char *new;
++	int len =3D strlen(s) + 1;
++	int err;
++
++	if (!can_assume(NO_ROLLBACK))
++		*allocated =3D 0;
++
++	p =3D fdt_find_string_(strtab, fdt_size_dt_strings(fdt), s);
++	if (p)
++		/* found it */
++		return (p - strtab);
++
++	new =3D strtab + fdt_size_dt_strings(fdt);
++	err =3D fdt_splice_string_(fdt, len);
++	if (err)
++		return err;
++
++	if (!can_assume(NO_ROLLBACK))
++		*allocated =3D 1;
++
++	memcpy(new, s, len);
++	return (new - strtab);
++}
++
++int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size)
++{
++	struct fdt_reserve_entry *re;
++	int err;
++
++	FDT_RW_PROBE(fdt);
++
++	re =3D fdt_mem_rsv_w_(fdt, fdt_num_mem_rsv(fdt));
++	err =3D fdt_splice_mem_rsv_(fdt, re, 0, 1);
++	if (err)
++		return err;
++
++	re->address =3D cpu_to_fdt64(address);
++	re->size =3D cpu_to_fdt64(size);
++	return 0;
++}
++
++int fdt_del_mem_rsv(void *fdt, int n)
++{
++	struct fdt_reserve_entry *re =3D fdt_mem_rsv_w_(fdt, n);
++
++	FDT_RW_PROBE(fdt);
++
++	if (n >=3D fdt_num_mem_rsv(fdt))
++		return -FDT_ERR_NOTFOUND;
++
++	return fdt_splice_mem_rsv_(fdt, re, 1, 0);
++}
++
++static int fdt_resize_property_(void *fdt, int nodeoffset, const char *=
name,
++				int len, struct fdt_property **prop)
++{
++	int oldlen;
++	int err;
++
++	*prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
++	if (!*prop)
++		return oldlen;
++
++	if ((err =3D fdt_splice_struct_(fdt, (*prop)->data, FDT_TAGALIGN(oldle=
n),
++				      FDT_TAGALIGN(len))))
++		return err;
++
++	(*prop)->len =3D cpu_to_fdt32(len);
++	return 0;
++}
++
++static int fdt_add_property_(void *fdt, int nodeoffset, const char *nam=
e,
++			     int len, struct fdt_property **prop)
++{
++	int proplen;
++	int nextoffset;
++	int namestroff;
++	int err;
++	int allocated;
++
++	if ((nextoffset =3D fdt_check_node_offset_(fdt, nodeoffset)) < 0)
++		return nextoffset;
++
++	namestroff =3D fdt_find_add_string_(fdt, name, &allocated);
++	if (namestroff < 0)
++		return namestroff;
++
++	*prop =3D fdt_offset_ptr_w_(fdt, nextoffset);
++	proplen =3D sizeof(**prop) + FDT_TAGALIGN(len);
++
++	err =3D fdt_splice_struct_(fdt, *prop, 0, proplen);
++	if (err) {
++		/* Delete the string if we failed to add it */
++		if (!can_assume(NO_ROLLBACK) && allocated)
++			fdt_del_last_string_(fdt, name);
++		return err;
++	}
++
++	(*prop)->tag =3D cpu_to_fdt32(FDT_PROP);
++	(*prop)->nameoff =3D cpu_to_fdt32(namestroff);
++	(*prop)->len =3D cpu_to_fdt32(len);
++	return 0;
++}
++
++int fdt_set_name(void *fdt, int nodeoffset, const char *name)
++{
++	char *namep;
++	int oldlen, newlen;
++	int err;
++
++	FDT_RW_PROBE(fdt);
++
++	namep =3D (char *)(uintptr_t)fdt_get_name(fdt, nodeoffset, &oldlen);
++	if (!namep)
++		return oldlen;
++
++	newlen =3D strlen(name);
++
++	err =3D fdt_splice_struct_(fdt, namep, FDT_TAGALIGN(oldlen+1),
++				 FDT_TAGALIGN(newlen+1));
++	if (err)
++		return err;
++
++	memcpy(namep, name, newlen+1);
++	return 0;
++}
++
++int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name=
,
++			    int len, void **prop_data)
++{
++	struct fdt_property *prop;
++	int err;
++
++	FDT_RW_PROBE(fdt);
++
++	err =3D fdt_resize_property_(fdt, nodeoffset, name, len, &prop);
++	if (err =3D=3D -FDT_ERR_NOTFOUND)
++		err =3D fdt_add_property_(fdt, nodeoffset, name, len, &prop);
++	if (err)
++		return err;
++
++	*prop_data =3D prop->data;
++	return 0;
++}
++
++int fdt_setprop(void *fdt, int nodeoffset, const char *name,
++		const void *val, int len)
++{
++	void *prop_data;
++	int err;
++
++	err =3D fdt_setprop_placeholder(fdt, nodeoffset, name, len, &prop_data=
);
++	if (err)
++		return err;
++
++	if (len)
++		memcpy(prop_data, val, len);
++	return 0;
++}
++
++int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
++		   const void *val, int len)
++{
++	struct fdt_property *prop;
++	int err, oldlen, newlen;
++
++	FDT_RW_PROBE(fdt);
++
++	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &oldlen);
++	if (prop) {
++		newlen =3D len + oldlen;
++		err =3D fdt_splice_struct_(fdt, prop->data,
++					 FDT_TAGALIGN(oldlen),
++					 FDT_TAGALIGN(newlen));
++		if (err)
++			return err;
++		prop->len =3D cpu_to_fdt32(newlen);
++		memcpy(prop->data + oldlen, val, len);
++	} else {
++		err =3D fdt_add_property_(fdt, nodeoffset, name, len, &prop);
++		if (err)
++			return err;
++		memcpy(prop->data, val, len);
++	}
++	return 0;
++}
++
++int fdt_delprop(void *fdt, int nodeoffset, const char *name)
++{
++	struct fdt_property *prop;
++	int len, proplen;
++
++	FDT_RW_PROBE(fdt);
++
++	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
++	if (!prop)
++		return len;
++
++	proplen =3D sizeof(*prop) + FDT_TAGALIGN(len);
++	return fdt_splice_struct_(fdt, prop, proplen, 0);
++}
++
++int fdt_add_subnode_namelen(void *fdt, int parentoffset,
++			    const char *name, int namelen)
++{
++	struct fdt_node_header *nh;
++	int offset, nextoffset;
++	int nodelen;
++	int err;
++	uint32_t tag;
++	fdt32_t *endtag;
++
++	FDT_RW_PROBE(fdt);
++
++	offset =3D fdt_subnode_offset_namelen(fdt, parentoffset, name, namelen=
);
++	if (offset >=3D 0)
++		return -FDT_ERR_EXISTS;
++	else if (offset !=3D -FDT_ERR_NOTFOUND)
++		return offset;
++
++	/* Try to place the new node after the parent's properties */
++	tag =3D fdt_next_tag(fdt, parentoffset, &nextoffset);
++	/* the fdt_subnode_offset_namelen() should ensure this never hits */
++	if (!can_assume(LIBFDT_FLAWLESS) && (tag !=3D FDT_BEGIN_NODE))
++		return -FDT_ERR_INTERNAL;
++	do {
++		offset =3D nextoffset;
++		tag =3D fdt_next_tag(fdt, offset, &nextoffset);
++	} while ((tag =3D=3D FDT_PROP) || (tag =3D=3D FDT_NOP));
++
++	nh =3D fdt_offset_ptr_w_(fdt, offset);
++	nodelen =3D sizeof(*nh) + FDT_TAGALIGN(namelen+1) + FDT_TAGSIZE;
++
++	err =3D fdt_splice_struct_(fdt, nh, 0, nodelen);
++	if (err)
++		return err;
++
++	nh->tag =3D cpu_to_fdt32(FDT_BEGIN_NODE);
++	memset(nh->name, 0, FDT_TAGALIGN(namelen+1));
++	memcpy(nh->name, name, namelen);
++	endtag =3D (fdt32_t *)((char *)nh + nodelen - FDT_TAGSIZE);
++	*endtag =3D cpu_to_fdt32(FDT_END_NODE);
++
++	return offset;
++}
++
++int fdt_add_subnode(void *fdt, int parentoffset, const char *name)
++{
++	return fdt_add_subnode_namelen(fdt, parentoffset, name, strlen(name));
++}
++
++int fdt_del_node(void *fdt, int nodeoffset)
++{
++	int endoffset;
++
++	FDT_RW_PROBE(fdt);
++
++	endoffset =3D fdt_node_end_offset_(fdt, nodeoffset);
++	if (endoffset < 0)
++		return endoffset;
++
++	return fdt_splice_struct_(fdt, fdt_offset_ptr_w_(fdt, nodeoffset),
++				  endoffset - nodeoffset, 0);
++}
++
++static void fdt_packblocks_(const char *old, char *new,
++			    int mem_rsv_size,
++			    int struct_size,
++			    int strings_size)
++{
++	int mem_rsv_off, struct_off, strings_off;
++
++	mem_rsv_off =3D FDT_ALIGN(sizeof(struct fdt_header), 8);
++	struct_off =3D mem_rsv_off + mem_rsv_size;
++	strings_off =3D struct_off + struct_size;
++
++	memmove(new + mem_rsv_off, old + fdt_off_mem_rsvmap(old), mem_rsv_size=
);
++	fdt_set_off_mem_rsvmap(new, mem_rsv_off);
++
++	memmove(new + struct_off, old + fdt_off_dt_struct(old), struct_size);
++	fdt_set_off_dt_struct(new, struct_off);
++	fdt_set_size_dt_struct(new, struct_size);
++
++	memmove(new + strings_off, old + fdt_off_dt_strings(old), strings_size=
);
++	fdt_set_off_dt_strings(new, strings_off);
++	fdt_set_size_dt_strings(new, fdt_size_dt_strings(old));
++}
++
++int fdt_open_into(const void *fdt, void *buf, int bufsize)
++{
++	int err;
++	int mem_rsv_size, struct_size;
++	int newsize;
++	const char *fdtstart =3D fdt;
++	const char *fdtend =3D fdtstart + fdt_totalsize(fdt);
++	char *tmp;
++
++	FDT_RO_PROBE(fdt);
++
++	mem_rsv_size =3D (fdt_num_mem_rsv(fdt)+1)
++		* sizeof(struct fdt_reserve_entry);
++
++	if (can_assume(LATEST) || fdt_version(fdt) >=3D 17) {
++		struct_size =3D fdt_size_dt_struct(fdt);
++	} else if (fdt_version(fdt) =3D=3D 16) {
++		struct_size =3D 0;
++		while (fdt_next_tag(fdt, struct_size, &struct_size) !=3D FDT_END)
++			;
++		if (struct_size < 0)
++			return struct_size;
++	} else {
++		return -FDT_ERR_BADVERSION;
++	}
++
++	if (can_assume(LIBFDT_ORDER) ||
++	    !fdt_blocks_misordered_(fdt, mem_rsv_size, struct_size)) {
++		/* no further work necessary */
++		err =3D fdt_move(fdt, buf, bufsize);
++		if (err)
++			return err;
++		fdt_set_version(buf, 17);
++		fdt_set_size_dt_struct(buf, struct_size);
++		fdt_set_totalsize(buf, bufsize);
++		return 0;
++	}
++
++	/* Need to reorder */
++	newsize =3D FDT_ALIGN(sizeof(struct fdt_header), 8) + mem_rsv_size
++		+ struct_size + fdt_size_dt_strings(fdt);
++
++	if (bufsize < newsize)
++		return -FDT_ERR_NOSPACE;
++
++	/* First attempt to build converted tree at beginning of buffer */
++	tmp =3D buf;
++	/* But if that overlaps with the old tree... */
++	if (((tmp + newsize) > fdtstart) && (tmp < fdtend)) {
++		/* Try right after the old tree instead */
++		tmp =3D (char *)(uintptr_t)fdtend;
++		if ((tmp + newsize) > ((char *)buf + bufsize))
++			return -FDT_ERR_NOSPACE;
++	}
++
++	fdt_packblocks_(fdt, tmp, mem_rsv_size, struct_size,
++			fdt_size_dt_strings(fdt));
++	memmove(buf, tmp, newsize);
++
++	fdt_set_magic(buf, FDT_MAGIC);
++	fdt_set_totalsize(buf, bufsize);
++	fdt_set_version(buf, 17);
++	fdt_set_last_comp_version(buf, 16);
++	fdt_set_boot_cpuid_phys(buf, fdt_boot_cpuid_phys(fdt));
++
++	return 0;
++}
++
++int fdt_pack(void *fdt)
++{
++	int mem_rsv_size;
++
++	FDT_RW_PROBE(fdt);
++
++	mem_rsv_size =3D (fdt_num_mem_rsv(fdt)+1)
++		* sizeof(struct fdt_reserve_entry);
++	fdt_packblocks_(fdt, fdt, mem_rsv_size, fdt_size_dt_struct(fdt),
++			fdt_size_dt_strings(fdt));
++	fdt_set_totalsize(fdt, fdt_data_size_(fdt));
++
++	return 0;
++}
+diff --git a/common/libfdt/fdt_strerror.c b/common/libfdt/fdt_strerror.c
+new file mode 100644
+index 0000000..b435693
+--- /dev/null
++++ b/common/libfdt/fdt_strerror.c
+@@ -0,0 +1,59 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ *     EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++struct fdt_errtabent {
++	const char *str;
++};
++
++#define FDT_ERRTABENT(val) \
++	[(val)] =3D { .str =3D #val, }
++
++static struct fdt_errtabent fdt_errtable[] =3D {
++	FDT_ERRTABENT(FDT_ERR_NOTFOUND),
++	FDT_ERRTABENT(FDT_ERR_EXISTS),
++	FDT_ERRTABENT(FDT_ERR_NOSPACE),
++
++	FDT_ERRTABENT(FDT_ERR_BADOFFSET),
++	FDT_ERRTABENT(FDT_ERR_BADPATH),
++	FDT_ERRTABENT(FDT_ERR_BADPHANDLE),
++	FDT_ERRTABENT(FDT_ERR_BADSTATE),
++
++	FDT_ERRTABENT(FDT_ERR_TRUNCATED),
++	FDT_ERRTABENT(FDT_ERR_BADMAGIC),
++	FDT_ERRTABENT(FDT_ERR_BADVERSION),
++	FDT_ERRTABENT(FDT_ERR_BADSTRUCTURE),
++	FDT_ERRTABENT(FDT_ERR_BADLAYOUT),
++	FDT_ERRTABENT(FDT_ERR_INTERNAL),
++	FDT_ERRTABENT(FDT_ERR_BADNCELLS),
++	FDT_ERRTABENT(FDT_ERR_BADVALUE),
++	FDT_ERRTABENT(FDT_ERR_BADOVERLAY),
++	FDT_ERRTABENT(FDT_ERR_NOPHANDLES),
++	FDT_ERRTABENT(FDT_ERR_BADFLAGS),
++};
++#define FDT_ERRTABSIZE	((int)(sizeof(fdt_errtable) / sizeof(fdt_errtabl=
e[0])))
++
++const char *fdt_strerror(int errval)
++{
++	if (errval > 0)
++		return "<valid offset/length>";
++	else if (errval =3D=3D 0)
++		return "<no error>";
++	else if (-errval < FDT_ERRTABSIZE) {
++		const char *s =3D fdt_errtable[-errval].str;
++
++		if (s)
++			return s;
++	}
++
++	return "<unknown error>";
++}
+diff --git a/common/libfdt/fdt_sw.c b/common/libfdt/fdt_sw.c
+new file mode 100644
+index 0000000..4c569ee
+--- /dev/null
++++ b/common/libfdt/fdt_sw.c
+@@ -0,0 +1,384 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++static int fdt_sw_probe_(void *fdt)
++{
++	if (!can_assume(VALID_INPUT)) {
++		if (fdt_magic(fdt) =3D=3D FDT_MAGIC)
++			return -FDT_ERR_BADSTATE;
++		else if (fdt_magic(fdt) !=3D FDT_SW_MAGIC)
++			return -FDT_ERR_BADMAGIC;
++	}
++
++	return 0;
++}
++
++#define FDT_SW_PROBE(fdt) \
++	{ \
++		int err; \
++		if ((err =3D fdt_sw_probe_(fdt)) !=3D 0) \
++			return err; \
++	}
++
++/* 'memrsv' state:	Initial state after fdt_create()
++ *
++ * Allowed functions:
++ *	fdt_add_reservemap_entry()
++ *	fdt_finish_reservemap()		[moves to 'struct' state]
++ */
++static int fdt_sw_probe_memrsv_(void *fdt)
++{
++	int err =3D fdt_sw_probe_(fdt);
++	if (err)
++		return err;
++
++	if (!can_assume(VALID_INPUT) && fdt_off_dt_strings(fdt) !=3D 0)
++		return -FDT_ERR_BADSTATE;
++	return 0;
++}
++
++#define FDT_SW_PROBE_MEMRSV(fdt) \
++	{ \
++		int err; \
++		if ((err =3D fdt_sw_probe_memrsv_(fdt)) !=3D 0) \
++			return err; \
++	}
++
++/* 'struct' state:	Enter this state after fdt_finish_reservemap()
++ *
++ * Allowed functions:
++ *	fdt_begin_node()
++ *	fdt_end_node()
++ *	fdt_property*()
++ *	fdt_finish()			[moves to 'complete' state]
++ */
++static int fdt_sw_probe_struct_(void *fdt)
++{
++	int err =3D fdt_sw_probe_(fdt);
++	if (err)
++		return err;
++
++	if (!can_assume(VALID_INPUT) &&
++	    fdt_off_dt_strings(fdt) !=3D fdt_totalsize(fdt))
++		return -FDT_ERR_BADSTATE;
++	return 0;
++}
++
++#define FDT_SW_PROBE_STRUCT(fdt) \
++	{ \
++		int err; \
++		if ((err =3D fdt_sw_probe_struct_(fdt)) !=3D 0) \
++			return err; \
++	}
++
++static inline uint32_t sw_flags(void *fdt)
++{
++	/* assert: (fdt_magic(fdt) =3D=3D FDT_SW_MAGIC) */
++	return fdt_last_comp_version(fdt);
++}
++
++/* 'complete' state:	Enter this state after fdt_finish()
++ *
++ * Allowed functions: none
++ */
++
++static void *fdt_grab_space_(void *fdt, size_t len)
++{
++	unsigned int offset =3D fdt_size_dt_struct(fdt);
++	unsigned int spaceleft;
++
++	spaceleft =3D fdt_totalsize(fdt) - fdt_off_dt_struct(fdt)
++		- fdt_size_dt_strings(fdt);
++
++	if ((offset + len < offset) || (offset + len > spaceleft))
++		return NULL;
++
++	fdt_set_size_dt_struct(fdt, offset + len);
++	return fdt_offset_ptr_w_(fdt, offset);
++}
++
++int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags)
++{
++	const int hdrsize =3D FDT_ALIGN(sizeof(struct fdt_header),
++				      sizeof(struct fdt_reserve_entry));
++	void *fdt =3D buf;
++
++	if (bufsize < hdrsize)
++		return -FDT_ERR_NOSPACE;
++
++	if (flags & ~FDT_CREATE_FLAGS_ALL)
++		return -FDT_ERR_BADFLAGS;
++
++	memset(buf, 0, bufsize);
++
++	/*
++	 * magic and last_comp_version keep intermediate state during the fdt
++	 * creation process, which is replaced with the proper FDT format by
++	 * fdt_finish().
++	 *
++	 * flags should be accessed with sw_flags().
++	 */
++	fdt_set_magic(fdt, FDT_SW_MAGIC);
++	fdt_set_version(fdt, FDT_LAST_SUPPORTED_VERSION);
++	fdt_set_last_comp_version(fdt, flags);
++
++	fdt_set_totalsize(fdt,  bufsize);
++
++	fdt_set_off_mem_rsvmap(fdt, hdrsize);
++	fdt_set_off_dt_struct(fdt, fdt_off_mem_rsvmap(fdt));
++	fdt_set_off_dt_strings(fdt, 0);
++
++	return 0;
++}
++
++int fdt_create(void *buf, int bufsize)
++{
++	return fdt_create_with_flags(buf, bufsize, 0);
++}
++
++int fdt_resize(void *fdt, void *buf, int bufsize)
++{
++	size_t headsize, tailsize;
++	char *oldtail, *newtail;
++
++	FDT_SW_PROBE(fdt);
++
++	if (bufsize < 0)
++		return -FDT_ERR_NOSPACE;
++
++	headsize =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
++	tailsize =3D fdt_size_dt_strings(fdt);
++
++	if (!can_assume(VALID_DTB) &&
++	    headsize + tailsize > fdt_totalsize(fdt))
++		return -FDT_ERR_INTERNAL;
++
++	if ((headsize + tailsize) > (unsigned)bufsize)
++		return -FDT_ERR_NOSPACE;
++
++	oldtail =3D (char *)fdt + fdt_totalsize(fdt) - tailsize;
++	newtail =3D (char *)buf + bufsize - tailsize;
++
++	/* Two cases to avoid clobbering data if the old and new
++	 * buffers partially overlap */
++	if (buf <=3D fdt) {
++		memmove(buf, fdt, headsize);
++		memmove(newtail, oldtail, tailsize);
++	} else {
++		memmove(newtail, oldtail, tailsize);
++		memmove(buf, fdt, headsize);
++	}
++
++	fdt_set_totalsize(buf, bufsize);
++	if (fdt_off_dt_strings(buf))
++		fdt_set_off_dt_strings(buf, bufsize);
++
++	return 0;
++}
++
++int fdt_add_reservemap_entry(void *fdt, uint64_t addr, uint64_t size)
++{
++	struct fdt_reserve_entry *re;
++	int offset;
++
++	FDT_SW_PROBE_MEMRSV(fdt);
++
++	offset =3D fdt_off_dt_struct(fdt);
++	if ((offset + sizeof(*re)) > fdt_totalsize(fdt))
++		return -FDT_ERR_NOSPACE;
++
++	re =3D (struct fdt_reserve_entry *)((char *)fdt + offset);
++	re->address =3D cpu_to_fdt64(addr);
++	re->size =3D cpu_to_fdt64(size);
++
++	fdt_set_off_dt_struct(fdt, offset + sizeof(*re));
++
++	return 0;
++}
++
++int fdt_finish_reservemap(void *fdt)
++{
++	int err =3D fdt_add_reservemap_entry(fdt, 0, 0);
++
++	if (err)
++		return err;
++
++	fdt_set_off_dt_strings(fdt, fdt_totalsize(fdt));
++	return 0;
++}
++
++int fdt_begin_node(void *fdt, const char *name)
++{
++	struct fdt_node_header *nh;
++	int namelen;
++
++	FDT_SW_PROBE_STRUCT(fdt);
++
++	namelen =3D strlen(name) + 1;
++	nh =3D fdt_grab_space_(fdt, sizeof(*nh) + FDT_TAGALIGN(namelen));
++	if (! nh)
++		return -FDT_ERR_NOSPACE;
++
++	nh->tag =3D cpu_to_fdt32(FDT_BEGIN_NODE);
++	memcpy(nh->name, name, namelen);
++	return 0;
++}
++
++int fdt_end_node(void *fdt)
++{
++	fdt32_t *en;
++
++	FDT_SW_PROBE_STRUCT(fdt);
++
++	en =3D fdt_grab_space_(fdt, FDT_TAGSIZE);
++	if (! en)
++		return -FDT_ERR_NOSPACE;
++
++	*en =3D cpu_to_fdt32(FDT_END_NODE);
++	return 0;
++}
++
++static int fdt_add_string_(void *fdt, const char *s)
++{
++	char *strtab =3D (char *)fdt + fdt_totalsize(fdt);
++	unsigned int strtabsize =3D fdt_size_dt_strings(fdt);
++	unsigned int len =3D strlen(s) + 1;
++	unsigned int struct_top, offset;
++
++	offset =3D strtabsize + len;
++	struct_top =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
++	if (fdt_totalsize(fdt) - offset < struct_top)
++		return 0; /* no more room :( */
++
++	memcpy(strtab - offset, s, len);
++	fdt_set_size_dt_strings(fdt, strtabsize + len);
++	return -offset;
++}
++
++/* Must only be used to roll back in case of error */
++static void fdt_del_last_string_(void *fdt, const char *s)
++{
++	int strtabsize =3D fdt_size_dt_strings(fdt);
++	int len =3D strlen(s) + 1;
++
++	fdt_set_size_dt_strings(fdt, strtabsize - len);
++}
++
++static int fdt_find_add_string_(void *fdt, const char *s, int *allocate=
d)
++{
++	char *strtab =3D (char *)fdt + fdt_totalsize(fdt);
++	int strtabsize =3D fdt_size_dt_strings(fdt);
++	const char *p;
++
++	*allocated =3D 0;
++
++	p =3D fdt_find_string_(strtab - strtabsize, strtabsize, s);
++	if (p)
++		return p - strtab;
++
++	*allocated =3D 1;
++
++	return fdt_add_string_(fdt, s);
++}
++
++int fdt_property_placeholder(void *fdt, const char *name, int len, void=
 **valp)
++{
++	struct fdt_property *prop;
++	int nameoff;
++	int allocated;
++
++	FDT_SW_PROBE_STRUCT(fdt);
++
++	/* String de-duplication can be slow, _NO_NAME_DEDUP skips it */
++	if (sw_flags(fdt) & FDT_CREATE_FLAG_NO_NAME_DEDUP) {
++		allocated =3D 1;
++		nameoff =3D fdt_add_string_(fdt, name);
++	} else {
++		nameoff =3D fdt_find_add_string_(fdt, name, &allocated);
++	}
++	if (nameoff =3D=3D 0)
++		return -FDT_ERR_NOSPACE;
++
++	prop =3D fdt_grab_space_(fdt, sizeof(*prop) + FDT_TAGALIGN(len));
++	if (! prop) {
++		if (allocated)
++			fdt_del_last_string_(fdt, name);
++		return -FDT_ERR_NOSPACE;
++	}
++
++	prop->tag =3D cpu_to_fdt32(FDT_PROP);
++	prop->nameoff =3D cpu_to_fdt32(nameoff);
++	prop->len =3D cpu_to_fdt32(len);
++	*valp =3D prop->data;
++	return 0;
++}
++
++int fdt_property(void *fdt, const char *name, const void *val, int len)
++{
++	void *ptr;
++	int ret;
++
++	ret =3D fdt_property_placeholder(fdt, name, len, &ptr);
++	if (ret)
++		return ret;
++	memcpy(ptr, val, len);
++	return 0;
++}
++
++int fdt_finish(void *fdt)
++{
++	char *p =3D (char *)fdt;
++	fdt32_t *end;
++	int oldstroffset, newstroffset;
++	uint32_t tag;
++	int offset, nextoffset;
++
++	FDT_SW_PROBE_STRUCT(fdt);
++
++	/* Add terminator */
++	end =3D fdt_grab_space_(fdt, sizeof(*end));
++	if (! end)
++		return -FDT_ERR_NOSPACE;
++	*end =3D cpu_to_fdt32(FDT_END);
++
++	/* Relocate the string table */
++	oldstroffset =3D fdt_totalsize(fdt) - fdt_size_dt_strings(fdt);
++	newstroffset =3D fdt_off_dt_struct(fdt) + fdt_size_dt_struct(fdt);
++	memmove(p + newstroffset, p + oldstroffset, fdt_size_dt_strings(fdt));
++	fdt_set_off_dt_strings(fdt, newstroffset);
++
++	/* Walk the structure, correcting string offsets */
++	offset =3D 0;
++	while ((tag =3D fdt_next_tag(fdt, offset, &nextoffset)) !=3D FDT_END) =
{
++		if (tag =3D=3D FDT_PROP) {
++			struct fdt_property *prop =3D
++				fdt_offset_ptr_w_(fdt, offset);
++			int nameoff;
++
++			nameoff =3D fdt32_to_cpu(prop->nameoff);
++			nameoff +=3D fdt_size_dt_strings(fdt);
++			prop->nameoff =3D cpu_to_fdt32(nameoff);
++		}
++		offset =3D nextoffset;
++	}
++	if (nextoffset < 0)
++		return nextoffset;
++
++	/* Finally, adjust the header */
++	fdt_set_totalsize(fdt, newstroffset + fdt_size_dt_strings(fdt));
++
++	/* And fix up fields that were keeping intermediate state. */
++	fdt_set_last_comp_version(fdt, FDT_LAST_COMPATIBLE_VERSION);
++	fdt_set_magic(fdt, FDT_MAGIC);
++
++	return 0;
++}
+diff --git a/common/libfdt/fdt_wip.c b/common/libfdt/fdt_wip.c
+new file mode 100644
+index 0000000..c2d7566
+--- /dev/null
++++ b/common/libfdt/fdt_wip.c
+@@ -0,0 +1,94 @@
++// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include "libfdt_env.h"
++
++#include <fdt.h>
++#include <libfdt.h>
++
++#include "libfdt_internal.h"
++
++int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
++					const char *name, int namelen,
++					uint32_t idx, const void *val,
++					int len)
++{
++	void *propval;
++	int proplen;
++
++	propval =3D fdt_getprop_namelen_w(fdt, nodeoffset, name, namelen,
++					&proplen);
++	if (!propval)
++		return proplen;
++
++	if ((unsigned)proplen < (len + idx))
++		return -FDT_ERR_NOSPACE;
++
++	memcpy((char *)propval + idx, val, len);
++	return 0;
++}
++
++int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
++			const void *val, int len)
++{
++	const void *propval;
++	int proplen;
++
++	propval =3D fdt_getprop(fdt, nodeoffset, name, &proplen);
++	if (!propval)
++		return proplen;
++
++	if (proplen !=3D len)
++		return -FDT_ERR_NOSPACE;
++
++	return fdt_setprop_inplace_namelen_partial(fdt, nodeoffset, name,
++						   strlen(name), 0,
++						   val, len);
++}
++
++static void fdt_nop_region_(void *start, int len)
++{
++	fdt32_t *p;
++
++	for (p =3D start; (char *)p < ((char *)start + len); p++)
++		*p =3D cpu_to_fdt32(FDT_NOP);
++}
++
++int fdt_nop_property(void *fdt, int nodeoffset, const char *name)
++{
++	struct fdt_property *prop;
++	int len;
++
++	prop =3D fdt_get_property_w(fdt, nodeoffset, name, &len);
++	if (!prop)
++		return len;
++
++	fdt_nop_region_(prop, len + sizeof(*prop));
++
++	return 0;
++}
++
++int fdt_node_end_offset_(void *fdt, int offset)
++{
++	int depth =3D 0;
++
++	while ((offset >=3D 0) && (depth >=3D 0))
++		offset =3D fdt_next_node(fdt, offset, &depth);
++
++	return offset;
++}
++
++int fdt_nop_node(void *fdt, int nodeoffset)
++{
++	int endoffset;
++
++	endoffset =3D fdt_node_end_offset_(fdt, nodeoffset);
++	if (endoffset < 0)
++		return endoffset;
++
++	fdt_nop_region_(fdt_offset_ptr_w(fdt, nodeoffset, 0),
++			endoffset - nodeoffset);
++	return 0;
++}
+diff --git a/common/libfdt/libfdt_internal.h b/common/libfdt/libfdt_inte=
rnal.h
+new file mode 100644
+index 0000000..16bda19
+--- /dev/null
++++ b/common/libfdt/libfdt_internal.h
+@@ -0,0 +1,192 @@
++/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
++#ifndef LIBFDT_INTERNAL_H
++#define LIBFDT_INTERNAL_H
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++#include <fdt.h>
++
++#define FDT_ALIGN(x, a)		(((x) + (a) - 1) & ~((a) - 1))
++#define FDT_TAGALIGN(x)		(FDT_ALIGN((x), FDT_TAGSIZE))
++
++int32_t fdt_ro_probe_(const void *fdt);
++#define FDT_RO_PROBE(fdt)					\
++	{							\
++		int32_t totalsize_;				\
++		if ((totalsize_ =3D fdt_ro_probe_(fdt)) < 0)	\
++			return totalsize_;			\
++	}
++
++int fdt_check_node_offset_(const void *fdt, int offset);
++int fdt_check_prop_offset_(const void *fdt, int offset);
++const char *fdt_find_string_(const char *strtab, int tabsize, const cha=
r *s);
++int fdt_node_end_offset_(void *fdt, int nodeoffset);
++
++static inline const void *fdt_offset_ptr_(const void *fdt, int offset)
++{
++	return (const char *)fdt + fdt_off_dt_struct(fdt) + offset;
++}
++
++static inline void *fdt_offset_ptr_w_(void *fdt, int offset)
++{
++	return (void *)(uintptr_t)fdt_offset_ptr_(fdt, offset);
++}
++
++static inline const struct fdt_reserve_entry *fdt_mem_rsv_(const void *=
fdt, int n)
++{
++	const struct fdt_reserve_entry *rsv_table =3D
++		(const struct fdt_reserve_entry *)
++		((const char *)fdt + fdt_off_mem_rsvmap(fdt));
++
++	return rsv_table + n;
++}
++static inline struct fdt_reserve_entry *fdt_mem_rsv_w_(void *fdt, int n=
)
++{
++	return (void *)(uintptr_t)fdt_mem_rsv_(fdt, n);
++}
++
++/*
++ * Internal helpers to access tructural elements of the device tree
++ * blob (rather than for exaple reading integers from within property
++ * values).  We assume that we are either given a naturally aligned
++ * address for the platform or if we are not, we are on a platform
++ * where unaligned memory reads will be handled in a graceful manner.
++ * If not the external helpers fdtXX_ld() from libfdt.h can be used
++ * instead.
++ */
++static inline uint32_t fdt32_ld_(const fdt32_t *p)
++{
++	return fdt32_to_cpu(*p);
++}
++
++static inline uint64_t fdt64_ld_(const fdt64_t *p)
++{
++	return fdt64_to_cpu(*p);
++}
++
++#define FDT_SW_MAGIC		(~FDT_MAGIC)
++
++/**********************************************************************=
/
++/* Checking controls                                                  *=
/
++/**********************************************************************=
/
++
++#ifndef FDT_ASSUME_MASK
++#define FDT_ASSUME_MASK 0
++#endif
++
++/*
++ * Defines assumptions which can be enabled. Each of these can be enabl=
ed
++ * individually. For maximum safety, don't enable any assumptions!
++ *
++ * For minimal code size and no safety, use ASSUME_PERFECT at your own =
risk.
++ * You should have another method of validating the device tree, such a=
s a
++ * signature or hash check before using libfdt.
++ *
++ * For situations where security is not a concern it may be safe to ena=
ble
++ * ASSUME_SANE.
++ */
++enum {
++	/*
++	 * This does essentially no checks. Only the latest device-tree
++	 * version is correctly handled. Inconsistencies or errors in the devi=
ce
++	 * tree may cause undefined behaviour or crashes. Invalid parameters
++	 * passed to libfdt may do the same.
++	 *
++	 * If an error occurs when modifying the tree it may leave the tree in
++	 * an intermediate (but valid) state. As an example, adding a property
++	 * where there is insufficient space may result in the property name
++	 * being added to the string table even though the property itself is
++	 * not added to the struct section.
++	 *
++	 * Only use this if you have a fully validated device tree with
++	 * the latest supported version and wish to minimise code size.
++	 */
++	ASSUME_PERFECT		=3D 0xff,
++
++	/*
++	 * This assumes that the device tree is sane. i.e. header metadata
++	 * and basic hierarchy are correct.
++	 *
++	 * With this assumption enabled, normal device trees produced by libfd=
t
++	 * and the compiler should be handled safely. Malicious device trees a=
nd
++	 * complete garbage may cause libfdt to behave badly or crash. Truncat=
ed
++	 * device trees (e.g. those only partially loaded) can also cause
++	 * problems.
++	 *
++	 * Note: Only checks that relate exclusively to the device tree itself
++	 * (not the parameters passed to libfdt) are disabled by this
++	 * assumption. This includes checking headers, tags and the like.
++	 */
++	ASSUME_VALID_DTB	=3D 1 << 0,
++
++	/*
++	 * This builds on ASSUME_VALID_DTB and further assumes that libfdt
++	 * functions are called with valid parameters, i.e. not trigger
++	 * FDT_ERR_BADOFFSET or offsets that are out of bounds. It disables an=
y
++	 * extensive checking of parameters and the device tree, making variou=
s
++	 * assumptions about correctness.
++	 *
++	 * It doesn't make sense to enable this assumption unless
++	 * ASSUME_VALID_DTB is also enabled.
++	 */
++	ASSUME_VALID_INPUT	=3D 1 << 1,
++
++	/*
++	 * This disables checks for device-tree version and removes all code
++	 * which handles older versions.
++	 *
++	 * Only enable this if you know you have a device tree with the latest
++	 * version.
++	 */
++	ASSUME_LATEST		=3D 1 << 2,
++
++	/*
++	 * This assumes that it is OK for a failed addition to the device tree=
,
++	 * due to lack of space or some other problem, to skip any rollback
++	 * steps (such as dropping the property name from the string table).
++	 * This is safe to enable in most circumstances, even though it may
++	 * leave the tree in a sub-optimal state.
++	 */
++	ASSUME_NO_ROLLBACK	=3D 1 << 3,
++
++	/*
++	 * This assumes that the device tree components appear in a 'convenien=
t'
++	 * order, i.e. the memory reservation block first, then the structure
++	 * block and finally the string block.
++	 *
++	 * This order is not specified by the device-tree specification,
++	 * but is expected by libfdt. The device-tree compiler always created
++	 * device trees with this order.
++	 *
++	 * This assumption disables a check in fdt_open_into() and removes the
++	 * ability to fix the problem there. This is safe if you know that the
++	 * device tree is correctly ordered. See fdt_blocks_misordered_().
++	 */
++	ASSUME_LIBFDT_ORDER	=3D 1 << 4,
++
++	/*
++	 * This assumes that libfdt itself does not have any internal bugs. It
++	 * drops certain checks that should never be needed unless libfdt has =
an
++	 * undiscovered bug.
++	 *
++	 * This can generally be considered safe to enable.
++	 */
++	ASSUME_LIBFDT_FLAWLESS	=3D 1 << 5,
++};
++
++/**
++ * can_assume_() - check if a particular assumption is enabled
++ *
++ * @mask: Mask to check (ASSUME_...)
++ * @return true if that assumption is enabled, else false
++ */
++static inline bool can_assume_(int mask)
++{
++	return FDT_ASSUME_MASK & mask;
++}
++
++/** helper macros for checking assumptions */
++#define can_assume(_assume)	can_assume_(ASSUME_ ## _assume)
++
++#endif /* LIBFDT_INTERNAL_H */
+diff --git a/include/fdt.h b/include/fdt.h
+new file mode 100644
+index 0000000..f2e6880
+--- /dev/null
++++ b/include/fdt.h
+@@ -0,0 +1,66 @@
++/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
++#ifndef FDT_H
++#define FDT_H
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ * Copyright 2012 Kim Phillips, Freescale Semiconductor.
++ */
++
++#ifndef __ASSEMBLY__
++
++struct fdt_header {
++	fdt32_t magic;			 /* magic word FDT_MAGIC */
++	fdt32_t totalsize;		 /* total size of DT block */
++	fdt32_t off_dt_struct;		 /* offset to structure */
++	fdt32_t off_dt_strings;		 /* offset to strings */
++	fdt32_t off_mem_rsvmap;		 /* offset to memory reserve map */
++	fdt32_t version;		 /* format version */
++	fdt32_t last_comp_version;	 /* last compatible version */
++
++	/* version 2 fields below */
++	fdt32_t boot_cpuid_phys;	 /* Which physical CPU id we're
++					    booting on */
++	/* version 3 fields below */
++	fdt32_t size_dt_strings;	 /* size of the strings block */
++
++	/* version 17 fields below */
++	fdt32_t size_dt_struct;		 /* size of the structure block */
++};
++
++struct fdt_reserve_entry {
++	fdt64_t address;
++	fdt64_t size;
++};
++
++struct fdt_node_header {
++	fdt32_t tag;
++	char name[0];
++};
++
++struct fdt_property {
++	fdt32_t tag;
++	fdt32_t len;
++	fdt32_t nameoff;
++	char data[0];
++};
++
++#endif /* !__ASSEMBLY */
++
++#define FDT_MAGIC	0xd00dfeed	/* 4: version, 4: total size */
++#define FDT_TAGSIZE	sizeof(fdt32_t)
++
++#define FDT_BEGIN_NODE	0x1		/* Start node: full name */
++#define FDT_END_NODE	0x2		/* End node */
++#define FDT_PROP	0x3		/* Property: name off,
++					   size, content */
++#define FDT_NOP		0x4		/* nop */
++#define FDT_END		0x9
++
++#define FDT_V1_SIZE	(7*sizeof(fdt32_t))
++#define FDT_V2_SIZE	(FDT_V1_SIZE + sizeof(fdt32_t))
++#define FDT_V3_SIZE	(FDT_V2_SIZE + sizeof(fdt32_t))
++#define FDT_V16_SIZE	FDT_V3_SIZE
++#define FDT_V17_SIZE	(FDT_V16_SIZE + sizeof(fdt32_t))
++
++#endif /* FDT_H */
+diff --git a/include/libfdt.h b/include/libfdt.h
+new file mode 100644
+index 0000000..a7f432c
+--- /dev/null
++++ b/include/libfdt.h
+@@ -0,0 +1,2147 @@
++/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
++#ifndef LIBFDT_H
++#define LIBFDT_H
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ */
++
++#include <libfdt_env.h>
++#include <fdt.h>
++
++#ifdef __cplusplus
++extern "C" {
++#endif
++
++#define FDT_FIRST_SUPPORTED_VERSION	0x02
++#define FDT_LAST_COMPATIBLE_VERSION 0x10
++#define FDT_LAST_SUPPORTED_VERSION	0x11
++
++/* Error codes: informative error codes */
++#define FDT_ERR_NOTFOUND	1
++	/* FDT_ERR_NOTFOUND: The requested node or property does not exist */
++#define FDT_ERR_EXISTS		2
++	/* FDT_ERR_EXISTS: Attempted to create a node or property which
++	 * already exists */
++#define FDT_ERR_NOSPACE		3
++	/* FDT_ERR_NOSPACE: Operation needed to expand the device
++	 * tree, but its buffer did not have sufficient space to
++	 * contain the expanded tree. Use fdt_open_into() to move the
++	 * device tree to a buffer with more space. */
++
++/* Error codes: codes for bad parameters */
++#define FDT_ERR_BADOFFSET	4
++	/* FDT_ERR_BADOFFSET: Function was passed a structure block
++	 * offset which is out-of-bounds, or which points to an
++	 * unsuitable part of the structure for the operation. */
++#define FDT_ERR_BADPATH		5
++	/* FDT_ERR_BADPATH: Function was passed a badly formatted path
++	 * (e.g. missing a leading / for a function which requires an
++	 * absolute path) */
++#define FDT_ERR_BADPHANDLE	6
++	/* FDT_ERR_BADPHANDLE: Function was passed an invalid phandle.
++	 * This can be caused either by an invalid phandle property
++	 * length, or the phandle value was either 0 or -1, which are
++	 * not permitted. */
++#define FDT_ERR_BADSTATE	7
++	/* FDT_ERR_BADSTATE: Function was passed an incomplete device
++	 * tree created by the sequential-write functions, which is
++	 * not sufficiently complete for the requested operation. */
++
++/* Error codes: codes for bad device tree blobs */
++#define FDT_ERR_TRUNCATED	8
++	/* FDT_ERR_TRUNCATED: FDT or a sub-block is improperly
++	 * terminated (overflows, goes outside allowed bounds, or
++	 * isn't properly terminated).  */
++#define FDT_ERR_BADMAGIC	9
++	/* FDT_ERR_BADMAGIC: Given "device tree" appears not to be a
++	 * device tree at all - it is missing the flattened device
++	 * tree magic number. */
++#define FDT_ERR_BADVERSION	10
++	/* FDT_ERR_BADVERSION: Given device tree has a version which
++	 * can't be handled by the requested operation.  For
++	 * read-write functions, this may mean that fdt_open_into() is
++	 * required to convert the tree to the expected version. */
++#define FDT_ERR_BADSTRUCTURE	11
++	/* FDT_ERR_BADSTRUCTURE: Given device tree has a corrupt
++	 * structure block or other serious error (e.g. misnested
++	 * nodes, or subnodes preceding properties). */
++#define FDT_ERR_BADLAYOUT	12
++	/* FDT_ERR_BADLAYOUT: For read-write functions, the given
++	 * device tree has it's sub-blocks in an order that the
++	 * function can't handle (memory reserve map, then structure,
++	 * then strings).  Use fdt_open_into() to reorganize the tree
++	 * into a form suitable for the read-write operations. */
++
++/* "Can't happen" error indicating a bug in libfdt */
++#define FDT_ERR_INTERNAL	13
++	/* FDT_ERR_INTERNAL: libfdt has failed an internal assertion.
++	 * Should never be returned, if it is, it indicates a bug in
++	 * libfdt itself. */
++
++/* Errors in device tree content */
++#define FDT_ERR_BADNCELLS	14
++	/* FDT_ERR_BADNCELLS: Device tree has a #address-cells, #size-cells
++	 * or similar property with a bad format or value */
++
++#define FDT_ERR_BADVALUE	15
++	/* FDT_ERR_BADVALUE: Device tree has a property with an unexpected
++	 * value. For example: a property expected to contain a string list
++	 * is not NUL-terminated within the length of its value. */
++
++#define FDT_ERR_BADOVERLAY	16
++	/* FDT_ERR_BADOVERLAY: The device tree overlay, while
++	 * correctly structured, cannot be applied due to some
++	 * unexpected or missing value, property or node. */
++
++#define FDT_ERR_NOPHANDLES	17
++	/* FDT_ERR_NOPHANDLES: The device tree doesn't have any
++	 * phandle available anymore without causing an overflow */
++
++#define FDT_ERR_BADFLAGS	18
++	/* FDT_ERR_BADFLAGS: The function was passed a flags field that
++	 * contains invalid flags or an invalid combination of flags. */
++
++#define FDT_ERR_ALIGNMENT	19
++	/* FDT_ERR_ALIGNMENT: The device tree base address is not 8-byte
++	 * aligned. */
++
++#define FDT_ERR_MAX		19
++
++/* constants */
++#define FDT_MAX_PHANDLE 0xfffffffe
++	/* Valid values for phandles range from 1 to 2^32-2. */
++
++/**********************************************************************=
/
++/* Low-level functions (you probably don't need these)                *=
/
++/**********************************************************************=
/
++
++#ifndef SWIG /* This function is not useful in Python */
++const void *fdt_offset_ptr(const void *fdt, int offset, unsigned int ch=
ecklen);
++#endif
++static inline void *fdt_offset_ptr_w(void *fdt, int offset, int checkle=
n)
++{
++	return (void *)(uintptr_t)fdt_offset_ptr(fdt, offset, checklen);
++}
++
++uint32_t fdt_next_tag(const void *fdt, int offset, int *nextoffset);
++
++/*
++ * External helpers to access words from a device tree blob. They're bu=
ilt
++ * to work even with unaligned pointers on platforms (such as ARMv5) th=
at don't
++ * like unaligned loads and stores.
++ */
++static inline uint16_t fdt16_ld(const fdt16_t *p)
++{
++	const uint8_t *bp =3D (const uint8_t *)p;
++
++	return ((uint16_t)bp[0] << 8) | bp[1];
++}
++
++static inline uint32_t fdt32_ld(const fdt32_t *p)
++{
++	const uint8_t *bp =3D (const uint8_t *)p;
++
++	return ((uint32_t)bp[0] << 24)
++		| ((uint32_t)bp[1] << 16)
++		| ((uint32_t)bp[2] << 8)
++		| bp[3];
++}
++
++static inline void fdt32_st(void *property, uint32_t value)
++{
++	uint8_t *bp =3D (uint8_t *)property;
++
++	bp[0] =3D value >> 24;
++	bp[1] =3D (value >> 16) & 0xff;
++	bp[2] =3D (value >> 8) & 0xff;
++	bp[3] =3D value & 0xff;
++}
++
++static inline uint64_t fdt64_ld(const fdt64_t *p)
++{
++	const uint8_t *bp =3D (const uint8_t *)p;
++
++	return ((uint64_t)bp[0] << 56)
++		| ((uint64_t)bp[1] << 48)
++		| ((uint64_t)bp[2] << 40)
++		| ((uint64_t)bp[3] << 32)
++		| ((uint64_t)bp[4] << 24)
++		| ((uint64_t)bp[5] << 16)
++		| ((uint64_t)bp[6] << 8)
++		| bp[7];
++}
++
++static inline void fdt64_st(void *property, uint64_t value)
++{
++	uint8_t *bp =3D (uint8_t *)property;
++
++	bp[0] =3D value >> 56;
++	bp[1] =3D (value >> 48) & 0xff;
++	bp[2] =3D (value >> 40) & 0xff;
++	bp[3] =3D (value >> 32) & 0xff;
++	bp[4] =3D (value >> 24) & 0xff;
++	bp[5] =3D (value >> 16) & 0xff;
++	bp[6] =3D (value >> 8) & 0xff;
++	bp[7] =3D value & 0xff;
++}
++
++/**********************************************************************=
/
++/* Traversal functions                                                *=
/
++/**********************************************************************=
/
++
++int fdt_next_node(const void *fdt, int offset, int *depth);
++
++/**
++ * fdt_first_subnode() - get offset of first direct subnode
++ * @fdt:	FDT blob
++ * @offset:	Offset of node to check
++ *
++ * Return: offset of first subnode, or -FDT_ERR_NOTFOUND if there is no=
ne
++ */
++int fdt_first_subnode(const void *fdt, int offset);
++
++/**
++ * fdt_next_subnode() - get offset of next direct subnode
++ * @fdt:	FDT blob
++ * @offset:	Offset of previous subnode
++ *
++ * After first calling fdt_first_subnode(), call this function repeated=
ly to
++ * get direct subnodes of a parent node.
++ *
++ * Return: offset of next subnode, or -FDT_ERR_NOTFOUND if there are no=
 more
++ *         subnodes
++ */
++int fdt_next_subnode(const void *fdt, int offset);
++
++/**
++ * fdt_for_each_subnode - iterate over all subnodes of a parent
++ *
++ * @node:	child node (int, lvalue)
++ * @fdt:	FDT blob (const void *)
++ * @parent:	parent node (int)
++ *
++ * This is actually a wrapper around a for loop and would be used like =
so:
++ *
++ *	fdt_for_each_subnode(node, fdt, parent) {
++ *		Use node
++ *		...
++ *	}
++ *
++ *	if ((node < 0) && (node !=3D -FDT_ERR_NOTFOUND)) {
++ *		Error handling
++ *	}
++ *
++ * Note that this is implemented as a macro and @node is used as
++ * iterator in the loop. The parent variable be constant or even a
++ * literal.
++ */
++#define fdt_for_each_subnode(node, fdt, parent)		\
++	for (node =3D fdt_first_subnode(fdt, parent);	\
++	     node >=3D 0;					\
++	     node =3D fdt_next_subnode(fdt, node))
++
++/**********************************************************************=
/
++/* General functions                                                  *=
/
++/**********************************************************************=
/
++#define fdt_get_header(fdt, field) \
++	(fdt32_ld(&((const struct fdt_header *)(fdt))->field))
++#define fdt_magic(fdt)			(fdt_get_header(fdt, magic))
++#define fdt_totalsize(fdt)		(fdt_get_header(fdt, totalsize))
++#define fdt_off_dt_struct(fdt)		(fdt_get_header(fdt, off_dt_struct))
++#define fdt_off_dt_strings(fdt)		(fdt_get_header(fdt, off_dt_strings))
++#define fdt_off_mem_rsvmap(fdt)		(fdt_get_header(fdt, off_mem_rsvmap))
++#define fdt_version(fdt)		(fdt_get_header(fdt, version))
++#define fdt_last_comp_version(fdt)	(fdt_get_header(fdt, last_comp_versi=
on))
++#define fdt_boot_cpuid_phys(fdt)	(fdt_get_header(fdt, boot_cpuid_phys))
++#define fdt_size_dt_strings(fdt)	(fdt_get_header(fdt, size_dt_strings))
++#define fdt_size_dt_struct(fdt)		(fdt_get_header(fdt, size_dt_struct))
++
++#define fdt_set_hdr_(name) \
++	static inline void fdt_set_##name(void *fdt, uint32_t val) \
++	{ \
++		struct fdt_header *fdth =3D (struct fdt_header *)fdt; \
++		fdth->name =3D cpu_to_fdt32(val); \
++	}
++fdt_set_hdr_(magic);
++fdt_set_hdr_(totalsize);
++fdt_set_hdr_(off_dt_struct);
++fdt_set_hdr_(off_dt_strings);
++fdt_set_hdr_(off_mem_rsvmap);
++fdt_set_hdr_(version);
++fdt_set_hdr_(last_comp_version);
++fdt_set_hdr_(boot_cpuid_phys);
++fdt_set_hdr_(size_dt_strings);
++fdt_set_hdr_(size_dt_struct);
++#undef fdt_set_hdr_
++
++/**
++ * fdt_header_size - return the size of the tree's header
++ * @fdt: pointer to a flattened device tree
++ *
++ * Return: size of DTB header in bytes
++ */
++size_t fdt_header_size(const void *fdt);
++
++/**
++ * fdt_header_size_ - internal function to get header size from a versi=
on number
++ * @version: devicetree version number
++ *
++ * Return: size of DTB header in bytes
++ */
++size_t fdt_header_size_(uint32_t version);
++
++/**
++ * fdt_check_header - sanity check a device tree header
++ * @fdt: pointer to data which might be a flattened device tree
++ *
++ * fdt_check_header() checks that the given buffer contains what
++ * appears to be a flattened device tree, and that the header contains
++ * valid information (to the extent that can be determined from the
++ * header alone).
++ *
++ * returns:
++ *     0, if the buffer appears to contain a valid device tree
++ *     -FDT_ERR_BADMAGIC,
++ *     -FDT_ERR_BADVERSION,
++ *     -FDT_ERR_BADSTATE,
++ *     -FDT_ERR_TRUNCATED, standard meanings, as above
++ */
++int fdt_check_header(const void *fdt);
++
++/**
++ * fdt_move - move a device tree around in memory
++ * @fdt: pointer to the device tree to move
++ * @buf: pointer to memory where the device is to be moved
++ * @bufsize: size of the memory space at buf
++ *
++ * fdt_move() relocates, if possible, the device tree blob located at
++ * fdt to the buffer at buf of size bufsize.  The buffer may overlap
++ * with the existing device tree blob at fdt.  Therefore,
++ *     fdt_move(fdt, fdt, fdt_totalsize(fdt))
++ * should always succeed.
++ *
++ * returns:
++ *     0, on success
++ *     -FDT_ERR_NOSPACE, bufsize is insufficient to contain the device =
tree
++ *     -FDT_ERR_BADMAGIC,
++ *     -FDT_ERR_BADVERSION,
++ *     -FDT_ERR_BADSTATE, standard meanings
++ */
++int fdt_move(const void *fdt, void *buf, int bufsize);
++
++/**********************************************************************=
/
++/* Read-only functions                                                *=
/
++/**********************************************************************=
/
++
++int fdt_check_full(const void *fdt, size_t bufsize);
++
++/**
++ * fdt_get_string - retrieve a string from the strings block of a devic=
e tree
++ * @fdt: pointer to the device tree blob
++ * @stroffset: offset of the string within the strings block (native en=
dian)
++ * @lenp: optional pointer to return the string's length
++ *
++ * fdt_get_string() retrieves a pointer to a single string from the
++ * strings block of the device tree blob at fdt, and optionally also
++ * returns the string's length in *lenp.
++ *
++ * returns:
++ *     a pointer to the string, on success
++ *     NULL, if stroffset is out of bounds, or doesn't point to a valid=
 string
++ */
++const char *fdt_get_string(const void *fdt, int stroffset, int *lenp);
++
++/**
++ * fdt_string - retrieve a string from the strings block of a device tr=
ee
++ * @fdt: pointer to the device tree blob
++ * @stroffset: offset of the string within the strings block (native en=
dian)
++ *
++ * fdt_string() retrieves a pointer to a single string from the
++ * strings block of the device tree blob at fdt.
++ *
++ * returns:
++ *     a pointer to the string, on success
++ *     NULL, if stroffset is out of bounds, or doesn't point to a valid=
 string
++ */
++const char *fdt_string(const void *fdt, int stroffset);
++
++/**
++ * fdt_find_max_phandle - find and return the highest phandle in a tree
++ * @fdt: pointer to the device tree blob
++ * @phandle: return location for the highest phandle value found in the=
 tree
++ *
++ * fdt_find_max_phandle() finds the highest phandle value in the given =
device
++ * tree. The value returned in @phandle is only valid if the function r=
eturns
++ * success.
++ *
++ * returns:
++ *     0 on success or a negative error code on failure
++ */
++int fdt_find_max_phandle(const void *fdt, uint32_t *phandle);
++
++/**
++ * fdt_get_max_phandle - retrieves the highest phandle in a tree
++ * @fdt: pointer to the device tree blob
++ *
++ * fdt_get_max_phandle retrieves the highest phandle in the given
++ * device tree. This will ignore badly formatted phandles, or phandles
++ * with a value of 0 or -1.
++ *
++ * This function is deprecated in favour of fdt_find_max_phandle().
++ *
++ * returns:
++ *      the highest phandle on success
++ *      0, if no phandle was found in the device tree
++ *      -1, if an error occurred
++ */
++static inline uint32_t fdt_get_max_phandle(const void *fdt)
++{
++	uint32_t phandle;
++	int err;
++
++	err =3D fdt_find_max_phandle(fdt, &phandle);
++	if (err < 0)
++		return (uint32_t)-1;
++
++	return phandle;
++}
++
++/**
++ * fdt_generate_phandle - return a new, unused phandle for a device tre=
e blob
++ * @fdt: pointer to the device tree blob
++ * @phandle: return location for the new phandle
++ *
++ * Walks the device tree blob and looks for the highest phandle value. =
On
++ * success, the new, unused phandle value (one higher than the previous=
ly
++ * highest phandle value in the device tree blob) will be returned in t=
he
++ * @phandle parameter.
++ *
++ * Return: 0 on success or a negative error-code on failure
++ */
++int fdt_generate_phandle(const void *fdt, uint32_t *phandle);
++
++/**
++ * fdt_num_mem_rsv - retrieve the number of memory reserve map entries
++ * @fdt: pointer to the device tree blob
++ *
++ * Returns the number of entries in the device tree blob's memory
++ * reservation map.  This does not include the terminating 0,0 entry
++ * or any other (0,0) entries reserved for expansion.
++ *
++ * returns:
++ *     the number of entries
++ */
++int fdt_num_mem_rsv(const void *fdt);
++
++/**
++ * fdt_get_mem_rsv - retrieve one memory reserve map entry
++ * @fdt: pointer to the device tree blob
++ * @n: index of reserve map entry
++ * @address: pointer to 64-bit variable to hold the start address
++ * @size: pointer to 64-bit variable to hold the size of the entry
++ *
++ * On success, @address and @size will contain the address and size of
++ * the n-th reserve map entry from the device tree blob, in
++ * native-endian format.
++ *
++ * returns:
++ *     0, on success
++ *     -FDT_ERR_BADMAGIC,
++ *     -FDT_ERR_BADVERSION,
++ *     -FDT_ERR_BADSTATE, standard meanings
++ */
++int fdt_get_mem_rsv(const void *fdt, int n, uint64_t *address, uint64_t=
 *size);
++
++/**
++ * fdt_subnode_offset_namelen - find a subnode based on substring
++ * @fdt: pointer to the device tree blob
++ * @parentoffset: structure block offset of a node
++ * @name: name of the subnode to locate
++ * @namelen: number of characters of name to consider
++ *
++ * Identical to fdt_subnode_offset(), but only examine the first
++ * namelen characters of name for matching the subnode name.  This is
++ * useful for finding subnodes based on a portion of a larger string,
++ * such as a full path.
++ *
++ * Return: offset of the subnode or -FDT_ERR_NOTFOUND if name not found=
.
++ */
++#ifndef SWIG /* Not available in Python */
++int fdt_subnode_offset_namelen(const void *fdt, int parentoffset,
++			       const char *name, int namelen);
++#endif
++/**
++ * fdt_subnode_offset - find a subnode of a given node
++ * @fdt: pointer to the device tree blob
++ * @parentoffset: structure block offset of a node
++ * @name: name of the subnode to locate
++ *
++ * fdt_subnode_offset() finds a subnode of the node at structure block
++ * offset parentoffset with the given name.  name may include a unit
++ * address, in which case fdt_subnode_offset() will find the subnode
++ * with that unit address, or the unit address may be omitted, in
++ * which case fdt_subnode_offset() will find an arbitrary subnode
++ * whose name excluding unit address matches the given name.
++ *
++ * returns:
++ *	structure block offset of the requested subnode (>=3D0), on success
++ *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
++ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NO=
DE
++ *		tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings.
++ */
++int fdt_subnode_offset(const void *fdt, int parentoffset, const char *n=
ame);
++
++/**
++ * fdt_path_offset_namelen - find a tree node by its full path
++ * @fdt: pointer to the device tree blob
++ * @path: full path of the node to locate
++ * @namelen: number of characters of path to consider
++ *
++ * Identical to fdt_path_offset(), but only consider the first namelen
++ * characters of path as the path name.
++ *
++ * Return: offset of the node or negative libfdt error value otherwise
++ */
++#ifndef SWIG /* Not available in Python */
++int fdt_path_offset_namelen(const void *fdt, const char *path, int name=
len);
++#endif
++
++/**
++ * fdt_path_offset - find a tree node by its full path
++ * @fdt: pointer to the device tree blob
++ * @path: full path of the node to locate
++ *
++ * fdt_path_offset() finds a node of a given path in the device tree.
++ * Each path component may omit the unit address portion, but the
++ * results of this are undefined if any such path component is
++ * ambiguous (that is if there are multiple nodes at the relevant
++ * level matching the given component, differentiated only by unit
++ * address).
++ *
++ * returns:
++ *	structure block offset of the node with the requested path (>=3D0), =
on
++ *		success
++ *	-FDT_ERR_BADPATH, given path does not begin with '/' or is invalid
++ *	-FDT_ERR_NOTFOUND, if the requested node does not exist
++ *      -FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings.
++ */
++int fdt_path_offset(const void *fdt, const char *path);
++
++/**
++ * fdt_get_name - retrieve the name of a given node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: structure block offset of the starting node
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * fdt_get_name() retrieves the name (including unit address) of the
++ * device tree node at structure block offset nodeoffset.  If lenp is
++ * non-NULL, the length of this name is also returned, in the integer
++ * pointed to by lenp.
++ *
++ * returns:
++ *	pointer to the node's name, on success
++ *		If lenp is non-NULL, *lenp contains the length of that name
++ *			(>=3D0)
++ *	NULL, on error
++ *		if lenp is non-NULL *lenp contains an error code (<0):
++ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
++ *			tag
++ *		-FDT_ERR_BADMAGIC,
++ *		-FDT_ERR_BADVERSION,
++ *		-FDT_ERR_BADSTATE, standard meanings
++ */
++const char *fdt_get_name(const void *fdt, int nodeoffset, int *lenp);
++
++/**
++ * fdt_first_property_offset - find the offset of a node's first proper=
ty
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: structure block offset of a node
++ *
++ * fdt_first_property_offset() finds the first property of the node at
++ * the given structure block offset.
++ *
++ * returns:
++ *	structure block offset of the property (>=3D0), on success
++ *	-FDT_ERR_NOTFOUND, if the requested node has no properties
++ *	-FDT_ERR_BADOFFSET, if nodeoffset did not point to an FDT_BEGIN_NODE=
 tag
++ *      -FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings.
++ */
++int fdt_first_property_offset(const void *fdt, int nodeoffset);
++
++/**
++ * fdt_next_property_offset - step through a node's properties
++ * @fdt: pointer to the device tree blob
++ * @offset: structure block offset of a property
++ *
++ * fdt_next_property_offset() finds the property immediately after the
++ * one at the given structure block offset.  This will be a property
++ * of the same node as the given property.
++ *
++ * returns:
++ *	structure block offset of the next property (>=3D0), on success
++ *	-FDT_ERR_NOTFOUND, if the given property is the last in its node
++ *	-FDT_ERR_BADOFFSET, if nodeoffset did not point to an FDT_PROP tag
++ *      -FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings.
++ */
++int fdt_next_property_offset(const void *fdt, int offset);
++
++/**
++ * fdt_for_each_property_offset - iterate over all properties of a node
++ *
++ * @property:	property offset (int, lvalue)
++ * @fdt:	FDT blob (const void *)
++ * @node:	node offset (int)
++ *
++ * This is actually a wrapper around a for loop and would be used like =
so:
++ *
++ *	fdt_for_each_property_offset(property, fdt, node) {
++ *		Use property
++ *		...
++ *	}
++ *
++ *	if ((property < 0) && (property !=3D -FDT_ERR_NOTFOUND)) {
++ *		Error handling
++ *	}
++ *
++ * Note that this is implemented as a macro and property is used as
++ * iterator in the loop. The node variable can be constant or even a
++ * literal.
++ */
++#define fdt_for_each_property_offset(property, fdt, node)	\
++	for (property =3D fdt_first_property_offset(fdt, node);	\
++	     property >=3D 0;					\
++	     property =3D fdt_next_property_offset(fdt, property))
++
++/**
++ * fdt_get_property_by_offset - retrieve the property at a given offset
++ * @fdt: pointer to the device tree blob
++ * @offset: offset of the property to retrieve
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * fdt_get_property_by_offset() retrieves a pointer to the
++ * fdt_property structure within the device tree blob at the given
++ * offset.  If lenp is non-NULL, the length of the property value is
++ * also returned, in the integer pointed to by lenp.
++ *
++ * Note that this code only works on device tree versions >=3D 16. fdt_=
getprop()
++ * works on all versions.
++ *
++ * returns:
++ *	pointer to the structure representing the property
++ *		if lenp is non-NULL, *lenp contains the length of the property
++ *		value (>=3D0)
++ *	NULL, on error
++ *		if lenp is non-NULL, *lenp contains an error code (<0):
++ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_PROP tag
++ *		-FDT_ERR_BADMAGIC,
++ *		-FDT_ERR_BADVERSION,
++ *		-FDT_ERR_BADSTATE,
++ *		-FDT_ERR_BADSTRUCTURE,
++ *		-FDT_ERR_TRUNCATED, standard meanings
++ */
++const struct fdt_property *fdt_get_property_by_offset(const void *fdt,
++						      int offset,
++						      int *lenp);
++
++/**
++ * fdt_get_property_namelen - find a property based on substring
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to find
++ * @name: name of the property to find
++ * @namelen: number of characters of name to consider
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * Identical to fdt_get_property(), but only examine the first namelen
++ * characters of name for matching the property name.
++ *
++ * Return: pointer to the structure representing the property, or NULL
++ *         if not found
++ */
++#ifndef SWIG /* Not available in Python */
++const struct fdt_property *fdt_get_property_namelen(const void *fdt,
++						    int nodeoffset,
++						    const char *name,
++						    int namelen, int *lenp);
++#endif
++
++/**
++ * fdt_get_property - find a given property in a given node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to find
++ * @name: name of the property to find
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * fdt_get_property() retrieves a pointer to the fdt_property
++ * structure within the device tree blob corresponding to the property
++ * named 'name' of the node at offset nodeoffset.  If lenp is
++ * non-NULL, the length of the property value is also returned, in the
++ * integer pointed to by lenp.
++ *
++ * returns:
++ *	pointer to the structure representing the property
++ *		if lenp is non-NULL, *lenp contains the length of the property
++ *		value (>=3D0)
++ *	NULL, on error
++ *		if lenp is non-NULL, *lenp contains an error code (<0):
++ *		-FDT_ERR_NOTFOUND, node does not have named property
++ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
++ *			tag
++ *		-FDT_ERR_BADMAGIC,
++ *		-FDT_ERR_BADVERSION,
++ *		-FDT_ERR_BADSTATE,
++ *		-FDT_ERR_BADSTRUCTURE,
++ *		-FDT_ERR_TRUNCATED, standard meanings
++ */
++const struct fdt_property *fdt_get_property(const void *fdt, int nodeof=
fset,
++					    const char *name, int *lenp);
++static inline struct fdt_property *fdt_get_property_w(void *fdt, int no=
deoffset,
++						      const char *name,
++						      int *lenp)
++{
++	return (struct fdt_property *)(uintptr_t)
++		fdt_get_property(fdt, nodeoffset, name, lenp);
++}
++
++/**
++ * fdt_getprop_by_offset - retrieve the value of a property at a given =
offset
++ * @fdt: pointer to the device tree blob
++ * @offset: offset of the property to read
++ * @namep: pointer to a string variable (will be overwritten) or NULL
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * fdt_getprop_by_offset() retrieves a pointer to the value of the
++ * property at structure block offset 'offset' (this will be a pointer
++ * to within the device blob itself, not a copy of the value).  If
++ * lenp is non-NULL, the length of the property value is also
++ * returned, in the integer pointed to by lenp.  If namep is non-NULL,
++ * the property's namne will also be returned in the char * pointed to
++ * by namep (this will be a pointer to within the device tree's string
++ * block, not a new copy of the name).
++ *
++ * returns:
++ *	pointer to the property's value
++ *		if lenp is non-NULL, *lenp contains the length of the property
++ *		value (>=3D0)
++ *		if namep is non-NULL *namep contiains a pointer to the property
++ *		name.
++ *	NULL, on error
++ *		if lenp is non-NULL, *lenp contains an error code (<0):
++ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_PROP tag
++ *		-FDT_ERR_BADMAGIC,
++ *		-FDT_ERR_BADVERSION,
++ *		-FDT_ERR_BADSTATE,
++ *		-FDT_ERR_BADSTRUCTURE,
++ *		-FDT_ERR_TRUNCATED, standard meanings
++ */
++#ifndef SWIG /* This function is not useful in Python */
++const void *fdt_getprop_by_offset(const void *fdt, int offset,
++				  const char **namep, int *lenp);
++#endif
++
++/**
++ * fdt_getprop_namelen - get property value based on substring
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to find
++ * @name: name of the property to find
++ * @namelen: number of characters of name to consider
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * Identical to fdt_getprop(), but only examine the first namelen
++ * characters of name for matching the property name.
++ *
++ * Return: pointer to the property's value or NULL on error
++ */
++#ifndef SWIG /* Not available in Python */
++const void *fdt_getprop_namelen(const void *fdt, int nodeoffset,
++				const char *name, int namelen, int *lenp);
++static inline void *fdt_getprop_namelen_w(void *fdt, int nodeoffset,
++					  const char *name, int namelen,
++					  int *lenp)
++{
++	return (void *)(uintptr_t)fdt_getprop_namelen(fdt, nodeoffset, name,
++						      namelen, lenp);
++}
++#endif
++
++/**
++ * fdt_getprop - retrieve the value of a given property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to find
++ * @name: name of the property to find
++ * @lenp: pointer to an integer variable (will be overwritten) or NULL
++ *
++ * fdt_getprop() retrieves a pointer to the value of the property
++ * named @name of the node at offset @nodeoffset (this will be a
++ * pointer to within the device blob itself, not a copy of the value).
++ * If @lenp is non-NULL, the length of the property value is also
++ * returned, in the integer pointed to by @lenp.
++ *
++ * returns:
++ *	pointer to the property's value
++ *		if lenp is non-NULL, *lenp contains the length of the property
++ *		value (>=3D0)
++ *	NULL, on error
++ *		if lenp is non-NULL, *lenp contains an error code (<0):
++ *		-FDT_ERR_NOTFOUND, node does not have named property
++ *		-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE
++ *			tag
++ *		-FDT_ERR_BADMAGIC,
++ *		-FDT_ERR_BADVERSION,
++ *		-FDT_ERR_BADSTATE,
++ *		-FDT_ERR_BADSTRUCTURE,
++ *		-FDT_ERR_TRUNCATED, standard meanings
++ */
++const void *fdt_getprop(const void *fdt, int nodeoffset,
++			const char *name, int *lenp);
++static inline void *fdt_getprop_w(void *fdt, int nodeoffset,
++				  const char *name, int *lenp)
++{
++	return (void *)(uintptr_t)fdt_getprop(fdt, nodeoffset, name, lenp);
++}
++
++/**
++ * fdt_get_phandle - retrieve the phandle of a given node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: structure block offset of the node
++ *
++ * fdt_get_phandle() retrieves the phandle of the device tree node at
++ * structure block offset nodeoffset.
++ *
++ * returns:
++ *	the phandle of the node at nodeoffset, on success (!=3D 0, !=3D -1)
++ *	0, if the node has no phandle, or another error occurs
++ */
++uint32_t fdt_get_phandle(const void *fdt, int nodeoffset);
++
++/**
++ * fdt_get_alias_namelen - get alias based on substring
++ * @fdt: pointer to the device tree blob
++ * @name: name of the alias th look up
++ * @namelen: number of characters of name to consider
++ *
++ * Identical to fdt_get_alias(), but only examine the first @namelen
++ * characters of @name for matching the alias name.
++ *
++ * Return: a pointer to the expansion of the alias named @name, if it e=
xists,
++ *	   NULL otherwise
++ */
++#ifndef SWIG /* Not available in Python */
++const char *fdt_get_alias_namelen(const void *fdt,
++				  const char *name, int namelen);
++#endif
++
++/**
++ * fdt_get_alias - retrieve the path referenced by a given alias
++ * @fdt: pointer to the device tree blob
++ * @name: name of the alias th look up
++ *
++ * fdt_get_alias() retrieves the value of a given alias.  That is, the
++ * value of the property named @name in the node /aliases.
++ *
++ * returns:
++ *	a pointer to the expansion of the alias named 'name', if it exists
++ *	NULL, if the given alias or the /aliases node does not exist
++ */
++const char *fdt_get_alias(const void *fdt, const char *name);
++
++/**
++ * fdt_get_path - determine the full path of a node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose path to find
++ * @buf: character buffer to contain the returned path (will be overwri=
tten)
++ * @buflen: size of the character buffer at buf
++ *
++ * fdt_get_path() computes the full path of the node at offset
++ * nodeoffset, and records that path in the buffer at buf.
++ *
++ * NOTE: This function is expensive, as it must scan the device tree
++ * structure from the start to nodeoffset.
++ *
++ * returns:
++ *	0, on success
++ *		buf contains the absolute path of the node at
++ *		nodeoffset, as a NUL-terminated string.
++ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_NOSPACE, the path of the given node is longer than (bufsize=
-1)
++ *		characters and will not fit in the given buffer.
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_get_path(const void *fdt, int nodeoffset, char *buf, int buflen=
);
++
++/**
++ * fdt_supernode_atdepth_offset - find a specific ancestor of a node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose parent to find
++ * @supernodedepth: depth of the ancestor to find
++ * @nodedepth: pointer to an integer variable (will be overwritten) or =
NULL
++ *
++ * fdt_supernode_atdepth_offset() finds an ancestor of the given node
++ * at a specific depth from the root (where the root itself has depth
++ * 0, its immediate subnodes depth 1 and so forth).  So
++ *	fdt_supernode_atdepth_offset(fdt, nodeoffset, 0, NULL);
++ * will always return 0, the offset of the root node.  If the node at
++ * nodeoffset has depth D, then:
++ *	fdt_supernode_atdepth_offset(fdt, nodeoffset, D, NULL);
++ * will return nodeoffset itself.
++ *
++ * NOTE: This function is expensive, as it must scan the device tree
++ * structure from the start to nodeoffset.
++ *
++ * returns:
++ *	structure block offset of the node at node offset's ancestor
++ *		of depth supernodedepth (>=3D0), on success
++ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_NOTFOUND, supernodedepth was greater than the depth of
++ *		nodeoffset
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_supernode_atdepth_offset(const void *fdt, int nodeoffset,
++				 int supernodedepth, int *nodedepth);
++
++/**
++ * fdt_node_depth - find the depth of a given node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose parent to find
++ *
++ * fdt_node_depth() finds the depth of a given node.  The root node
++ * has depth 0, its immediate subnodes depth 1 and so forth.
++ *
++ * NOTE: This function is expensive, as it must scan the device tree
++ * structure from the start to nodeoffset.
++ *
++ * returns:
++ *	depth of the node at nodeoffset (>=3D0), on success
++ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_node_depth(const void *fdt, int nodeoffset);
++
++/**
++ * fdt_parent_offset - find the parent of a given node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose parent to find
++ *
++ * fdt_parent_offset() locates the parent node of a given node (that
++ * is, it finds the offset of the node which contains the node at
++ * nodeoffset as a subnode).
++ *
++ * NOTE: This function is expensive, as it must scan the device tree
++ * structure from the start to nodeoffset, *twice*.
++ *
++ * returns:
++ *	structure block offset of the parent of the node at nodeoffset
++ *		(>=3D0), on success
++ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_parent_offset(const void *fdt, int nodeoffset);
++
++/**
++ * fdt_node_offset_by_prop_value - find nodes with a given property val=
ue
++ * @fdt: pointer to the device tree blob
++ * @startoffset: only find nodes after this offset
++ * @propname: property name to check
++ * @propval: property value to search for
++ * @proplen: length of the value in propval
++ *
++ * fdt_node_offset_by_prop_value() returns the offset of the first
++ * node after startoffset, which has a property named propname whose
++ * value is of length proplen and has value equal to propval; or if
++ * startoffset is -1, the very first such node in the tree.
++ *
++ * To iterate through all nodes matching the criterion, the following
++ * idiom can be used:
++ *	offset =3D fdt_node_offset_by_prop_value(fdt, -1, propname,
++ *					       propval, proplen);
++ *	while (offset !=3D -FDT_ERR_NOTFOUND) {
++ *		// other code here
++ *		offset =3D fdt_node_offset_by_prop_value(fdt, offset, propname,
++ *						       propval, proplen);
++ *	}
++ *
++ * Note the -1 in the first call to the function, if 0 is used here
++ * instead, the function will never locate the root node, even if it
++ * matches the criterion.
++ *
++ * returns:
++ *	structure block offset of the located node (>=3D 0, >startoffset),
++ *		 on success
++ *	-FDT_ERR_NOTFOUND, no node matching the criterion exists in the
++ *		tree after startoffset
++ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_node_offset_by_prop_value(const void *fdt, int startoffset,
++				  const char *propname,
++				  const void *propval, int proplen);
++
++/**
++ * fdt_node_offset_by_phandle - find the node with a given phandle
++ * @fdt: pointer to the device tree blob
++ * @phandle: phandle value
++ *
++ * fdt_node_offset_by_phandle() returns the offset of the node
++ * which has the given phandle value.  If there is more than one node
++ * in the tree with the given phandle (an invalid tree), results are
++ * undefined.
++ *
++ * returns:
++ *	structure block offset of the located node (>=3D 0), on success
++ *	-FDT_ERR_NOTFOUND, no node with that phandle exists
++ *	-FDT_ERR_BADPHANDLE, given phandle value was invalid (0 or -1)
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_node_offset_by_phandle(const void *fdt, uint32_t phandle);
++
++/**
++ * fdt_node_check_compatible - check a node's compatible property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of a tree node
++ * @compatible: string to match against
++ *
++ * fdt_node_check_compatible() returns 0 if the given node contains a
++ * @compatible property with the given string as one of its elements,
++ * it returns non-zero otherwise, or on error.
++ *
++ * returns:
++ *	0, if the node has a 'compatible' property listing the given string
++ *	1, if the node has a 'compatible' property, but it does not list
++ *		the given string
++ *	-FDT_ERR_NOTFOUND, if the given node has no 'compatible' property
++ *	-FDT_ERR_BADOFFSET, if nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_node_check_compatible(const void *fdt, int nodeoffset,
++			      const char *compatible);
++
++/**
++ * fdt_node_offset_by_compatible - find nodes with a given 'compatible'=
 value
++ * @fdt: pointer to the device tree blob
++ * @startoffset: only find nodes after this offset
++ * @compatible: 'compatible' string to match against
++ *
++ * fdt_node_offset_by_compatible() returns the offset of the first
++ * node after startoffset, which has a 'compatible' property which
++ * lists the given compatible string; or if startoffset is -1, the
++ * very first such node in the tree.
++ *
++ * To iterate through all nodes matching the criterion, the following
++ * idiom can be used:
++ *	offset =3D fdt_node_offset_by_compatible(fdt, -1, compatible);
++ *	while (offset !=3D -FDT_ERR_NOTFOUND) {
++ *		// other code here
++ *		offset =3D fdt_node_offset_by_compatible(fdt, offset, compatible);
++ *	}
++ *
++ * Note the -1 in the first call to the function, if 0 is used here
++ * instead, the function will never locate the root node, even if it
++ * matches the criterion.
++ *
++ * returns:
++ *	structure block offset of the located node (>=3D 0, >startoffset),
++ *		 on success
++ *	-FDT_ERR_NOTFOUND, no node matching the criterion exists in the
++ *		tree after startoffset
++ *	-FDT_ERR_BADOFFSET, nodeoffset does not refer to a BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE, standard meanings
++ */
++int fdt_node_offset_by_compatible(const void *fdt, int startoffset,
++				  const char *compatible);
++
++/**
++ * fdt_stringlist_contains - check a string list property for a string
++ * @strlist: Property containing a list of strings to check
++ * @listlen: Length of property
++ * @str: String to search for
++ *
++ * This is a utility function provided for convenience. The list contai=
ns
++ * one or more strings, each terminated by \0, as is found in a device =
tree
++ * "compatible" property.
++ *
++ * Return: 1 if the string is found in the list, 0 not found, or invali=
d list
++ */
++int fdt_stringlist_contains(const char *strlist, int listlen, const cha=
r *str);
++
++/**
++ * fdt_stringlist_count - count the number of strings in a string list
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of a tree node
++ * @property: name of the property containing the string list
++ *
++ * Return:
++ *   the number of strings in the given property
++ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
++ *   -FDT_ERR_NOTFOUND if the property does not exist
++ */
++int fdt_stringlist_count(const void *fdt, int nodeoffset, const char *p=
roperty);
++
++/**
++ * fdt_stringlist_search - find a string in a string list and return it=
s index
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of a tree node
++ * @property: name of the property containing the string list
++ * @string: string to look up in the string list
++ *
++ * Note that it is possible for this function to succeed on property va=
lues
++ * that are not NUL-terminated. That's because the function will stop a=
fter
++ * finding the first occurrence of @string. This can for example happen=
 with
++ * small-valued cell properties, such as #address-cells, when searching=
 for
++ * the empty string.
++ *
++ * return:
++ *   the index of the string in the list of strings
++ *   -FDT_ERR_BADVALUE if the property value is not NUL-terminated
++ *   -FDT_ERR_NOTFOUND if the property does not exist or does not conta=
in
++ *                     the given string
++ */
++int fdt_stringlist_search(const void *fdt, int nodeoffset, const char *=
property,
++			  const char *string);
++
++/**
++ * fdt_stringlist_get() - obtain the string at a given index in a strin=
g list
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of a tree node
++ * @property: name of the property containing the string list
++ * @index: index of the string to return
++ * @lenp: return location for the string length or an error code on fai=
lure
++ *
++ * Note that this will successfully extract strings from properties wit=
h
++ * non-NUL-terminated values. For example on small-valued cell properti=
es
++ * this function will return the empty string.
++ *
++ * If non-NULL, the length of the string (on success) or a negative err=
or-code
++ * (on failure) will be stored in the integer pointer to by lenp.
++ *
++ * Return:
++ *   A pointer to the string at the given index in the string list or N=
ULL on
++ *   failure. On success the length of the string will be stored in the=
 memory
++ *   location pointed to by the lenp parameter, if non-NULL. On failure=
 one of
++ *   the following negative error codes will be returned in the lenp pa=
rameter
++ *   (if non-NULL):
++ *     -FDT_ERR_BADVALUE if the property value is not NUL-terminated
++ *     -FDT_ERR_NOTFOUND if the property does not exist
++ */
++const char *fdt_stringlist_get(const void *fdt, int nodeoffset,
++			       const char *property, int index,
++			       int *lenp);
++
++/**********************************************************************=
/
++/* Read-only functions (addressing related)                           *=
/
++/**********************************************************************=
/
++
++/**
++ * FDT_MAX_NCELLS - maximum value for #address-cells and #size-cells
++ *
++ * This is the maximum value for #address-cells, #size-cells and
++ * similar properties that will be processed by libfdt.  IEE1275
++ * requires that OF implementations handle values up to 4.
++ * Implementations may support larger values, but in practice higher
++ * values aren't used.
++ */
++#define FDT_MAX_NCELLS		4
++
++/**
++ * fdt_address_cells - retrieve address size for a bus represented in t=
he tree
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node to find the address size for
++ *
++ * When the node has a valid #address-cells property, returns its value=
.
++ *
++ * returns:
++ *	0 <=3D n < FDT_MAX_NCELLS, on success
++ *      2, if the node has no #address-cells property
++ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invali=
d
++ *		#address-cells property
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_address_cells(const void *fdt, int nodeoffset);
++
++/**
++ * fdt_size_cells - retrieve address range size for a bus represented i=
n the
++ *                  tree
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node to find the address range size for
++ *
++ * When the node has a valid #size-cells property, returns its value.
++ *
++ * returns:
++ *	0 <=3D n < FDT_MAX_NCELLS, on success
++ *      1, if the node has no #size-cells property
++ *      -FDT_ERR_BADNCELLS, if the node has a badly formatted or invali=
d
++ *		#size-cells property
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_size_cells(const void *fdt, int nodeoffset);
++
++
++/**********************************************************************=
/
++/* Write-in-place functions                                           *=
/
++/**********************************************************************=
/
++
++/**
++ * fdt_setprop_inplace_namelen_partial - change a property's value,
++ *                                       but not its size
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @namelen: number of characters of name to consider
++ * @idx: index of the property to change in the array
++ * @val: pointer to data to replace the property value with
++ * @len: length of the property value
++ *
++ * Identical to fdt_setprop_inplace(), but modifies the given property
++ * starting from the given index, and using only the first characters
++ * of the name. It is useful when you want to manipulate only one value=
 of
++ * an array and you have a string that doesn't end with \0.
++ *
++ * Return: 0 on success, negative libfdt error value otherwise
++ */
++#ifndef SWIG /* Not available in Python */
++int fdt_setprop_inplace_namelen_partial(void *fdt, int nodeoffset,
++					const char *name, int namelen,
++					uint32_t idx, const void *val,
++					int len);
++#endif
++
++/**
++ * fdt_setprop_inplace - change a property's value, but not its size
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: pointer to data to replace the property value with
++ * @len: length of the property value
++ *
++ * fdt_setprop_inplace() replaces the value of a given property with
++ * the data in val, of length len.  This function cannot change the
++ * size of a property, and so will only work if len is equal to the
++ * current length of the property.
++ *
++ * This function will alter only the bytes in the blob which contain
++ * the given property value, and will not alter or move any other part
++ * of the tree.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, if len is not equal to the property's current leng=
th
++ *	-FDT_ERR_NOTFOUND, node does not have the named property
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++#ifndef SWIG /* Not available in Python */
++int fdt_setprop_inplace(void *fdt, int nodeoffset, const char *name,
++			const void *val, int len);
++#endif
++
++/**
++ * fdt_setprop_inplace_u32 - change the value of a 32-bit integer prope=
rty
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 32-bit integer value to replace the property with
++ *
++ * fdt_setprop_inplace_u32() replaces the value of a given property
++ * with the 32-bit integer value in val, converting val to big-endian
++ * if necessary.  This function cannot change the size of a property,
++ * and so will only work if the property already exists and has length
++ * 4.
++ *
++ * This function will alter only the bytes in the blob which contain
++ * the given property value, and will not alter or move any other part
++ * of the tree.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, if the property's length is not equal to 4
++ *	-FDT_ERR_NOTFOUND, node does not have the named property
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++static inline int fdt_setprop_inplace_u32(void *fdt, int nodeoffset,
++					  const char *name, uint32_t val)
++{
++	fdt32_t tmp =3D cpu_to_fdt32(val);
++	return fdt_setprop_inplace(fdt, nodeoffset, name, &tmp, sizeof(tmp));
++}
++
++/**
++ * fdt_setprop_inplace_u64 - change the value of a 64-bit integer prope=
rty
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 64-bit integer value to replace the property with
++ *
++ * fdt_setprop_inplace_u64() replaces the value of a given property
++ * with the 64-bit integer value in val, converting val to big-endian
++ * if necessary.  This function cannot change the size of a property,
++ * and so will only work if the property already exists and has length
++ * 8.
++ *
++ * This function will alter only the bytes in the blob which contain
++ * the given property value, and will not alter or move any other part
++ * of the tree.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, if the property's length is not equal to 8
++ *	-FDT_ERR_NOTFOUND, node does not have the named property
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++static inline int fdt_setprop_inplace_u64(void *fdt, int nodeoffset,
++					  const char *name, uint64_t val)
++{
++	fdt64_t tmp =3D cpu_to_fdt64(val);
++	return fdt_setprop_inplace(fdt, nodeoffset, name, &tmp, sizeof(tmp));
++}
++
++/**
++ * fdt_setprop_inplace_cell - change the value of a single-cell propert=
y
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node containing the property
++ * @name: name of the property to change the value of
++ * @val: new value of the 32-bit cell
++ *
++ * This is an alternative name for fdt_setprop_inplace_u32()
++ * Return: 0 on success, negative libfdt error number otherwise.
++ */
++static inline int fdt_setprop_inplace_cell(void *fdt, int nodeoffset,
++					   const char *name, uint32_t val)
++{
++	return fdt_setprop_inplace_u32(fdt, nodeoffset, name, val);
++}
++
++/**
++ * fdt_nop_property - replace a property with nop tags
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to nop
++ * @name: name of the property to nop
++ *
++ * fdt_nop_property() will replace a given property's representation
++ * in the blob with FDT_NOP tags, effectively removing it from the
++ * tree.
++ *
++ * This function will alter only the bytes in the blob which contain
++ * the property, and will not alter or move any other part of the
++ * tree.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOTFOUND, node does not have the named property
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_nop_property(void *fdt, int nodeoffset, const char *name);
++
++/**
++ * fdt_nop_node - replace a node (subtree) with nop tags
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node to nop
++ *
++ * fdt_nop_node() will replace a given node's representation in the
++ * blob, including all its subnodes, if any, with FDT_NOP tags,
++ * effectively removing it from the tree.
++ *
++ * This function will alter only the bytes in the blob which contain
++ * the node and its properties and subnodes, and will not alter or
++ * move any other part of the tree.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_nop_node(void *fdt, int nodeoffset);
++
++/**********************************************************************=
/
++/* Sequential write functions                                         *=
/
++/**********************************************************************=
/
++
++/* fdt_create_with_flags flags */
++#define FDT_CREATE_FLAG_NO_NAME_DEDUP 0x1
++	/* FDT_CREATE_FLAG_NO_NAME_DEDUP: Do not try to de-duplicate property
++	 * names in the fdt. This can result in faster creation times, but
++	 * a larger fdt. */
++
++#define FDT_CREATE_FLAGS_ALL	(FDT_CREATE_FLAG_NO_NAME_DEDUP)
++
++/**
++ * fdt_create_with_flags - begin creation of a new fdt
++ * @buf: pointer to memory allocated where fdt will be created
++ * @bufsize: size of the memory space at fdt
++ * @flags: a valid combination of FDT_CREATE_FLAG_ flags, or 0.
++ *
++ * fdt_create_with_flags() begins the process of creating a new fdt wit=
h
++ * the sequential write interface.
++ *
++ * fdt creation process must end with fdt_finished() to produce a valid=
 fdt.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, bufsize is insufficient for a minimal fdt
++ *	-FDT_ERR_BADFLAGS, flags is not valid
++ */
++int fdt_create_with_flags(void *buf, int bufsize, uint32_t flags);
++
++/**
++ * fdt_create - begin creation of a new fdt
++ * @buf: pointer to memory allocated where fdt will be created
++ * @bufsize: size of the memory space at fdt
++ *
++ * fdt_create() is equivalent to fdt_create_with_flags() with flags=3D0=
.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, bufsize is insufficient for a minimal fdt
++ */
++int fdt_create(void *buf, int bufsize);
++
++int fdt_resize(void *fdt, void *buf, int bufsize);
++int fdt_add_reservemap_entry(void *fdt, uint64_t addr, uint64_t size);
++int fdt_finish_reservemap(void *fdt);
++int fdt_begin_node(void *fdt, const char *name);
++int fdt_property(void *fdt, const char *name, const void *val, int len)=
;
++static inline int fdt_property_u32(void *fdt, const char *name, uint32_=
t val)
++{
++	fdt32_t tmp =3D cpu_to_fdt32(val);
++	return fdt_property(fdt, name, &tmp, sizeof(tmp));
++}
++static inline int fdt_property_u64(void *fdt, const char *name, uint64_=
t val)
++{
++	fdt64_t tmp =3D cpu_to_fdt64(val);
++	return fdt_property(fdt, name, &tmp, sizeof(tmp));
++}
++
++#ifndef SWIG /* Not available in Python */
++static inline int fdt_property_cell(void *fdt, const char *name, uint32=
_t val)
++{
++	return fdt_property_u32(fdt, name, val);
++}
++#endif
++
++/**
++ * fdt_property_placeholder - add a new property and return a ptr to it=
s value
++ *
++ * @fdt: pointer to the device tree blob
++ * @name: name of property to add
++ * @len: length of property value in bytes
++ * @valp: returns a pointer to where where the value should be placed
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_NOSPACE, standard meanings
++ */
++int fdt_property_placeholder(void *fdt, const char *name, int len, void=
 **valp);
++
++#define fdt_property_string(fdt, name, str) \
++	fdt_property(fdt, name, str, strlen(str)+1)
++int fdt_end_node(void *fdt);
++int fdt_finish(void *fdt);
++
++/**********************************************************************=
/
++/* Read-write functions                                               *=
/
++/**********************************************************************=
/
++
++int fdt_create_empty_tree(void *buf, int bufsize);
++int fdt_open_into(const void *fdt, void *buf, int bufsize);
++int fdt_pack(void *fdt);
++
++/**
++ * fdt_add_mem_rsv - add one memory reserve map entry
++ * @fdt: pointer to the device tree blob
++ * @address: 64-bit start address of the reserve map entry
++ * @size: 64-bit size of the reserved region
++ *
++ * Adds a reserve map entry to the given blob reserving a region at
++ * address address of length size.
++ *
++ * This function will insert data into the reserve map and will
++ * therefore change the indexes of some entries in the table.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new reservation entry
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_add_mem_rsv(void *fdt, uint64_t address, uint64_t size);
++
++/**
++ * fdt_del_mem_rsv - remove a memory reserve map entry
++ * @fdt: pointer to the device tree blob
++ * @n: entry to remove
++ *
++ * fdt_del_mem_rsv() removes the n-th memory reserve map entry from
++ * the blob.
++ *
++ * This function will delete data from the reservation table and will
++ * therefore change the indexes of some entries in the table.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOTFOUND, there is no entry of the given index (i.e. there
++ *		are less than n+1 reserve map entries)
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_del_mem_rsv(void *fdt, int n);
++
++/**
++ * fdt_set_name - change the name of a given node
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: structure block offset of a node
++ * @name: name to give the node
++ *
++ * fdt_set_name() replaces the name (including unit address, if any)
++ * of the given node with the given string.  NOTE: this function can't
++ * efficiently check if the new name is unique amongst the given
++ * node's siblings; results are undefined if this function is invoked
++ * with a name equal to one of the given node's siblings.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob
++ *		to contain the new name
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE, standard meanings
++ */
++int fdt_set_name(void *fdt, int nodeoffset, const char *name);
++
++/**
++ * fdt_setprop - create or change a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: pointer to data to set the property value to
++ * @len: length of the property value
++ *
++ * fdt_setprop() sets the value of the named property in the given
++ * node to the given value and length, creating the property if it
++ * does not already exist.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_setprop(void *fdt, int nodeoffset, const char *name,
++		const void *val, int len);
++
++/**
++ * fdt_setprop_placeholder - allocate space for a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @len: length of the property value
++ * @prop_data: return pointer to property data
++ *
++ * fdt_setprop_placeholer() allocates the named property in the given n=
ode.
++ * If the property exists it is resized. In either case a pointer to th=
e
++ * property data is returned.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_setprop_placeholder(void *fdt, int nodeoffset, const char *name=
,
++			    int len, void **prop_data);
++
++/**
++ * fdt_setprop_u32 - set a property to a 32-bit integer
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 32-bit integer value for the property (native endian)
++ *
++ * fdt_setprop_u32() sets the value of the named property in the given
++ * node to the given 32-bit integer value (converting to big-endian if
++ * necessary), or creates a new property with that value if it does
++ * not already exist.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++static inline int fdt_setprop_u32(void *fdt, int nodeoffset, const char=
 *name,
++				  uint32_t val)
++{
++	fdt32_t tmp =3D cpu_to_fdt32(val);
++	return fdt_setprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
++}
++
++/**
++ * fdt_setprop_u64 - set a property to a 64-bit integer
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 64-bit integer value for the property (native endian)
++ *
++ * fdt_setprop_u64() sets the value of the named property in the given
++ * node to the given 64-bit integer value (converting to big-endian if
++ * necessary), or creates a new property with that value if it does
++ * not already exist.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++static inline int fdt_setprop_u64(void *fdt, int nodeoffset, const char=
 *name,
++				  uint64_t val)
++{
++	fdt64_t tmp =3D cpu_to_fdt64(val);
++	return fdt_setprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
++}
++
++/**
++ * fdt_setprop_cell - set a property to a single cell value
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 32-bit integer value for the property (native endian)
++ *
++ * This is an alternative name for fdt_setprop_u32()
++ *
++ * Return: 0 on success, negative libfdt error value otherwise.
++ */
++static inline int fdt_setprop_cell(void *fdt, int nodeoffset, const cha=
r *name,
++				   uint32_t val)
++{
++	return fdt_setprop_u32(fdt, nodeoffset, name, val);
++}
++
++/**
++ * fdt_setprop_string - set a property to a string value
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @str: string value for the property
++ *
++ * fdt_setprop_string() sets the value of the named property in the
++ * given node to the given string value (using the length of the
++ * string to determine the new length of the property), or creates a
++ * new property with that value if it does not already exist.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++#define fdt_setprop_string(fdt, nodeoffset, name, str) \
++	fdt_setprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
++
++
++/**
++ * fdt_setprop_empty - set a property to an empty value
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ *
++ * fdt_setprop_empty() sets the value of the named property in the
++ * given node to an empty (zero length) value, or creates a new empty
++ * property if it does not already exist.
++ *
++ * This function may insert or delete data from the blob, and will
++ * therefore change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++#define fdt_setprop_empty(fdt, nodeoffset, name) \
++	fdt_setprop((fdt), (nodeoffset), (name), NULL, 0)
++
++/**
++ * fdt_appendprop - append to or create a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to append to
++ * @val: pointer to data to append to the property value
++ * @len: length of the data to append to the property value
++ *
++ * fdt_appendprop() appends the value to the named property in the
++ * given node, creating the property if it does not already exist.
++ *
++ * This function may insert data into the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_appendprop(void *fdt, int nodeoffset, const char *name,
++		   const void *val, int len);
++
++/**
++ * fdt_appendprop_u32 - append a 32-bit integer value to a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 32-bit integer value to append to the property (native endian)
++ *
++ * fdt_appendprop_u32() appends the given 32-bit integer value
++ * (converting to big-endian if necessary) to the value of the named
++ * property in the given node, or creates a new property with that
++ * value if it does not already exist.
++ *
++ * This function may insert data into the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++static inline int fdt_appendprop_u32(void *fdt, int nodeoffset,
++				     const char *name, uint32_t val)
++{
++	fdt32_t tmp =3D cpu_to_fdt32(val);
++	return fdt_appendprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
++}
++
++/**
++ * fdt_appendprop_u64 - append a 64-bit integer value to a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 64-bit integer value to append to the property (native endian)
++ *
++ * fdt_appendprop_u64() appends the given 64-bit integer value
++ * (converting to big-endian if necessary) to the value of the named
++ * property in the given node, or creates a new property with that
++ * value if it does not already exist.
++ *
++ * This function may insert data into the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++static inline int fdt_appendprop_u64(void *fdt, int nodeoffset,
++				     const char *name, uint64_t val)
++{
++	fdt64_t tmp =3D cpu_to_fdt64(val);
++	return fdt_appendprop(fdt, nodeoffset, name, &tmp, sizeof(tmp));
++}
++
++/**
++ * fdt_appendprop_cell - append a single cell value to a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @val: 32-bit integer value to append to the property (native endian)
++ *
++ * This is an alternative name for fdt_appendprop_u32()
++ *
++ * Return: 0 on success, negative libfdt error value otherwise.
++ */
++static inline int fdt_appendprop_cell(void *fdt, int nodeoffset,
++				      const char *name, uint32_t val)
++{
++	return fdt_appendprop_u32(fdt, nodeoffset, name, val);
++}
++
++/**
++ * fdt_appendprop_string - append a string to a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to change
++ * @name: name of the property to change
++ * @str: string value to append to the property
++ *
++ * fdt_appendprop_string() appends the given string to the value of
++ * the named property in the given node, or creates a new property
++ * with that value if it does not already exist.
++ *
++ * This function may insert data into the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain the new property value
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++#define fdt_appendprop_string(fdt, nodeoffset, name, str) \
++	fdt_appendprop((fdt), (nodeoffset), (name), (str), strlen(str)+1)
++
++/**
++ * fdt_appendprop_addrrange - append a address range property
++ * @fdt: pointer to the device tree blob
++ * @parent: offset of the parent node
++ * @nodeoffset: offset of the node to add a property at
++ * @name: name of property
++ * @addr: start address of a given range
++ * @size: size of a given range
++ *
++ * fdt_appendprop_addrrange() appends an address range value (start
++ * address and size) to the value of the named property in the given
++ * node, or creates a new property with that value if it does not
++ * already exist.
++ * If "name" is not specified, a default "reg" is used.
++ * Cell sizes are determined by parent's #address-cells and #size-cells=
.
++ *
++ * This function may insert data into the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADNCELLS, if the node has a badly formatted or invalid
++ *		#address-cells property
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADVALUE, addr or size doesn't fit to respective cells size
++ *	-FDT_ERR_NOSPACE, there is insufficient free space in the blob to
++ *		contain a new property
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_appendprop_addrrange(void *fdt, int parent, int nodeoffset,
++			     const char *name, uint64_t addr, uint64_t size);
++
++/**
++ * fdt_delprop - delete a property
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node whose property to nop
++ * @name: name of the property to nop
++ *
++ * fdt_del_property() will delete the given property.
++ *
++ * This function will delete data from the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOTFOUND, node does not have the named property
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_delprop(void *fdt, int nodeoffset, const char *name);
++
++/**
++ * fdt_add_subnode_namelen - creates a new node based on substring
++ * @fdt: pointer to the device tree blob
++ * @parentoffset: structure block offset of a node
++ * @name: name of the subnode to create
++ * @namelen: number of characters of name to consider
++ *
++ * Identical to fdt_add_subnode(), but use only the first @namelen
++ * characters of @name as the name of the new node.  This is useful for
++ * creating subnodes based on a portion of a larger string, such as a
++ * full path.
++ *
++ * Return: structure block offset of the created subnode (>=3D0),
++ *	   negative libfdt error value otherwise
++ */
++#ifndef SWIG /* Not available in Python */
++int fdt_add_subnode_namelen(void *fdt, int parentoffset,
++			    const char *name, int namelen);
++#endif
++
++/**
++ * fdt_add_subnode - creates a new node
++ * @fdt: pointer to the device tree blob
++ * @parentoffset: structure block offset of a node
++ * @name: name of the subnode to locate
++ *
++ * fdt_add_subnode() creates a new node as a subnode of the node at
++ * structure block offset parentoffset, with the given name (which
++ * should include the unit address, if any).
++ *
++ * This function will insert data into the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	structure block offset of the created nodeequested subnode (>=3D0), =
on
++ *		success
++ *	-FDT_ERR_NOTFOUND, if the requested subnode does not exist
++ *	-FDT_ERR_BADOFFSET, if parentoffset did not point to an FDT_BEGIN_NO=
DE
++ *		tag
++ *	-FDT_ERR_EXISTS, if the node at parentoffset already has a subnode o=
f
++ *		the given name
++ *	-FDT_ERR_NOSPACE, if there is insufficient free space in the
++ *		blob to contain the new node
++ *	-FDT_ERR_NOSPACE
++ *	-FDT_ERR_BADLAYOUT
++ *      -FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings.
++ */
++int fdt_add_subnode(void *fdt, int parentoffset, const char *name);
++
++/**
++ * fdt_del_node - delete a node (subtree)
++ * @fdt: pointer to the device tree blob
++ * @nodeoffset: offset of the node to nop
++ *
++ * fdt_del_node() will remove the given node, including all its
++ * subnodes if any, from the blob.
++ *
++ * This function will delete data from the blob, and will therefore
++ * change the offsets of some existing nodes.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_BADOFFSET, nodeoffset did not point to FDT_BEGIN_NODE tag
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_del_node(void *fdt, int nodeoffset);
++
++/**
++ * fdt_overlay_apply - Applies a DT overlay on a base DT
++ * @fdt: pointer to the base device tree blob
++ * @fdto: pointer to the device tree overlay blob
++ *
++ * fdt_overlay_apply() will apply the given device tree overlay on the
++ * given base device tree.
++ *
++ * Expect the base device tree to be modified, even if the function
++ * returns an error.
++ *
++ * returns:
++ *	0, on success
++ *	-FDT_ERR_NOSPACE, there's not enough space in the base device tree
++ *	-FDT_ERR_NOTFOUND, the overlay points to some inexistant nodes or
++ *		properties in the base DT
++ *	-FDT_ERR_BADPHANDLE,
++ *	-FDT_ERR_BADOVERLAY,
++ *	-FDT_ERR_NOPHANDLES,
++ *	-FDT_ERR_INTERNAL,
++ *	-FDT_ERR_BADLAYOUT,
++ *	-FDT_ERR_BADMAGIC,
++ *	-FDT_ERR_BADOFFSET,
++ *	-FDT_ERR_BADPATH,
++ *	-FDT_ERR_BADVERSION,
++ *	-FDT_ERR_BADSTRUCTURE,
++ *	-FDT_ERR_BADSTATE,
++ *	-FDT_ERR_TRUNCATED, standard meanings
++ */
++int fdt_overlay_apply(void *fdt, void *fdto);
++
++/**
++ * fdt_overlay_target_offset - retrieves the offset of a fragment's tar=
get
++ * @fdt: Base device tree blob
++ * @fdto: Device tree overlay blob
++ * @fragment_offset: node offset of the fragment in the overlay
++ * @pathp: pointer which receives the path of the target (or NULL)
++ *
++ * fdt_overlay_target_offset() retrieves the target offset in the base
++ * device tree of a fragment, no matter how the actual targeting is
++ * done (through a phandle or a path)
++ *
++ * returns:
++ *      the targeted node offset in the base device tree
++ *      Negative error code on error
++ */
++int fdt_overlay_target_offset(const void *fdt, const void *fdto,
++			      int fragment_offset, char const **pathp);
++
++/**********************************************************************=
/
++/* Debugging / informational functions                                *=
/
++/**********************************************************************=
/
++
++const char *fdt_strerror(int errval);
++
++#ifdef __cplusplus
++}
++#endif
++
++#endif /* LIBFDT_H */
+diff --git a/include/libfdt_env.h b/include/libfdt_env.h
+new file mode 100644
+index 0000000..51b31d1
+--- /dev/null
++++ b/include/libfdt_env.h
+@@ -0,0 +1,95 @@
++/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
++#ifndef LIBFDT_ENV_H
++#define LIBFDT_ENV_H
++/*
++ * libfdt - Flat Device Tree manipulation
++ * Copyright (C) 2006 David Gibson, IBM Corporation.
++ * Copyright 2012 Kim Phillips, Freescale Semiconductor.
++ */
++
++#include <stdbool.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <limits.h>
++#include <string.h>
++
++#ifdef __CHECKER__
++#define FDT_FORCE __attribute__((force))
++#define FDT_BITWISE __attribute__((bitwise))
++#else
++#define FDT_FORCE
++#define FDT_BITWISE
++#endif
++
++typedef uint16_t FDT_BITWISE fdt16_t;
++typedef uint32_t FDT_BITWISE fdt32_t;
++typedef uint64_t FDT_BITWISE fdt64_t;
++
++#define EXTRACT_BYTE(x, n)	((unsigned long long)((uint8_t *)&x)[n])
++#define CPU_TO_FDT16(x) ((EXTRACT_BYTE(x, 0) << 8) | EXTRACT_BYTE(x, 1)=
)
++#define CPU_TO_FDT32(x) ((EXTRACT_BYTE(x, 0) << 24) | (EXTRACT_BYTE(x, =
1) << 16) | \
++			 (EXTRACT_BYTE(x, 2) << 8) | EXTRACT_BYTE(x, 3))
++#define CPU_TO_FDT64(x) ((EXTRACT_BYTE(x, 0) << 56) | (EXTRACT_BYTE(x, =
1) << 48) | \
++			 (EXTRACT_BYTE(x, 2) << 40) | (EXTRACT_BYTE(x, 3) << 32) | \
++			 (EXTRACT_BYTE(x, 4) << 24) | (EXTRACT_BYTE(x, 5) << 16) | \
++			 (EXTRACT_BYTE(x, 6) << 8) | EXTRACT_BYTE(x, 7))
++
++static inline uint16_t fdt16_to_cpu(fdt16_t x)
++{
++	return (FDT_FORCE uint16_t)CPU_TO_FDT16(x);
++}
++static inline fdt16_t cpu_to_fdt16(uint16_t x)
++{
++	return (FDT_FORCE fdt16_t)CPU_TO_FDT16(x);
++}
++
++static inline uint32_t fdt32_to_cpu(fdt32_t x)
++{
++	return (FDT_FORCE uint32_t)CPU_TO_FDT32(x);
++}
++static inline fdt32_t cpu_to_fdt32(uint32_t x)
++{
++	return (FDT_FORCE fdt32_t)CPU_TO_FDT32(x);
++}
++
++static inline uint64_t fdt64_to_cpu(fdt64_t x)
++{
++	return (FDT_FORCE uint64_t)CPU_TO_FDT64(x);
++}
++static inline fdt64_t cpu_to_fdt64(uint64_t x)
++{
++	return (FDT_FORCE fdt64_t)CPU_TO_FDT64(x);
++}
++#undef CPU_TO_FDT64
++#undef CPU_TO_FDT32
++#undef CPU_TO_FDT16
++#undef EXTRACT_BYTE
++
++#ifdef __APPLE__
++#include <AvailabilityMacros.h>
++
++/* strnlen() is not available on Mac OS < 10.7 */
++# if !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLOWED <=
 \
++                                         MAC_OS_X_VERSION_10_7)
++
++#define strnlen fdt_strnlen
++
++/*
++ * fdt_strnlen: returns the length of a string or max_count - which eve=
r is
++ * smallest.
++ * Input 1 string: the string whose size is to be determined
++ * Input 2 max_count: the maximum value returned by this function
++ * Output: length of the string or max_count (the smallest of the two)
++ */
++static inline size_t fdt_strnlen(const char *string, size_t max_count)
++{
++    const char *p =3D memchr(string, 0, max_count);
++    return p ? p - string : max_count;
++}
++
++#endif /* !defined(MAC_OS_X_VERSION_10_7) || (MAC_OS_X_VERSION_MAX_ALLO=
WED <
++          MAC_OS_X_VERSION_10_7) */
++
++#endif /* __APPLE__ */
++
++#endif /* LIBFDT_ENV_H */
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0011-common-Add-essential-libc-functions.patch b/meta-arm-bsp/=
recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0011-common-Add=
-essential-libc-functions.patch
new file mode 100644
index 0000000..aa05a72
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0011-common-Add-essential-libc-functions.patch
@@ -0,0 +1,101 @@
+From 0f2c7ca446063be6b193fbf870d38c0af19e15c5 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 28 Dec 2021 17:28:25 +0800
+Subject: [PATCH] common: Add essential libc functions
+
+The libfdt uses some of the libc functions, e.g. memcmp, memmove,
+strlen .etc. Add them in lib.c.
+
+The code is copied from TF-A (v2.5) [1] project, which is under the
+terms of BSD license. It is the same with boot-wrapper.
+
+[1]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git
+
+Issue-Id: SCM-3814
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: If3b55b00afa8694c7522df989a41e0b38eda1d38
+---
+ common/lib.c | 71 +++++++++++++++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 70 insertions(+), 1 deletion(-)
+
+diff --git a/common/lib.c b/common/lib.c
+index fcf5f69..0be1c4a 100644
+--- a/common/lib.c
++++ b/common/lib.c
+@@ -32,4 +32,73 @@ void *memset(void *s, int c, size_t n)
+ 	return s;
+ }
+=20
+-/* TODO: memmove and memcmp could also be called */
++int memcmp(const void *s1, const void *s2, size_t len)
++{
++	const unsigned char *s =3D s1;
++	const unsigned char *d =3D s2;
++	unsigned char sc;
++	unsigned char dc;
++
++	while (len--) {
++		sc =3D *s++;
++		dc =3D *d++;
++		if (sc - dc)
++			return (sc - dc);
++	}
++
++	return 0;
++}
++
++void *memmove(void *dst, const void *src, size_t len)
++{
++	if ((size_t)dst - (size_t)src >=3D len) {
++		/* destination not in source data, so can safely use memcpy */
++		return memcpy(dst, src, len);
++	} else {
++		/* copy backwards... */
++		const char *end =3D dst;
++		const char *s =3D (const char *)src + len;
++		char *d =3D (char *)dst + len;
++		while (d !=3D end)
++			*--d =3D *--s;
++	}
++	return dst;
++}
++
++void *memchr(const void *src, int c, size_t len)
++{
++	const unsigned char *s =3D src;
++
++	while (len--) {
++		if (*s =3D=3D (unsigned char)c)
++			return (void *) s;
++		s++;
++	}
++
++	return NULL;
++}
++
++char *strrchr(const char *p, int ch)
++{
++	char *save;
++	char c;
++
++	c =3D ch;
++	for (save =3D NULL;; ++p) {
++		if (*p =3D=3D c)
++			save =3D (char *)p;
++		if (*p =3D=3D '\0')
++			return (save);
++	}
++	/* NOTREACHED */
++}
++
++size_t strlen(const char *s)
++{
++	const char *cursor =3D s;
++
++	while (*cursor)
++		cursor++;
++
++	return cursor - s;
++}
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch b/me=
ta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0012=
-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
new file mode 100644
index 0000000..eeddaac
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0012-Makefile-Add-the-libfdt-to-the-Makefile-system.patch
@@ -0,0 +1,61 @@
+From de5d2b6c200ae5dd8113751e58bf7cf5844eec5a Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 28 Dec 2021 17:42:48 +0800
+Subject: [PATCH] Makefile: Add the libfdt to the Makefile system
+
+Add the libfdt into Makefile system. The libfdt uses const value and
+thus gcc will enable the stack guard. The stack guard will fail the
+compile. Add -fno-stack-protector to fix it.
+
+Issue-Id: SCM-3814
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I472bc28cdc5cde3b22461a4b7d7a3752ae382b4b
+---
+ Makefile.am | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 88a27de..5e8668a 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -36,6 +36,9 @@ PSCI_CPU_OFF	:=3D 0x84000002
+ COMMON_SRC	:=3D common/
+ COMMON_OBJ	:=3D boot.o bakery_lock.o platform.o lib.o
+=20
++LIBFDT_SRC	:=3D common/libfdt/
++LIBFDT_OBJS	:=3D fdt.o fdt_ro.o fdt_rw.o
++
+ ARCH_OBJ	:=3D boot.o stack.o utils.o
+=20
+ if BOOTWRAPPER_32
+@@ -125,11 +128,12 @@ CHOSEN_NODE	:=3D chosen {						\
+ CPPFLAGS	+=3D $(INITRD_FLAGS)
+ CFLAGS		+=3D -I$(top_srcdir)/include/ -I$(top_srcdir)/$(ARCH_SRC)/inclu=
de/
+ CFLAGS		+=3D -Wall -fomit-frame-pointer
++CFLAGS 		+=3D -fno-stack-protector
+ CFLAGS		+=3D -ffunction-sections -fdata-sections
+ CFLAGS		+=3D -fno-pic -fno-pie
+ LDFLAGS		+=3D --gc-sections
+=20
+-OBJ		:=3D $(addprefix $(ARCH_SRC),$(ARCH_OBJ)) $(addprefix $(COMMON_SRC=
),$(COMMON_OBJ))
++OBJ		:=3D $(addprefix $(ARCH_SRC),$(ARCH_OBJ)) $(addprefix $(COMMON_SRC=
),$(COMMON_OBJ)) $(addprefix $(LIBFDT_SRC),$(LIBFDT_OBJS))
+=20
+ # Don't lookup all prerequisites in $(top_srcdir), only the source file=
s. When
+ # building outside the source tree $(ARCH_SRC) needs to be created.
+@@ -150,10 +154,13 @@ $(ARCH_SRC):
+ $(COMMON_SRC):
+ 	$(MKDIR_P) $@
+=20
++$(LIBFDT_SRC):
++	$(MKDIR_P) $@
++
+ %.o: %.S Makefile | $(ARCH_SRC)
+ 	$(CC) $(CPPFLAGS) -D__ASSEMBLY__ $(CFLAGS) $(DEFINES) -c -o $@ $<
+=20
+-%.o: %.c Makefile | $(COMMON_SRC)
++%.o: %.c Makefile | $(COMMON_SRC) $(LIBFDT_SRC)
+ 	$(CC) $(CPPFLAGS) $(CFLAGS) $(DEFINES) -c -o $@ $<
+=20
+ model.lds: $(LD_SCRIPT) Makefile
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0013-platform-Add-print_hex-func.patch b/meta-arm-bsp/recipes-=
bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0013-platform-Add-print=
_hex-func.patch
new file mode 100644
index 0000000..7d643ff
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0013-platform-Add-print_hex-func.patch
@@ -0,0 +1,67 @@
+From 5b8cb5192dbd0332e027e8999c3afe4433983291 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Wed, 29 Dec 2021 10:50:21 +0800
+Subject: [PATCH] platform: Add print_hex func
+
+Refine the print functions, and add a new print_hex func to print hex
+numbers.
+
+Issue-Id: SCM-3814
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: Ic960345d9ef0b41d81d30c4a4dbd9c31139907c4
+---
+ common/platform.c | 33 +++++++++++++++++++++++++--------
+ 1 file changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/common/platform.c b/common/platform.c
+index d11f568..8269392 100644
+--- a/common/platform.c
++++ b/common/platform.c
+@@ -30,20 +30,37 @@
+ #define V2M_SYS(reg)	((void *)SYSREGS_BASE + V2M_SYS_##reg)
+ #endif
+=20
+-static void print_string(const char *str)
++static void print_char(const char c)
+ {
+ 	uint32_t flags;
++	do {
++		flags =3D raw_readl(PL011(UARTFR));
++	} while (flags & PL011_UARTFR_FIFO_FULL);
+=20
++	raw_writel(c, PL011(UARTDR));
++
++	do {
++		flags =3D raw_readl(PL011(UARTFR));
++	} while (flags & PL011_UARTFR_BUSY);
++}
++
++void print_string(const char *str)
++{
+ 	while (*str) {
+-		do
+-			flags =3D raw_readl(PL011(UARTFR));
+-		while (flags & PL011_UARTFR_FIFO_FULL);
++		print_char(*str++);
++	}
++}
+=20
+-		raw_writel(*str++, PL011(UARTDR));
++#define HEX_CHARS_PER_INT (2 * sizeof(int))
++
++void print_hex(unsigned int val)
++{
+=20
+-		do
+-			flags =3D raw_readl(PL011(UARTFR));
+-		while (flags & PL011_UARTFR_BUSY);
++	const char hex_chars[16] =3D "0123456789abcdef";
++	int i;
++	for (i =3D HEX_CHARS_PER_INT - 1; i >=3D 0; i--) {
++		int v =3D (val >> (4 * i)) & 0xf;
++		print_char(hex_chars[v]);
+ 	}
+ }
+=20
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0014-common-Add-mem-usage-to-memreserve.patch b/meta-arm-bsp/r=
ecipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0014-common-Add-=
mem-usage-to-memreserve.patch
new file mode 100644
index 0000000..f5263d2
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0014-common-Add-mem-usage-to-memreserve.patch
@@ -0,0 +1,96 @@
+From b447242cd2457bec20d47fe6a8a5758d97a3bde3 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Wed, 19 Jan 2022 16:19:02 +0800
+Subject: [PATCH] common: Add mem usage to /memreserve/
+
+Set /memreserve/ to prevent next boot stages from overrding PSCI
+services with libfdt.
+
+Issue-Id: SCM-3815
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I2ea80cdf736a910fa2c3deb622e21d50f04be960
+---
+ Makefile.am          |  2 +-
+ common/boot.c        |  1 +
+ common/device_tree.c | 34 ++++++++++++++++++++++++++++++++++
+ include/boot.h       |  1 +
+ 4 files changed, 37 insertions(+), 1 deletion(-)
+ create mode 100644 common/device_tree.c
+
+diff --git a/Makefile.am b/Makefile.am
+index 5e8668a..734de92 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -34,7 +34,7 @@ endif
+ PSCI_CPU_OFF	:=3D 0x84000002
+=20
+ COMMON_SRC	:=3D common/
+-COMMON_OBJ	:=3D boot.o bakery_lock.o platform.o lib.o
++COMMON_OBJ	:=3D boot.o bakery_lock.o platform.o lib.o device_tree.o
+=20
+ LIBFDT_SRC	:=3D common/libfdt/
+ LIBFDT_OBJS	:=3D fdt.o fdt_ro.o fdt_rw.o
+diff --git a/common/boot.c b/common/boot.c
+index c74d34c..ee2bea0 100644
+--- a/common/boot.c
++++ b/common/boot.c
+@@ -63,6 +63,7 @@ void __noreturn first_spin(unsigned int cpu, unsigned =
long *mbox,
+ {
+ 	if (cpu =3D=3D 0) {
+ 		init_platform();
++		dt_add_memreserve();
+=20
+ 		*mbox =3D (unsigned long)&entrypoint;
+ 		sevl();
+diff --git a/common/device_tree.c b/common/device_tree.c
+new file mode 100644
+index 0000000..4d0876c
+--- /dev/null
++++ b/common/device_tree.c
+@@ -0,0 +1,34 @@
++/*
++ * device_tree.c - Basic device tree node handler
++ *
++ * Copyright (C) 2021 ARM Limited. All rights reserved.
++ *
++ * Use of this source code is governed by a BSD-style license that can =
be
++ * found in the LICENSE.txt file.
++ */
++#include <libfdt.h>
++
++extern unsigned long dtb;
++extern char firmware_start[], firmware_end[];
++
++extern void print_string(const char *str);
++
++static void *blob;
++
++
++void dt_add_memreserve(void)
++{
++	int ret;
++
++	blob =3D (void*)&dtb;
++	print_string("Add /memreserve/\n\r");
++
++	fdt_open_into(blob, blob, fdt_totalsize(blob) +
++		      sizeof(struct fdt_reserve_entry));
++	ret =3D fdt_add_mem_rsv(blob, (uint64_t)firmware_start,
++			      (uint64_t)(firmware_end - firmware_start));
++
++	if(ret < 0) {
++		print_string("reserve mem add err\n\r");
++	}
++}
+diff --git a/include/boot.h b/include/boot.h
+index d75e013..c3e2ec1 100644
+--- a/include/boot.h
++++ b/include/boot.h
+@@ -16,4 +16,5 @@ void __noreturn spin(unsigned long *mbox, unsigned lon=
g invalid, int is_entry);
+ void __noreturn first_spin(unsigned int cpu, unsigned long *mbox,
+ 			   unsigned long invalid_addr);
+=20
++void dt_add_memreserve(void);
+ #endif
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0015-boot-Add-the-enable-keep-el-compile-option.patch b/meta-a=
rm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0015-boo=
t-Add-the-enable-keep-el-compile-option.patch
new file mode 100644
index 0000000..6c708e9
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0015-boot-Add-the-enable-keep-el-compile-option.patch
@@ -0,0 +1,102 @@
+From 8271c21bcff260295203214b7b8c87cdb8236453 Mon Sep 17 00:00:00 2001
+From: Jaxson Han <jaxson.han@arm.com>
+Date: Tue, 4 Jan 2022 17:01:55 +0800
+Subject: [PATCH] boot: Add the --enable-keep-el compile option
+
+Add --enable-keep-el compile option to enable boot-wrapper booting next
+stage at EL2.
+The Armv8R AArch64 boots at EL2. If the next stage requires EL2 booting,
+the boot-wrapper should not drop to EL1.
+Currently, this option only works for Armv8R AArch64. Also, to work with
+Linux PSCI, this option will cause secondary cores booting at EL1.
+
+Issue-Id: SCM-3813
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Jaxson Han <jaxson.han@arm.com>
+Change-Id: I3ba9c87cf0b59d163ca433f74c9e3a46e5ca2c63
+---
+ Makefile.am         | 4 ++++
+ arch/aarch64/boot.S | 6 +++++-
+ common/psci.c       | 6 ++++++
+ configure.ac        | 5 +++++
+ 4 files changed, 20 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 734de92..054becd 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -33,6 +33,10 @@ PSCI_CPU_ON	:=3D 0xc4000003
+ endif
+ PSCI_CPU_OFF	:=3D 0x84000002
+=20
++if KEEP_EL
++DEFINES		+=3D -DKEEP_EL
++endif
++
+ COMMON_SRC	:=3D common/
+ COMMON_OBJ	:=3D boot.o bakery_lock.o platform.o lib.o device_tree.o
+=20
+diff --git a/arch/aarch64/boot.S b/arch/aarch64/boot.S
+index 6dbd5cc..157c097 100644
+--- a/arch/aarch64/boot.S
++++ b/arch/aarch64/boot.S
+@@ -233,7 +233,11 @@ el2_init:
+ 	msr	cnthctl_el2, x0
+ 	isb
+=20
++#ifdef KEEP_EL
++	mov	w0, #SPSR_KERNEL
++#else
+ 	mov	w0, #SPSR_KERNEL_EL1
++#endif
+ 	ldr	x1, =3Dspsr_to_elx
+ 	str	w0, [x1]
+ 	// fall through
+@@ -313,5 +317,5 @@ ASM_FUNC(jump_kernel)
+ 	.align 3
+ flag_keep_el:
+ 	.long 0
+-spsr_to_elx:
++ASM_DATA(spsr_to_elx)
+ 	.long 0
+diff --git a/common/psci.c b/common/psci.c
+index a0e8700..945780b 100644
+--- a/common/psci.c
++++ b/common/psci.c
+@@ -18,6 +18,8 @@
+ #error "No MPIDRs provided"
+ #endif
+=20
++extern unsigned int spsr_to_elx;
++
+ static unsigned long branch_table[NR_CPUS];
+=20
+ bakery_ticket_t branch_table_lock[NR_CPUS];
+@@ -44,6 +46,10 @@ static int psci_cpu_on(unsigned long target_mpidr, un=
signed long address)
+ 	ret =3D psci_store_address(cpu, address);
+ 	bakery_unlock(branch_table_lock, this_cpu);
+=20
++#ifdef KEEP_EL
++	spsr_to_elx =3D SPSR_KERNEL_EL1;
++#endif
++
+ 	return ret;
+ }
+=20
+diff --git a/configure.ac b/configure.ac
+index 53e51be..0e07db3 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -25,6 +25,11 @@ AS_IF([test "x$BOOTWRAPPER_ES" =3D x32 -a "x$KERNEL_E=
S" !=3D x32],
+ 	[AC_MSG_ERROR([a 32-bit boot-wrapper cannot launch a 64-bit kernel])]
+ )
+=20
++AC_ARG_ENABLE([keep-el],
++	AC_HELP_STRING([--enable-keep-el], [keep exception level when start ke=
rnel]),
++	[KEEP_EL=3Dyes], [KEEP_EL=3Dno])
++AM_CONDITIONAL([KEEP_EL], [test "x$KEEP_EL" =3D xyes])
++
+ # Allow a user to pass --with-kernel-dir
+ AC_ARG_WITH([kernel-dir],
+ 	AS_HELP_STRING([--with-kernel-dir], [specify the root Linux kernel bui=
ld directory (required)]),
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-base=
r-aemv8r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch b/meta-arm-=
bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8r64/0016-Makefi=
le-Change-COUNTER_FREQ-to-100-MHz.patch
new file mode 100644
index 0000000..a6b16e4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/files/fvp-baser-aemv8=
r64/0016-Makefile-Change-COUNTER_FREQ-to-100-MHz.patch
@@ -0,0 +1,34 @@
+From dd3e3f414d0e6ed1643c2e2ccac676b7fc1dc7a9 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 1 Feb 2022 11:28:46 +0000
+Subject: [PATCH] Makefile: Change COUNTER_FREQ to 100 MHz
+
+Older Arm Fast Models (AEM < RevC) had a base frequency of 24 MHz. but
+the RevC base models use 100 MHz. There is not a robust method of
+determining the configured base frequency at runtime, so update
+COUNTER_FREQ to be 100 MHz.
+
+Issue-Id: SCM-3871
+Upstream-Status: Pending
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: Ia9ad0f8ee488d1a887791f1fa1d8f3bf9c5887fd
+---
+ Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 40bc5d6..b48173c 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -13,7 +13,7 @@ SCRIPT_DIR	:=3D $(top_srcdir)/scripts
+ PHYS_OFFSET	:=3D $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findmem.pl=
 $(KERNEL_DTB))
+ UART_BASE	:=3D $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.pl =
$(KERNEL_DTB) 0 'arm,pl011')
+ SYSREGS_BASE	:=3D $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findbase.=
pl $(KERNEL_DTB) 0 'arm,vexpress-sysreg' 2> /dev/null)
+-COUNTER_FREQ	:=3D 24000000
++COUNTER_FREQ	:=3D 100000000
+=20
+ CPU_IDS		:=3D $(shell perl -I $(SCRIPT_DIR) $(SCRIPT_DIR)/findcpuids.pl=
 $(KERNEL_DTB))
+ NR_CPUS         :=3D $(shell echo $(CPU_IDS) | tr ',' ' ' | wc -w)
+--=20
+2.25.1
+
--=20
2.25.1


