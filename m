Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA363C43219
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 11:24:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.9085.1645701842498711355
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 03:24:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23081106F;
	Thu, 24 Feb 2022 03:24:02 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.58])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 87A3E3F70D;
	Thu, 24 Feb 2022 03:24:01 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH honister 4/8] arm-bsp/u-boot: Add U-Boot for
 fvp-baser-aemv8r64
Date: Thu, 24 Feb 2022 11:22:40 +0000
Message-Id: <20220224112244.1521611-5-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224112244.1521611-1-peter.hoyes@arm.com>
References: <20220224112244.1521611-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 24 Feb 2022 11:24:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3052

From: Peter Hoyes <Peter.Hoyes@arm.com>

This patch introduces U-Boot into the fvp-baser-aemv8r64 boot flow,
providing EFI services.

The fvp-baser-aemv8r64 does not have an EL3, so the system starts at
S-EL2. For now, U-Boot is running at S-EL2, alongside boot-wrapper.
Enable the --enable-keep-el option in boot-wrapper-aarch64 so that it
boots the next stage (U-Boot) at S-EL2. Additionally, tell
boot-wrapper-aarch64 to bundle U-Boot instead of the kernel.

Linux only supports booting from S-EL1 on the fvp-baser-aemv8r64, so
U-Boot is configured with CONFIG_SWITCH_TO_EL1, so that booti or bootefi
switch to S-EL1 before booting the EFI payload (unless an enviornment
variable - armv8_switch_to_el1 - is set to 'n').

Add patches to U-Boot, which:
 * Backports 53b40e8d54fcdb834e10e6538084517524b8401b, to disable
   pointer authentication traps.
 * Add board support for the fvp-baser-aemv8r64 (with a memory map
   which is inverted from the fvp-base).
 * Enable the configuration of U-Boot using the device tree passed from
   boot-wrapper-aarch64.
 * Enable virtio-net.
 * Disable setting the exception vectors at S-EL2 so that the PSCI
   vectors pass through to Linux.
 * Set up system registers at S-EL2 for Linux.
 * Configure the S-EL2 MPU for the EFI services.
 * Allows bootefi to switch to EL1 before booting Linux.

Issue-Id: SCM-3871
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I229d14b0717df412c1fe33772230ca779f79b32d
---
 .../conf/machine/fvp-baser-aemv8r64.conf      |   6 +-
 ...oot-wrapper-aarch64-fvp-baser-aemv8r64.inc |   5 +-
 ...pointer-authentication-traps-for-EL1.patch | 126 ++++++++
 ...ation-for-the-Arm-VExpress64-board-c.patch | 109 +++++++
 ...tor-header-file-to-make-it-easier-to.patch | 173 +++++++++++
 ...Clean-up-BASE_FVP-boot-configuration.patch |  99 +++++++
 ...e-OF_CONTROL-and-OF_BOARD-for-VExpre.patch | 106 +++++++
 ...s64-Enable-VIRTIO_NET-network-driver.patch |  62 ++++
 ...v8-Add-ARMv8-MPU-configuration-logic.patch | 259 +++++++++++++++++
 ...bling-exception-vectors-on-non-SPL-b.patch |  98 +++++++
 ...mv8-ARMV8_SWITCH_TO_EL1-improvements.patch | 163 +++++++++++
 ...ling-HVC-configurable-when-switching.patch |  73 +++++
 ...press64-Do-not-set-COUNTER_FREQUENCY.patch |  37 +++
 ...Add-BASER_FVP-vexpress-board-variant.patch | 275 ++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |  18 ++
 15 files changed, 1607 insertions(+), 2 deletions(-)
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0001-armv8-Disable-pointer-authentication-traps-for-EL1.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0002-doc-Add-documentation-for-the-Arm-VExpress64-board-c.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0003-vexpress64-Refactor-header-file-to-make-it-easier-to.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0004-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0005-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0006-vexpress64-Enable-VIRTIO_NET-network-driver.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0007-armv8-Add-ARMv8-MPU-configuration-logic.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0008-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0009-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0010-armv8-Make-disabling-HVC-configurable-when-switching.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0011-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch
 create mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv=
8r64/0012-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch

diff --git a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf b/meta-arm=
-bsp/conf/machine/fvp-baser-aemv8r64.conf
index 2d63be5..c190e4c 100644
--- a/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
+++ b/meta-arm-bsp/conf/machine/fvp-baser-aemv8r64.conf
@@ -15,10 +15,14 @@ PREFERRED_VERSION_linux-yocto-rt ?=3D "5.14%"
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_DEVICETREE =3D "arm/fvp-baser-aemv8r64.dtb"
=20
+UBOOT_MACHINE ?=3D "vexpress_aemv8r_defconfig"
+
 SERIAL_CONSOLES =3D "115200;ttyAMA0"
=20
 IMAGE_FSTYPES +=3D "wic"
-WKS_FILE ?=3D "fvp-base.wks"
+WKS_FILE ?=3D "efi-disk.wks.in"
+EFI_PROVIDER ?=3D "grub-efi"
+MACHINE_FEATURES:append =3D " efi"
=20
 # As this is a virtual target that will not be used in the real world th=
ere is
 # no need for real SSH keys.  Disable rng-tools (which takes too long to
diff --git a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-a=
arch64-fvp-baser-aemv8r64.inc b/meta-arm-bsp/recipes-bsp/boot-wrapper-aar=
ch64/boot-wrapper-aarch64-fvp-baser-aemv8r64.inc
index 628571f..6bc7385 100644
--- a/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
+++ b/meta-arm-bsp/recipes-bsp/boot-wrapper-aarch64/boot-wrapper-aarch64-=
fvp-baser-aemv8r64.inc
@@ -23,6 +23,9 @@ SRC_URI:append =3D " \
 BOOT_WRAPPER_AARCH64_CMDLINE =3D "\
 earlycon console=3DttyAMA0 loglevel=3D8 rootfstype=3Dext4 root=3D/dev/vd=
a1 rw"
=20
-EXTRA_OECONF +=3D "--enable-psci=3Dhvc"
+EXTRA_OECONF +=3D "--enable-psci=3Dhvc --enable-keep-el"
=20
 TUNE_CCARGS =3D ""
+
+BOOT_WRAPPER_AARCH64_KERNEL =3D "u-boot.bin"
+do_deploy[depends] +=3D "u-boot:do_deploy"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
01-armv8-Disable-pointer-authentication-traps-for-EL1.patch b/meta-arm-bs=
p/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv8-Disable-pointer=
-authentication-traps-for-EL1.patch
new file mode 100644
index 0000000..fd2b6ae
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0001-armv=
8-Disable-pointer-authentication-traps-for-EL1.patch
@@ -0,0 +1,126 @@
+From 0b1b542cbc1d159e57eef0656133bb233451d23d Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Thu, 19 Aug 2021 16:53:09 +0100
+Subject: [PATCH 01/12] armv8: Disable pointer authentication traps for E=
L1
+
+The use of ARMv8.3 pointer authentication (PAuth) is governed by fields
+in HCR_EL2, which trigger a 'trap to EL2' if not enabled. The reset
+value of these fields is 'architecturally unknown' so we must ensure
+that the fields are enabled (to disable the traps) if we are entering
+the kernel at EL1.
+
+The APK field disables PAuth instruction traps and the API field
+disables PAuth register traps
+
+Add code to disable the traps in armv8_switch_to_el1_m. Prior to doing
+so, it checks fields in the ID_AA64ISAR1_EL1 register to ensure pointer
+authentication is supported by the hardware.
+
+The runtime checks require a second temporary register, so add this to
+the EL1 transition macro signature and update 2 call sites.
+
+Issue-Id: SCM-2443
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/53b40e8d54fcdb834e10e6538084517524b8401b]
+Change-Id: I12159c327a2cca006b973a08fe414f73314e7eb1
+---
+ arch/arm/cpu/armv8/fsl-layerscape/spintable.S |  2 +-
+ arch/arm/cpu/armv8/transition.S               |  2 +-
+ arch/arm/include/asm/macro.h                  | 11 ++++++++--
+ arch/arm/include/asm/system.h                 | 21 +++++++++++++++++++
+ 4 files changed, 32 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/fsl-layerscape/spintable.S b/arch/arm/cp=
u/armv8/fsl-layerscape/spintable.S
+index 363ded03e6..d6bd188459 100644
+--- a/arch/arm/cpu/armv8/fsl-layerscape/spintable.S
++++ b/arch/arm/cpu/armv8/fsl-layerscape/spintable.S
+@@ -93,7 +93,7 @@ __secondary_boot_func:
+ 4:
+ #ifdef CONFIG_ARMV8_SWITCH_TO_EL1
+ 	switch_el x7, _dead_loop, 0f, _dead_loop
+-0:	armv8_switch_to_el1_m x4, x6, x7
++0:	armv8_switch_to_el1_m x4, x6, x7, x9
+ #else
+ 	switch_el x7, 0f, _dead_loop, _dead_loop
+ 0:	armv8_switch_to_el2_m x4, x6, x7
+diff --git a/arch/arm/cpu/armv8/transition.S b/arch/arm/cpu/armv8/transi=
tion.S
+index a31af4ffc8..9dbdff3a4f 100644
+--- a/arch/arm/cpu/armv8/transition.S
++++ b/arch/arm/cpu/armv8/transition.S
+@@ -40,7 +40,7 @@ ENTRY(armv8_switch_to_el1)
+ 	 * now, jump to the address saved in x4.
+ 	 */
+ 	br x4
+-1:	armv8_switch_to_el1_m x4, x5, x6
++1:	armv8_switch_to_el1_m x4, x5, x6, x7
+ ENDPROC(armv8_switch_to_el1)
+ .popsection
+=20
+diff --git a/arch/arm/include/asm/macro.h b/arch/arm/include/asm/macro.h
+index bb33b4bc89..5ee72d0e78 100644
+--- a/arch/arm/include/asm/macro.h
++++ b/arch/arm/include/asm/macro.h
+@@ -238,7 +238,7 @@ lr	.req	x30
+  * For loading 64-bit OS, x0 is physical address to the FDT blob.
+  * They will be passed to the guest.
+  */
+-.macro armv8_switch_to_el1_m, ep, flag, tmp
++.macro armv8_switch_to_el1_m, ep, flag, tmp, tmp2
+ 	/* Initialize Generic Timers */
+ 	mrs	\tmp, cnthctl_el2
+ 	/* Enable EL1 access to timers */
+@@ -288,7 +288,14 @@ lr	.req	x30
+ 	b.eq	1f
+=20
+ 	/* Initialize HCR_EL2 */
+-	ldr	\tmp, =3D(HCR_EL2_RW_AARCH64 | HCR_EL2_HCD_DIS)
++	/* Only disable PAuth traps if PAuth is supported */
++	mrs	\tmp, id_aa64isar1_el1
++	ldr	\tmp2, =3D(ID_AA64ISAR1_EL1_GPI | ID_AA64ISAR1_EL1_GPA | \
++		      ID_AA64ISAR1_EL1_API | ID_AA64ISAR1_EL1_APA)
++	tst	\tmp, \tmp2
++	mov	\tmp2, #(HCR_EL2_RW_AARCH64 | HCR_EL2_HCD_DIS)
++	orr	\tmp, \tmp2, #(HCR_EL2_APK | HCR_EL2_API)
++	csel	\tmp, \tmp2, \tmp, eq
+ 	msr	hcr_el2, \tmp
+=20
+ 	/* Return to the EL1_SP1 mode from EL2 */
+diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
+index 11fceec4d2..77aa18909e 100644
+--- a/arch/arm/include/asm/system.h
++++ b/arch/arm/include/asm/system.h
+@@ -75,10 +75,31 @@
+ /*
+  * HCR_EL2 bits definitions
+  */
++#define HCR_EL2_API		(1 << 41) /* Trap pointer authentication
++				             instructions                     */
++#define HCR_EL2_APK		(1 << 40) /* Trap pointer authentication
++				             key access                       */
+ #define HCR_EL2_RW_AARCH64	(1 << 31) /* EL1 is AArch64                 =
  */
+ #define HCR_EL2_RW_AARCH32	(0 << 31) /* Lower levels are AArch32       =
  */
+ #define HCR_EL2_HCD_DIS		(1 << 29) /* Hypervisor Call disabled         =
*/
+=20
++/*
++ * ID_AA64ISAR1_EL1 bits definitions
++ */
++#define ID_AA64ISAR1_EL1_GPI	(0xF << 28) /* Implementation-defined gene=
ric
++				               code auth algorithm            */
++#define ID_AA64ISAR1_EL1_GPA	(0xF << 24) /* QARMA generic code auth
++				               algorithm                      */
++#define ID_AA64ISAR1_EL1_API	(0xF << 8)  /* Implementation-defined addr=
ess
++				               auth algorithm                 */
++#define ID_AA64ISAR1_EL1_APA	(0xF << 4)  /* QARMA address auth algorith=
m   */
++
++/*
++ * ID_AA64PFR0_EL1 bits definitions
++ */
++#define ID_AA64PFR0_EL1_EL3	(0xF << 12) /* EL3 implemented             =
   */
++#define ID_AA64PFR0_EL1_EL2	(0xF << 8)  /* EL2 implemented             =
   */
++
+ /*
+  * CPACR_EL1 bits definitions
+  */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
02-doc-Add-documentation-for-the-Arm-VExpress64-board-c.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-doc-Add-documentati=
on-for-the-Arm-VExpress64-board-c.patch
new file mode 100644
index 0000000..66f915a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0002-doc-=
Add-documentation-for-the-Arm-VExpress64-board-c.patch
@@ -0,0 +1,109 @@
+From b76b9a4388f921359046c3d59748b06a2ffa99ce Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 19 Oct 2021 15:47:21 +0100
+Subject: [PATCH 02/12] doc: Add documentation for the Arm VExpress64 boa=
rd
+ configs
+
+Create a new documentation section for Arm Ltd boards with a sub-page
+for the VExpress64 boards (FVP-A and Juno).
+
+Issue-Id: SCM-3533
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/6c2f16b3c95a0bb7f5d6f65512dceb0dc75ac00a]
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I9e6244e9c4949c0a60acb32216fb71e933af40ed
+---
+ doc/board/armltd/index.rst      |  9 ++++++
+ doc/board/armltd/vexpress64.rst | 51 +++++++++++++++++++++++++++++++++
+ doc/board/index.rst             |  1 +
+ 3 files changed, 61 insertions(+)
+ create mode 100644 doc/board/armltd/index.rst
+ create mode 100644 doc/board/armltd/vexpress64.rst
+
+diff --git a/doc/board/armltd/index.rst b/doc/board/armltd/index.rst
+new file mode 100644
+index 0000000000..b6786c114f
+--- /dev/null
++++ b/doc/board/armltd/index.rst
+@@ -0,0 +1,9 @@
++.. SPDX-License-Identifier: GPL-2.0+
++
++Arm Ltd
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++.. toctree::
++   :maxdepth: 2
++
++   vexpress64.rst
+diff --git a/doc/board/armltd/vexpress64.rst b/doc/board/armltd/vexpress=
64.rst
+new file mode 100644
+index 0000000000..b98b096544
+--- /dev/null
++++ b/doc/board/armltd/vexpress64.rst
+@@ -0,0 +1,51 @@
++.. SPDX-License-Identifier: GPL-2.0+
++
++Arm Versatile Express
++=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
++
++The vexpress_* board configuration supports the following platforms:
++
++ * FVP_Base_RevC-2xAEMvA
++ * Juno development board
++
++Fixed Virtual Platforms
++-----------------------
++
++The Fixed Virtual Platforms (FVP) are complete simulations of an Arm sy=
stem,
++including processor, memory and peripherals. They are set out in a "pro=
grammer's
++view", which gives a comprehensive model on which to build and test sof=
tware.
++
++The supported FVPs are available free of charge and can be downloaded f=
rom the
++Arm developer site [1]_ (user registration might be required).
++
++Supported features:
++
++ * GICv3
++ * Generic timer
++ * PL011 UART
++
++The default configuration assumes that U-Boot is bootstrapped using a s=
uitable
++bootloader, such as Trusted Firmware-A [4]_. The u-boot binary can be p=
assed
++into the TF-A build: ``make PLAT=3D<platform> all fip BL33=3Du-boot.bin=
``
++
++The FVPs can be debugged using Arm Development Studio [2]_.
++
++Juno
++----
++
++Juno is an Arm development board with the following features:
++
++ * Arm Cortex-A72/A57 and Arm Cortex-A53 in a "big.LITTLE" configuratio=
n
++ * A PCIe Gen2.0 bus with 4 lanes
++ * 8GB of DRAM
++ * GICv2
++
++More details can be found in the board documentation [3]_.
++
++References
++----------
++
++.. [1] https://developer.arm.com/tools-and-software/simulation-models/f=
ixed-virtual-platforms
++.. [2] https://developer.arm.com/tools-and-software/embedded/arm-develo=
pment-studio
++.. [3] https://developer.arm.com/tools-and-software/development-boards/=
juno-development-board
++.. [4] https://trustedfirmware-a.readthedocs.io/
+\ No newline at end of file
+diff --git a/doc/board/index.rst b/doc/board/index.rst
+index 747511f7dd..5c08de16b0 100644
+--- a/doc/board/index.rst
++++ b/doc/board/index.rst
+@@ -10,6 +10,7 @@ Board-specific doc
+    advantech/index
+    AndesTech/index
+    amlogic/index
++   armltd/index
+    atmel/index
+    congatec/index
+    coreboot/index
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
03-vexpress64-Refactor-header-file-to-make-it-easier-to.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-vexpress64-Refactor=
-header-file-to-make-it-easier-to.patch
new file mode 100644
index 0000000..b7a6a57
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0003-vexp=
ress64-Refactor-header-file-to-make-it-easier-to.patch
@@ -0,0 +1,173 @@
+From 14bd61e78264812edea18c442db99bb83c5f93c0 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 19 Oct 2021 15:39:52 +0100
+Subject: [PATCH 03/12] vexpress64: Refactor header file to make it easie=
r to
+ add new FVPs
+
+Rename from vexpress_aemv8a.h -> vepxress_aemv8.h as new FVPs may not be
+v8-A. No change in behavior.
+
+This is towards future work to enable support for the FVP_BaseR.
+
+Issue-Id: SCM-3537
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/17fe55fd6fe9d32270380f574b33ff0bc15bb47e]
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: Ie992e69d1b51c6f8939b1bea22e35658e96df6c6
+---
+ board/armltd/vexpress64/Kconfig               |  2 +-
+ doc/README.semihosting                        |  2 +-
+ .../{vexpress_aemv8a.h =3D> vexpress_aemv8.h}   | 48 ++++++++++--------=
-
+ 3 files changed, 27 insertions(+), 25 deletions(-)
+ rename include/configs/{vexpress_aemv8a.h =3D> vexpress_aemv8.h} (88%)
+
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
+index 1d13f542e6..4aab3f092e 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -7,7 +7,7 @@ config SYS_VENDOR
+ 	default "armltd"
+=20
+ config SYS_CONFIG_NAME
+-	default "vexpress_aemv8a"
++	default "vexpress_aemv8"
+=20
+ config JUNO_DTB_PART
+ 	string "NOR flash partition holding DTB"
+diff --git a/doc/README.semihosting b/doc/README.semihosting
+index c019999bed..f382d0131e 100644
+--- a/doc/README.semihosting
++++ b/doc/README.semihosting
+@@ -25,7 +25,7 @@ or turning on CONFIG_BASE_FVP for the more full featur=
ed model.
+ Rather than create a new armv8 board similar to armltd/vexpress64, add
+ semihosting calls to the existing one, enabled with CONFIG_SEMIHOSTING
+ and CONFIG_BASE_FVP both set. Also reuse the existing board config file
+-vexpress_aemv8a.h but differentiate the two models by the presence or
++vexpress_aemv8.h but differentiate the two models by the presence or
+ absence of CONFIG_BASE_FVP. This change is tested and works on both the
+ Foundation and Base fastmodel simulators.
+=20
+diff --git a/include/configs/vexpress_aemv8a.h b/include/configs/vexpres=
s_aemv8.h
+similarity index 88%
+rename from include/configs/vexpress_aemv8a.h
+rename to include/configs/vexpress_aemv8.h
+index 7318fb6c58..38141fe023 100644
+--- a/include/configs/vexpress_aemv8a.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -4,36 +4,37 @@
+  *   configurations.
+  */
+=20
+-#ifndef __VEXPRESS_AEMV8A_H
+-#define __VEXPRESS_AEMV8A_H
++#ifndef __VEXPRESS_AEMV8_H
++#define __VEXPRESS_AEMV8_H
+=20
+ #define CONFIG_REMAKE_ELF
+=20
+ /* Link Definitions */
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
++#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
++#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff=
0)
++#else
+ /* ATF loads u-boot here for BASE_FVP model */
+ #define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x03f0=
0000)
+-#elif CONFIG_TARGET_VEXPRESS64_JUNO
+-#define CONFIG_SYS_INIT_SP_ADDR         (CONFIG_SYS_SDRAM_BASE + 0x7fff=
0)
+ #endif
+=20
+ #define CONFIG_SYS_BOOTM_LEN (64 << 20)      /* Increase max gunzip siz=
e */
+=20
+ /* CS register bases for the original memory map. */
+-#define V2M_PA_CS0			0x00000000
+-#define V2M_PA_CS1			0x14000000
+-#define V2M_PA_CS2			0x18000000
+-#define V2M_PA_CS3			0x1c000000
+-#define V2M_PA_CS4			0x0c000000
+-#define V2M_PA_CS5			0x10000000
++#define V2M_BASE			0x80000000
++#define V2M_PA_BASE			0x00000000
++
++#define V2M_PA_CS0			(V2M_PA_BASE + 0x00000000)
++#define V2M_PA_CS1			(V2M_PA_BASE + 0x14000000)
++#define V2M_PA_CS2			(V2M_PA_BASE + 0x18000000)
++#define V2M_PA_CS3			(V2M_PA_BASE + 0x1c000000)
++#define V2M_PA_CS4			(V2M_PA_BASE + 0x0c000000)
++#define V2M_PA_CS5			(V2M_PA_BASE + 0x10000000)
+=20
+ #define V2M_PERIPH_OFFSET(x)		(x << 16)
+ #define V2M_SYSREGS			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(1))
+ #define V2M_SYSCTL			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(2))
+ #define V2M_SERIAL_BUS_PCI		(V2M_PA_CS3 + V2M_PERIPH_OFFSET(3))
+=20
+-#define V2M_BASE			0x80000000
+-
+ /* Common peripherals relative to CS7. */
+ #define V2M_AACI			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(4))
+ #define V2M_MMCI			(V2M_PA_CS3 + V2M_PERIPH_OFFSET(5))
+@@ -72,16 +73,16 @@
+=20
+ /* Generic Interrupt Controller Definitions */
+ #ifdef CONFIG_GICV3
+-#define GICD_BASE			(0x2f000000)
+-#define GICR_BASE			(0x2f100000)
++#define GICD_BASE			(V2M_PA_BASE + 0x2f000000)
++#define GICR_BASE			(V2M_PA_BASE + 0x2f100000)
+ #else
+=20
+-#ifdef CONFIG_TARGET_VEXPRESS64_BASE_FVP
+-#define GICD_BASE			(0x2f000000)
+-#define GICC_BASE			(0x2c000000)
+-#elif CONFIG_TARGET_VEXPRESS64_JUNO
++#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ #define GICD_BASE			(0x2C010000)
+ #define GICC_BASE			(0x2C02f000)
++#else
++#define GICD_BASE			(V2M_PA_BASE + 0x2f000000)
++#define GICC_BASE			(V2M_PA_BASE + 0x2c000000)
+ #endif
+ #endif /* !CONFIG_GICV3 */
+=20
+@@ -91,7 +92,7 @@
+ #ifndef CONFIG_TARGET_VEXPRESS64_JUNO
+ /* The Vexpress64 simulators use SMSC91C111 */
+ #define CONFIG_SMC91111			1
+-#define CONFIG_SMC91111_BASE		(0x01A000000)
++#define CONFIG_SMC91111_BASE		(V2M_PA_BASE + 0x01A000000)
+ #endif
+=20
+ /* PL011 Serial Configuration */
+@@ -117,7 +118,7 @@
+ #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ #define PHYS_SDRAM_2			(0x880000000)
+ #define PHYS_SDRAM_2_SIZE		0x180000000
+-#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS =3D=3D =
2
++#elif CONFIG_NR_DRAM_BANKS =3D=3D 2
+ #define PHYS_SDRAM_2			(0x880000000)
+ #define PHYS_SDRAM_2_SIZE		0x80000000
+ #endif
+@@ -194,6 +195,7 @@
+ 				"  booti $kernel_addr - $fdt_addr; " \
+ 				"fi"
+ #endif
++
+ #endif
+=20
+ /* Monitor Command Prompt */
+@@ -207,7 +209,7 @@
+ /* Store environment at top of flash in the same location as blank.img =
*/
+ /* in the Juno firmware. */
+ #else
+-#define CONFIG_SYS_FLASH_BASE		0x0C000000
++#define CONFIG_SYS_FLASH_BASE		(V2M_PA_BASE + 0x0C000000)
+ /* 256 x 256KiB sectors */
+ #define CONFIG_SYS_MAX_FLASH_SECT	256
+ /* Store environment at top of flash */
+@@ -224,4 +226,4 @@
+ #define CONFIG_SYS_FLASH_EMPTY_INFO	/* flinfo indicates empty blocks */
+ #define FLASH_MAX_SECTOR_SIZE		0x00040000
+=20
+-#endif /* __VEXPRESS_AEMV8A_H */
++#endif /* __VEXPRESS_AEMV8_H */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
04-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-vexpress64-Clean-up-BASE=
_FVP-boot-configuration.patch
new file mode 100644
index 0000000..9e1f6f7
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0004-vexp=
ress64-Clean-up-BASE_FVP-boot-configuration.patch
@@ -0,0 +1,99 @@
+From 3615110f3f478a6b3551fa9f9dc54317e6718e7d Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Tue, 19 Oct 2021 16:34:25 +0100
+Subject: [PATCH 04/12] vexpress64: Clean up BASE_FVP boot configuration
+
+Move env var address values to #defines so they can be reused elsewhere.
+
+Rename env var names to those recommended in the README.
+
+Fix issue where fdt is called with invalid arguments when booting
+without a ramdisk.
+
+Issue-Id: SCM-3537
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/90f262a6951f530ec60bf78a681b117f625cbe3f]
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I2cd9a1245860302857b6ad6d738b8f7fc4d4d038
+---
+ include/configs/vexpress_aemv8.h | 50 ++++++++++++++++++++------------
+ 1 file changed, 31 insertions(+), 19 deletions(-)
+
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index 38141fe023..9223eb2207 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -7,6 +7,8 @@
+ #ifndef __VEXPRESS_AEMV8_H
+ #define __VEXPRESS_AEMV8_H
+=20
++#include <linux/stringify.h>
++
+ #define CONFIG_REMAKE_ELF
+=20
+ /* Link Definitions */
+@@ -166,33 +168,43 @@
+=20
+=20
+ #elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
++
++#define VEXPRESS_KERNEL_ADDR	0x80080000
++#define VEXPRESS_FDT_ADDR		0x8fc00000
++#define VEXPRESS_BOOT_ADDR		0x8fd00000
++#define VEXPRESS_RAMDISK_ADDR	0x8fe00000
++
+ #define CONFIG_EXTRA_ENV_SETTINGS	\
+ 				"kernel_name=3DImage\0"		\
+-				"kernel_addr=3D0x80080000\0"	\
+-				"initrd_name=3Dramdisk.img\0"	\
+-				"initrd_addr=3D0x88000000\0"	\
+-				"fdtfile=3Ddevtree.dtb\0"		\
+-				"fdt_addr=3D0x83000000\0"		\
+-				"boot_name=3Dboot.img\0"		\
+-				"boot_addr=3D0x8007f800\0"
++				"kernel_addr_r=3D" __stringify(VEXPRESS_KERNEL_ADDR) "\0"	\
++				"ramdisk_name=3Dramdisk.img\0"	\
++				"ramdisk_addr_r=3D" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
++				"fdtfile=3Ddevtree.dtb\0"	\
++				"fdt_addr_r=3D" __stringify(VEXPRESS_FDT_ADDR) "\0"	\
++				"boot_name=3Dboot.img\0" \
++				"boot_addr_r=3D" __stringify(VEXPRESS_BOOT_ADDR) "\0"
+=20
+ #ifndef CONFIG_BOOTCOMMAND
+-#define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr}; then =
" \
++#define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr_r}; the=
n " \
+ 				"  set bootargs; " \
+-				"  abootimg addr ${boot_addr}; " \
+-				"  abootimg get dtb --index=3D0 fdt_addr; " \
+-				"  bootm ${boot_addr} ${boot_addr} " \
+-				"  ${fdt_addr}; " \
++				"  abootimg addr ${boot_addr_r}; " \
++				"  abootimg get dtb --index=3D0 fdt_addr_r; " \
++				"  bootm ${boot_addr_r} ${boot_addr_r} " \
++				"  ${fdt_addr_r}; " \
+ 				"else; " \
+ 				"  set fdt_high 0xffffffffffffffff; " \
+ 				"  set initrd_high 0xffffffffffffffff; " \
+-				"  smhload ${kernel_name} ${kernel_addr}; " \
+-				"  smhload ${fdtfile} ${fdt_addr}; " \
+-				"  smhload ${initrd_name} ${initrd_addr} "\
+-				"  initrd_end; " \
+-				"  fdt addr ${fdt_addr}; fdt resize; " \
+-				"  fdt chosen ${initrd_addr} ${initrd_end}; " \
+-				"  booti $kernel_addr - $fdt_addr; " \
++				"  smhload ${kernel_name} ${kernel_addr_r}; " \
++				"  smhload ${fdtfile} ${fdt_addr_r}; " \
++				"  smhload ${ramdisk_name} ${ramdisk_addr_r} "\
++				"  ramdisk_end; " \
++				"  fdt addr ${fdt_addr_r}; fdt resize; " \
++				"  if test -n ${ramdisk_end}; then "\
++				"    fdt chosen ${ramdisk_addr_r} ${ramdisk_end}; " \
++				"  else; " \
++				"    fdt chosen; " \
++				"  fi; " \
++				"  booti $kernel_addr_r - $fdt_addr_r; " \
+ 				"fi"
+ #endif
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
05-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-vexpress64-Enable-O=
F_CONTROL-and-OF_BOARD-for-VExpre.patch
new file mode 100644
index 0000000..c13e22b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0005-vexp=
ress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.patch
@@ -0,0 +1,106 @@
+From 72fe643b81755a4935c789b2f4f0132ed7eaf8e1 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Mon, 4 Oct 2021 14:03:35 +0100
+Subject: [PATCH 05/12] vexpress64: Enable OF_CONTROL and OF_BOARD for
+ VExpress64
+
+Capture x0 in lowlevel_init.S as potential fdt address. Modify
+board_fdt_blob_setup to use fdt address from either vexpress_aemv8.h
+or lowlevel_init.S.
+
+Issue-Id: SCM-3534
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/2661397464e47d45cd25bbc5e6b9de7594b3268d]
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: If60e2fbcbda23613f591752ddfabe66fb44623c5
+---
+ board/armltd/vexpress64/Makefile        |  5 +++++
+ board/armltd/vexpress64/lowlevel_init.S | 12 ++++++++++++
+ board/armltd/vexpress64/vexpress64.c    | 24 ++++++++++++++++++++++++
+ 3 files changed, 41 insertions(+)
+ create mode 100644 board/armltd/vexpress64/lowlevel_init.S
+
+diff --git a/board/armltd/vexpress64/Makefile b/board/armltd/vexpress64/=
Makefile
+index 868dc4f629..5703e75967 100644
+--- a/board/armltd/vexpress64/Makefile
++++ b/board/armltd/vexpress64/Makefile
+@@ -5,3 +5,8 @@
+=20
+ obj-y	:=3D vexpress64.o
+ obj-$(CONFIG_TARGET_VEXPRESS64_JUNO)	+=3D pcie.o
++ifdef CONFIG_OF_BOARD
++ifndef CONFIG_TARGET_VEXPRESS64_JUNO
++obj-y +=3D lowlevel_init.o
++endif
++endif
+diff --git a/board/armltd/vexpress64/lowlevel_init.S b/board/armltd/vexp=
ress64/lowlevel_init.S
+new file mode 100644
+index 0000000000..3dcfb85d0e
+--- /dev/null
++++ b/board/armltd/vexpress64/lowlevel_init.S
+@@ -0,0 +1,12 @@
++/* SPDX-License-Identifier: GPL-2.0 */
++/*
++ * (C) Copyright 2021 Arm Limited
++ */
++
++.global save_boot_params
++save_boot_params:
++
++	adr	x8, prior_stage_fdt_address
++	str	x0, [x8]
++
++	b	save_boot_params_ret
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index 2e4260286b..b8408e35e5 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -85,7 +85,15 @@ int dram_init_banksize(void)
+ 	return 0;
+ }
+=20
++/* Assigned in lowlevel_init.S
++ * Push the variable into the .data section so that it
++ * does not get cleared later.
++ */
++unsigned long __section(".data") prior_stage_fdt_address;
++
+ #ifdef CONFIG_OF_BOARD
++
++#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ #define JUNO_FLASH_SEC_SIZE	(256 * 1024)
+ static phys_addr_t find_dtb_in_nor_flash(const char *partname)
+ {
+@@ -131,14 +139,30 @@ static phys_addr_t find_dtb_in_nor_flash(const cha=
r *partname)
+ 	return ~0;
+ }
+=20
++#endif
++
+ void *board_fdt_blob_setup(void)
+ {
++#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
+ 	phys_addr_t fdt_rom_addr =3D find_dtb_in_nor_flash(CONFIG_JUNO_DTB_PAR=
T);
+=20
+ 	if (fdt_rom_addr =3D=3D ~0UL)
+ 		return NULL;
+=20
+ 	return (void *)fdt_rom_addr;
++#endif
++
++#ifdef VEXPRESS_FDT_ADDR
++	if (fdt_magic(VEXPRESS_FDT_ADDR) =3D=3D FDT_MAGIC) {
++		return (void *)VEXPRESS_FDT_ADDR;
++	}
++#endif
++
++	if (fdt_magic(prior_stage_fdt_address) =3D=3D FDT_MAGIC) {
++		return (void *)prior_stage_fdt_address;
++	}
++
++	return NULL;
+ }
+ #endif
+=20
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
06-vexpress64-Enable-VIRTIO_NET-network-driver.patch b/meta-arm-bsp/recip=
es-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexpress64-Enable-VIRTIO_NET=
-network-driver.patch
new file mode 100644
index 0000000..12cef01
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0006-vexp=
ress64-Enable-VIRTIO_NET-network-driver.patch
@@ -0,0 +1,62 @@
+From 814420f327e1933594b88c1f4d53ef6ac16d9faa Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Mon, 11 Oct 2021 11:57:26 +0100
+Subject: [PATCH 06/12] vexpress64: Enable VIRTIO_NET network driver
+
+The SMSC driver is using the old driver model.
+
+Init the virtio system in vexpress64.c so that the network device is
+discovered.
+
+Issue-Id: SCM-3534
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit=
/439581dca4c786dbbdd2d6be024e0b907a3b0c80]
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I1b7d9eb142bf02dd88e99bcd7e44789a154885dd
+---
+ board/armltd/vexpress64/vexpress64.c | 7 +++++++
+ include/configs/vexpress_aemv8.h     | 4 ++--
+ 2 files changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index b8408e35e5..821f9cfc3b 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -18,6 +18,10 @@
+ #include <dm/platform_data/serial_pl01x.h>
+ #include "pcie.h"
+ #include <asm/armv8/mmu.h>
++#ifdef CONFIG_VIRTIO_NET
++#include <virtio_types.h>
++#include <virtio.h>
++#endif
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+@@ -64,6 +68,9 @@ __weak void vexpress64_pcie_init(void)
+ int board_init(void)
+ {
+ 	vexpress64_pcie_init();
++#ifdef CONFIG_VIRTIO_NET
++	virtio_init();
++#endif
+ 	return 0;
+ }
+=20
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index 9223eb2207..68422237dd 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -91,8 +91,8 @@
+ /* Size of malloc() pool */
+ #define CONFIG_SYS_MALLOC_LEN		(CONFIG_ENV_SIZE + (8 << 20))
+=20
+-#ifndef CONFIG_TARGET_VEXPRESS64_JUNO
+-/* The Vexpress64 simulators use SMSC91C111 */
++#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) && !defined(CONFIG_DM_ET=
H)
++/* The Vexpress64 BASE_FVP simulator uses SMSC91C111 */
+ #define CONFIG_SMC91111			1
+ #define CONFIG_SMC91111_BASE		(V2M_PA_BASE + 0x01A000000)
+ #endif
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
07-armv8-Add-ARMv8-MPU-configuration-logic.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0007-armv8-Add-ARMv8-MPU-configuratio=
n-logic.patch
new file mode 100644
index 0000000..cbe4b16
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0007-armv=
8-Add-ARMv8-MPU-configuration-logic.patch
@@ -0,0 +1,259 @@
+From f8dfb0973b9972a3e65f2efa48fac0b3bb009b29 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Wed, 26 May 2021 17:41:10 +0100
+Subject: [PATCH 07/12] armv8: Add ARMv8 MPU configuration logic
+
+Detect whether an MMU is present at the current exception level. If
+not, initialize the MPU instead of the MMU during init, and clear the
+MPU regions before transition to Linux.
+
+The MSA in use at EL1&0 may be configurable but can only by determined
+by inspecting VTCR_EL2 at EL2, so assume that there is an MMU for
+backwards compatibility.
+
+Provide a default (blank) MPU memory map, which can be overridden by
+board configurations.
+
+Issue-Id: SCM-2443
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I0ee3879f9d7f03fe940664b3551c68eeaa458d17
+---
+ arch/arm/cpu/armv8/cache_v8.c    | 101 ++++++++++++++++++++++++++++++-
+ arch/arm/include/asm/armv8/mpu.h |  59 ++++++++++++++++++
+ arch/arm/include/asm/system.h    |  19 ++++++
+ 3 files changed, 176 insertions(+), 3 deletions(-)
+ create mode 100644 arch/arm/include/asm/armv8/mpu.h
+
+diff --git a/arch/arm/cpu/armv8/cache_v8.c b/arch/arm/cpu/armv8/cache_v8=
.c
+index 15cecb5e0b..2a49966e8f 100644
+--- a/arch/arm/cpu/armv8/cache_v8.c
++++ b/arch/arm/cpu/armv8/cache_v8.c
+@@ -15,6 +15,7 @@
+ #include <asm/global_data.h>
+ #include <asm/system.h>
+ #include <asm/armv8/mmu.h>
++#include <asm/armv8/mpu.h>
+=20
+ DECLARE_GLOBAL_DATA_PTR;
+=20
+@@ -365,6 +366,91 @@ __weak u64 get_page_table_size(void)
+ 	return size;
+ }
+=20
++static void mpu_clear_regions(void)
++{
++	int i;
++
++	for (i =3D 0; mpu_mem_map[i].end || mpu_mem_map[i].attrs; i++) {
++		setup_el2_mpu_region(i, 0, 0);
++	}
++}
++
++static struct mpu_region default_mpu_mem_map[] =3D {{0,}};
++__weak struct mpu_region *mpu_mem_map =3D default_mpu_mem_map;
++
++static void mpu_setup(void)
++{
++	int i;
++
++	if (current_el() !=3D 2) {
++		panic("MPU configuration is only supported at EL2");
++	}
++
++	set_sctlr(get_sctlr() & ~(CR_M | CR_WXN));
++
++	asm volatile("msr MAIR_EL2, %0" : : "r" MEMORY_ATTRIBUTES);
++
++	for (i =3D 0; mpu_mem_map[i].end || mpu_mem_map[i].attrs; i++) {
++		setup_el2_mpu_region(i,
++			PRBAR_ADDRESS(mpu_mem_map[i].start)
++				| PRBAR_OUTER_SH | PRBAR_AP_RW_ANY,
++			PRLAR_ADDRESS(mpu_mem_map[i].end)
++				| mpu_mem_map[i].attrs | PRLAR_EN_BIT
++			);
++	}
++
++	set_sctlr(get_sctlr() | CR_M);
++}
++
++static bool el_has_mmu(void)
++{
++	if (current_el() < 2) {
++		// We have no way of knowing, so assuming we have an MMU
++		return true;
++	}
++
++	uint64_t id_aa64mmfr0;
++	asm volatile("mrs %0, id_aa64mmfr0_el1"
++			: "=3Dr" (id_aa64mmfr0) : : "cc");
++	uint64_t msa =3D id_aa64mmfr0 & ID_AA64MMFR0_EL1_MSA_MASK;
++	uint64_t msa_frac =3D id_aa64mmfr0 & ID_AA64MMFR0_EL1_MSA_FRAC_MASK;
++
++	switch (msa) {
++		case ID_AA64MMFR0_EL1_MSA_VMSA:
++			/*
++			 * VMSA supported in all translation regimes.
++			 * No support for PMSA.
++			 */
++			return true;
++		case ID_AA64MMFR0_EL1_MSA_USE_FRAC:
++			/* See MSA_frac for the supported MSAs. */
++			switch (msa_frac) {
++				case ID_AA64MMFR0_EL1_MSA_FRAC_NO_PMSA:
++					/*
++					 * PMSA not supported in any translation
++					 * regime.
++					 */
++					return true;
++				case ID_AA64MMFR0_EL1_MSA_FRAC_VMSA:
++					/*
++					* PMSA supported in all translation
++					* regimes. No support for VMSA.
++					*/
++				case ID_AA64MMFR0_EL1_MSA_FRAC_PMSA:
++					/*
++					 * PMSA supported in all translation
++					 * regimes.
++					 */
++					return false;
++				default:
++					panic("Unsupported id_aa64mmfr0_el1 " \
++						"MSA_frac value");
++			}
++		default:
++			panic("Unsupported id_aa64mmfr0_el1 MSA value");
++	}
++}
++
+ void setup_pgtables(void)
+ {
+ 	int i;
+@@ -479,8 +565,13 @@ void dcache_enable(void)
+ 	/* The data cache is not active unless the mmu is enabled */
+ 	if (!(get_sctlr() & CR_M)) {
+ 		invalidate_dcache_all();
+-		__asm_invalidate_tlb_all();
+-		mmu_setup();
++
++		if (el_has_mmu()) {
++			__asm_invalidate_tlb_all();
++			mmu_setup();
++		} else {
++			mpu_setup();
++		}
+ 	}
+=20
+ 	set_sctlr(get_sctlr() | CR_C);
+@@ -499,7 +590,11 @@ void dcache_disable(void)
+ 	set_sctlr(sctlr & ~(CR_C|CR_M));
+=20
+ 	flush_dcache_all();
+-	__asm_invalidate_tlb_all();
++
++	if (el_has_mmu())
++		__asm_invalidate_tlb_all();
++	else
++		mpu_clear_regions();
+ }
+=20
+ int dcache_status(void)
+diff --git a/arch/arm/include/asm/armv8/mpu.h b/arch/arm/include/asm/arm=
v8/mpu.h
+new file mode 100644
+index 0000000000..8de627cafd
+--- /dev/null
++++ b/arch/arm/include/asm/armv8/mpu.h
+@@ -0,0 +1,59 @@
++/*
++ * SPDX-License-Identifier: GPL-2.0+
++ *
++ * (C) Copyright 2021 Arm Limited
++ */
++
++#ifndef _ASM_ARMV8_MPU_H_
++#define _ASM_ARMV8_MPU_H_
++
++#include <asm/armv8/mmu.h>
++#include <linux/stringify.h>
++
++#define PRSELR_EL2		S3_4_c6_c2_1
++#define PRBAR_EL2		S3_4_c6_c8_0
++#define PRLAR_EL2		S3_4_c6_c8_1
++#define MPUIR_EL2		S3_4_c0_c0_4
++
++#define PRBAR_ADDRESS(addr)	((addr) & ~(0x3fULL))
++
++/* Access permissions */
++#define PRBAR_AP(val)		(((val) & 0x3) << 2)
++#define PRBAR_AP_RW_HYP		PRBAR_AP(0x0)
++#define PRBAR_AP_RW_ANY		PRBAR_AP(0x1)
++#define PRBAR_AP_RO_HYP		PRBAR_AP(0x2)
++#define PRBAR_AP_RO_ANY		PRBAR_AP(0x3)
++
++/* Shareability */
++#define PRBAR_SH(val)		(((val) & 0x3) << 4)
++#define PRBAR_NON_SH		PRBAR_SH(0x0)
++#define PRBAR_OUTER_SH		PRBAR_SH(0x2)
++#define PRBAR_INNER_SH		PRBAR_SH(0x3)
++
++/* Memory attribute (MAIR idx) */
++#define PRLAR_ATTRIDX(val)	(((val) & 0x7) << 1)
++#define PRLAR_EN_BIT		(0x1)
++#define PRLAR_ADDRESS(addr)	((addr) & ~(0x3fULL))
++
++#ifndef __ASSEMBLY__
++
++static inline void setup_el2_mpu_region(uint8_t region, uint64_t base, =
uint64_t limit)
++{
++	asm volatile("msr " __stringify(PRSELR_EL2) ", %0" : : "r" (region));
++	asm volatile("msr " __stringify(PRBAR_EL2) ", %0" : : "r" (base));
++	asm volatile("msr " __stringify(PRLAR_EL2) ", %0" : : "r" (limit));
++
++	asm volatile("isb");
++}
++
++#endif
++
++struct mpu_region {
++	u64 start;
++	u64 end;
++	u64 attrs;
++};
++
++extern struct mpu_region *mpu_mem_map;
++
++#endif /* _ASM_ARMV8_MPU_H_ */
+diff --git a/arch/arm/include/asm/system.h b/arch/arm/include/asm/system=
.h
+index 77aa18909e..deb3158943 100644
+--- a/arch/arm/include/asm/system.h
++++ b/arch/arm/include/asm/system.h
+@@ -94,6 +94,25 @@
+ 				               auth algorithm                 */
+ #define ID_AA64ISAR1_EL1_APA	(0xF << 4)  /* QARMA address auth algorith=
m   */
+=20
++/*
++ * ID_AA64MMFR0_EL1 bits definitions
++ */
++#define ID_AA64MMFR0_EL1_MSA_FRAC_MASK		(0xFUL << 52) /* Memory system
++								 architecture
++								 frac         */
++#define ID_AA64MMFR0_EL1_MSA_FRAC_VMSA		(0x2UL << 52) /* EL1&0 supports
++								 VMSA         */
++#define ID_AA64MMFR0_EL1_MSA_FRAC_PMSA		(0x1UL << 52) /* EL1&0 only
++							         supports PMSA*/
++#define ID_AA64MMFR0_EL1_MSA_FRAC_NO_PMSA	(0x0UL << 52) /* No PMSA
++								 support      */
++#define ID_AA64MMFR0_EL1_MSA_MASK		(0xFUL << 48) /* Memory system
++								 architecture */
++#define ID_AA64MMFR0_EL1_MSA_USE_FRAC		(0xFUL << 48) /* Use MSA_FRAC */
++#define ID_AA64MMFR0_EL1_MSA_VMSA		(0x0UL << 48) /* Memory system
++								 architecture
++								 is VMSA      */
++
+ /*
+  * ID_AA64PFR0_EL1 bits definitions
+  */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
08-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv8-Allow-disabli=
ng-exception-vectors-on-non-SPL-b.patch
new file mode 100644
index 0000000..1f1fac8
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0008-armv=
8-Allow-disabling-exception-vectors-on-non-SPL-b.patch
@@ -0,0 +1,98 @@
+From 377b3d6d79e26e85dabf0fe0726ac179e9229523 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Fri, 10 Dec 2021 11:41:19 +0000
+Subject: [PATCH 08/12] armv8: Allow disabling exception vectors on non-S=
PL
+ builds
+
+On the BASER_FVP, U-Boot shares EL2 with another bootloader, so we do
+not wish to overide the exception vector, but we are also not using an
+SPL build.
+
+Therefore, add ARMV8_EXCEPTION_VECTORS, which disables exception vectors
+in a similar way to ARMV8_SPL_EXCEPTION_VECTORS.
+
+Rename ARMV8_SPL_EXCEPTION_VECTORS -> SPL_ARMV8_EXCEPTION_VECTORS so
+that both config flags be be targeted using CONFIG_IS_ENABLED.
+
+Issue-Id: SCM-3728
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I0cf0fc6d7ef4d45791411cf1f67c65e198cc8b2b
+---
+ arch/arm/cpu/armv8/Kconfig  | 11 ++++++++---
+ arch/arm/cpu/armv8/Makefile |  6 ++----
+ arch/arm/cpu/armv8/start.S  |  4 ++--
+ 3 files changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
+index b7a10a8e34..77dae1f84a 100644
+--- a/arch/arm/cpu/armv8/Kconfig
++++ b/arch/arm/cpu/armv8/Kconfig
+@@ -1,9 +1,8 @@
+ if ARM64
+=20
+-config ARMV8_SPL_EXCEPTION_VECTORS
++config ARMV8_EXCEPTION_VECTORS
+ 	bool "Install crash dump exception vectors"
+-	depends on SPL
+-	default n
++	default y
+ 	help
+ 	  The default exception vector table is only used for the crash
+ 	  dump, but still takes quite a lot of space in the image size.
+@@ -11,6 +10,12 @@ config ARMV8_SPL_EXCEPTION_VECTORS
+ 	  Say N here if you are running out of code space in the image
+ 	  and want to save some space at the cost of less debugging info.
+=20
++config SPL_ARMV8_EXCEPTION_VECTORS
++	bool "Install crash dump exception vectors in the SPL"
++	depends on SPL
++	help
++	  Same as ARMV8_EXCEPTION_VECTORS, but for SPL builds
++
+ config ARMV8_MULTIENTRY
+         bool "Enable multiple CPUs to enter into U-Boot"
+=20
+diff --git a/arch/arm/cpu/armv8/Makefile b/arch/arm/cpu/armv8/Makefile
+index d85ddde430..be2a4b126c 100644
+--- a/arch/arm/cpu/armv8/Makefile
++++ b/arch/arm/cpu/armv8/Makefile
+@@ -13,10 +13,8 @@ ifndef CONFIG_$(SPL_)SYS_DCACHE_OFF
+ obj-y	+=3D cache_v8.o
+ obj-y	+=3D cache.o
+ endif
+-ifdef CONFIG_SPL_BUILD
+-obj-$(CONFIG_ARMV8_SPL_EXCEPTION_VECTORS) +=3D exceptions.o
+-else
+-obj-y	+=3D exceptions.o
++obj-$(CONFIG_$(SPL_)ARMV8_EXCEPTION_VECTORS) +=3D exceptions.o
++ifndef CONFIG_SPL_BUILD
+ obj-y	+=3D exception_level.o
+ endif
+ obj-y	+=3D tlb.o
+diff --git a/arch/arm/cpu/armv8/start.S b/arch/arm/cpu/armv8/start.S
+index 662449156b..2389e4773a 100644
+--- a/arch/arm/cpu/armv8/start.S
++++ b/arch/arm/cpu/armv8/start.S
+@@ -108,7 +108,7 @@ pie_fixup_done:
+ 	bl reset_sctrl
+ #endif
+=20
+-#if defined(CONFIG_ARMV8_SPL_EXCEPTION_VECTORS) || !defined(CONFIG_SPL_=
BUILD)
++#if CONFIG_IS_ENABLED(ARMV8_EXCEPTION_VECTORS)
+ .macro	set_vbar, regname, reg
+ 	msr	\regname, \reg
+ .endm
+@@ -382,7 +382,7 @@ ENDPROC(smp_kick_all_cpus)
+ /*---------------------------------------------------------------------=
--*/
+=20
+ ENTRY(c_runtime_cpu_setup)
+-#if defined(CONFIG_ARMV8_SPL_EXCEPTION_VECTORS) || !defined(CONFIG_SPL_=
BUILD)
++#if CONFIG_IS_ENABLED(ARMV8_EXCEPTION_VECTORS)
+ 	/* Relocate vBAR */
+ 	adr	x0, vectors
+ 	switch_el x1, 3f, 2f, 1f
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
09-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch b/meta-arm-bsp/recipes-bs=
p/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv8-ARMV8_SWITCH_TO_EL1-improve=
ments.patch
new file mode 100644
index 0000000..9bf3e5a
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0009-armv=
8-ARMV8_SWITCH_TO_EL1-improvements.patch
@@ -0,0 +1,163 @@
+From 5facc2d1389074475f90a0713cefe0e3f69379d8 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Wed, 14 Jul 2021 12:44:27 +0100
+Subject: [PATCH 09/12] armv8: ARMV8_SWITCH_TO_EL1 improvements
+
+Convert CONFIG_ARMV8_SWITCH_TO_EL1 to a Kconfig variable.
+
+Add support for switching to EL1 to bootefi.
+
+Add the environment variable armv8_switch_to_el1 to allow configuring
+whether to switch to EL1 at runtime. This overrides the compile-time
+option.
+
+Issue-Id: SCM-3728
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: If98478148d6d8d1f732acac5439276700614815f
+---
+ arch/arm/cpu/armv8/Kconfig           |  8 +++++++
+ arch/arm/cpu/armv8/exception_level.c | 21 ++++++++++++++--
+ arch/arm/lib/bootm.c                 | 36 ++++++++++++++++------------
+ scripts/config_whitelist.txt         |  1 -
+ 4 files changed, 48 insertions(+), 18 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
+index 77dae1f84a..e994c261a1 100644
+--- a/arch/arm/cpu/armv8/Kconfig
++++ b/arch/arm/cpu/armv8/Kconfig
+@@ -179,4 +179,12 @@ config ARMV8_SECURE_BASE
+=20
+ endif
+=20
++config ARMV8_SWITCH_TO_EL1
++	bool "Switch to EL1 before booting the operating system"
++	default n
++	help
++	  Switch to EL1 before booting the operating system, if for example th=
e
++	  operating system does not support booting at EL2, or you wish to pre=
vent
++	  any hypervisors from running. Supported for bootm, booti and bootefi=
.
++
+ endif
+diff --git a/arch/arm/cpu/armv8/exception_level.c b/arch/arm/cpu/armv8/e=
xception_level.c
+index b11936548f..4aad1550f4 100644
+--- a/arch/arm/cpu/armv8/exception_level.c
++++ b/arch/arm/cpu/armv8/exception_level.c
+@@ -40,19 +40,36 @@ static void entry_non_secure(struct jmp_buf_data *no=
n_secure_jmp)
+  * trusted firmware being one embodiment). The operating system shall b=
e
+  * started at exception level EL2. So here we check the exception level
+  * and switch it if necessary.
++ *
++ * If armv8_switch_to_el1 (config or env var) is enabled, also switch t=
o EL1
++ * before booting the operating system.
+  */
+ void switch_to_non_secure_mode(void)
+ {
+ 	struct jmp_buf_data non_secure_jmp;
+=20
+ 	/* On AArch64 we need to make sure we call our payload in < EL3 */
+-	if (current_el() =3D=3D 3) {
++
++	int switch_to_el1 =3D env_get_yesno("armv8_switch_to_el1");
++#ifdef CONFIG_ARMV8_SWITCH_TO_EL1
++	if (switch_to_el1 =3D=3D -1) {
++			switch_to_el1 =3D 1;
++	}
++#endif
++
++	if (current_el() > 2) {
+ 		if (setjmp(&non_secure_jmp))
+ 			return;
+ 		dcache_disable();	/* flush cache before switch to EL2 */
+-
+ 		/* Move into EL2 and keep running there */
+ 		armv8_switch_to_el2((uintptr_t)&non_secure_jmp, 0, 0, 0,
+ 				    (uintptr_t)entry_non_secure, ES_TO_AARCH64);
++	} else if (switch_to_el1 =3D=3D 1 && current_el() > 1) {
++		if (setjmp(&non_secure_jmp))
++			return;
++		dcache_disable();	/* flush cache before switch to EL1 */
++		/* Move into EL1 and keep running there */
++		armv8_switch_to_el1((uintptr_t)&non_secure_jmp, 0, 0, 0,
++				    (uintptr_t)entry_non_secure, ES_TO_AARCH64);
+ 	}
+ }
+diff --git a/arch/arm/lib/bootm.c b/arch/arm/lib/bootm.c
+index f60ee3a7e6..a87dd37664 100644
+--- a/arch/arm/lib/bootm.c
++++ b/arch/arm/lib/bootm.c
+@@ -317,7 +317,6 @@ __weak void update_os_arch_secondary_cores(uint8_t o=
s_arch)
+ {
+ }
+=20
+-#ifdef CONFIG_ARMV8_SWITCH_TO_EL1
+ static void switch_to_el1(void)
+ {
+ 	if ((IH_ARCH_DEFAULT =3D=3D IH_ARCH_ARM64) &&
+@@ -332,7 +331,6 @@ static void switch_to_el1(void)
+ 				    ES_TO_AARCH64);
+ }
+ #endif
+-#endif
+=20
+ /* Subcommand: GO */
+ static void boot_jump_linux(bootm_headers_t *images, int flag)
+@@ -359,21 +357,29 @@ static void boot_jump_linux(bootm_headers_t *image=
s, int flag)
+=20
+ 		update_os_arch_secondary_cores(images->os.arch);
+=20
++		int armv8_switch_to_el1 =3D env_get_yesno("armv8_switch_to_el1");
+ #ifdef CONFIG_ARMV8_SWITCH_TO_EL1
+-		armv8_switch_to_el2((u64)images->ft_addr, 0, 0, 0,
+-				    (u64)switch_to_el1, ES_TO_AARCH64);
+-#else
+-		if ((IH_ARCH_DEFAULT =3D=3D IH_ARCH_ARM64) &&
+-		    (images->os.arch =3D=3D IH_ARCH_ARM))
+-			armv8_switch_to_el2(0, (u64)gd->bd->bi_arch_number,
+-					    (u64)images->ft_addr, 0,
+-					    (u64)images->ep,
+-					    ES_TO_AARCH32);
+-		else
+-			armv8_switch_to_el2((u64)images->ft_addr, 0, 0, 0,
+-					    images->ep,
+-					    ES_TO_AARCH64);
++		if (armv8_switch_to_el1 =3D=3D -1) {
++			armv8_switch_to_el1 =3D 1;
++		}
+ #endif
++		if (armv8_switch_to_el1 =3D=3D 1) {
++			armv8_switch_to_el2((u64)images->ft_addr, 0, 0, 0,
++					    (u64)switch_to_el1, ES_TO_AARCH64);
++		} else {
++			if ((IH_ARCH_DEFAULT =3D=3D IH_ARCH_ARM64) &&
++					(images->os.arch =3D=3D IH_ARCH_ARM))
++				armv8_switch_to_el2(0,
++						    (u64)gd->bd->bi_arch_number,
++						    (u64)images->ft_addr, 0,
++						    (u64)images->ep,
++						    ES_TO_AARCH32);
++			else
++				armv8_switch_to_el2((u64)images->ft_addr,
++						    0, 0, 0,
++						    images->ep,
++						    ES_TO_AARCH64);
++		}
+ 	}
+ #else
+ 	unsigned long machid =3D gd->bd->bi_arch_number;
+diff --git a/scripts/config_whitelist.txt b/scripts/config_whitelist.txt
+index 3dbcc042a8..60455d12e3 100644
+--- a/scripts/config_whitelist.txt
++++ b/scripts/config_whitelist.txt
+@@ -46,7 +46,6 @@ CONFIG_ARMADA168
+ CONFIG_ARMV7_SECURE_BASE
+ CONFIG_ARMV7_SECURE_MAX_SIZE
+ CONFIG_ARMV7_SECURE_RESERVE_SIZE
+-CONFIG_ARMV8_SWITCH_TO_EL1
+ CONFIG_ARM_ARCH_CP15_ERRATA
+ CONFIG_ARM_GIC_BASE_ADDRESS
+ CONFIG_ARM_PL180_MMCI_BASE
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
10-armv8-Make-disabling-HVC-configurable-when-switching.patch b/meta-arm-=
bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0010-armv8-Make-disablin=
g-HVC-configurable-when-switching.patch
new file mode 100644
index 0000000..5ce4485
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0010-armv=
8-Make-disabling-HVC-configurable-when-switching.patch
@@ -0,0 +1,73 @@
+From 8360c16a9261a90944ef922733ae5b56e8eed5a6 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Fri, 10 Dec 2021 16:37:26 +0000
+Subject: [PATCH 10/12] armv8: Make disabling HVC configurable when switc=
hing
+ to EL1
+
+On the BASER_FVP there is no EL3, so HVC is used to provide PSCI
+services. Therefore we cannot disable hypercalls.
+
+Create CONFIG_ARMV8_DISABLE_HVC (dependent on CONFIG_ARMV8_TO_EL1) to
+control whether to disable HVC exceptions in HCR_EL2->HCD
+
+Issue-Id: SCM-3728
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I463d82f1db8a3cafcab40a9c0c208753569cc300
+---
+ arch/arm/cpu/armv8/Kconfig   |  9 +++++++++
+ arch/arm/include/asm/macro.h | 10 ++++++++--
+ 2 files changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/cpu/armv8/Kconfig b/arch/arm/cpu/armv8/Kconfig
+index e994c261a1..cd49529346 100644
+--- a/arch/arm/cpu/armv8/Kconfig
++++ b/arch/arm/cpu/armv8/Kconfig
+@@ -187,4 +187,13 @@ config ARMV8_SWITCH_TO_EL1
+ 	  operating system does not support booting at EL2, or you wish to pre=
vent
+ 	  any hypervisors from running. Supported for bootm, booti and bootefi=
.
+=20
++config ARMV8_DISABLE_HVC
++	bool "Disable HVC calls before switching to EL1"
++	depends on ARMV8_SWITCH_TO_EL1
++	default y
++	help
++	  If switching to EL1 before loading the operating system, disable tak=
ing
++	  hypercalls back to EL2. May be disabled if, for example, PSCI servic=
es are
++	  running at EL2.
++
+ endif
+diff --git a/arch/arm/include/asm/macro.h b/arch/arm/include/asm/macro.h
+index 5ee72d0e78..d6b5d7d7f3 100644
+--- a/arch/arm/include/asm/macro.h
++++ b/arch/arm/include/asm/macro.h
+@@ -293,9 +293,12 @@ lr	.req	x30
+ 	ldr	\tmp2, =3D(ID_AA64ISAR1_EL1_GPI | ID_AA64ISAR1_EL1_GPA | \
+ 		      ID_AA64ISAR1_EL1_API | ID_AA64ISAR1_EL1_APA)
+ 	tst	\tmp, \tmp2
+-	mov	\tmp2, #(HCR_EL2_RW_AARCH64 | HCR_EL2_HCD_DIS)
++	mov	\tmp2, #(HCR_EL2_RW_AARCH64)
+ 	orr	\tmp, \tmp2, #(HCR_EL2_APK | HCR_EL2_API)
+ 	csel	\tmp, \tmp2, \tmp, eq
++#ifdef CONFIG_ARMV8_DISABLE_HVC
++	orr	\tmp, \tmp, #(HCR_EL2_HCD_DIS)
++#endif
+ 	msr	hcr_el2, \tmp
+=20
+ 	/* Return to the EL1_SP1 mode from EL2 */
+@@ -308,7 +311,10 @@ lr	.req	x30
+=20
+ 1:
+ 	/* Initialize HCR_EL2 */
+-	ldr	\tmp, =3D(HCR_EL2_RW_AARCH32 | HCR_EL2_HCD_DIS)
++	ldr	\tmp, =3D(HCR_EL2_RW_AARCH32)
++#ifdef CONFIG_ARMV8_DISABLE_HVC
++	orr	\tmp, \tmp, #(HCR_EL2_HCD_DIS)
++#endif
+ 	msr	hcr_el2, \tmp
+=20
+ 	/* Return to AArch32 Supervisor mode from EL2 */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
11-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch b/meta-arm-bsp/recipes-b=
sp/u-boot/u-boot/fvp-baser-aemv8r64/0011-vexpress64-Do-not-set-COUNTER_FR=
EQUENCY.patch
new file mode 100644
index 0000000..0f4f0a4
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0011-vexp=
ress64-Do-not-set-COUNTER_FREQUENCY.patch
@@ -0,0 +1,37 @@
+From 3362e6910fe3f4d431b4034299f1b8d79a45e693 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Fri, 10 Dec 2021 15:09:09 +0000
+Subject: [PATCH 11/12] vexpress64: Do not set COUNTER_FREQUENCY
+
+VExpress boards normally run as a second-stage bootloader so should not
+need to modify CNTFRQ_EL0. On the BASER_FVP, U-Boot can modify it if
+running at EL2, but shouldn't because it might be different from the
+value being used by the first-stage bootloader (which might be
+providing PSCI services).
+
+Issue-Id: SCM-3728
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: I137473d721e58e4c348b9641f5b9778178d3bb65
+---
+ include/configs/vexpress_aemv8.h | 3 ---
+ 1 file changed, 3 deletions(-)
+
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index 68422237dd..567a6dbf36 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -70,9 +70,6 @@
+ #define V2M_SYS_CFGCTRL			(V2M_SYSREGS + 0x0a4)
+ #define V2M_SYS_CFGSTAT			(V2M_SYSREGS + 0x0a8)
+=20
+-/* Generic Timer Definitions */
+-#define COUNTER_FREQUENCY		24000000	/* 24MHz */
+-
+ /* Generic Interrupt Controller Definitions */
+ #ifdef CONFIG_GICV3
+ #define GICD_BASE			(V2M_PA_BASE + 0x2f000000)
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/00=
12-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch b/meta-arm-bsp/r=
ecipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0012-vexpress64-Add-BASER_FVP=
-vexpress-board-variant.patch
new file mode 100644
index 0000000..787e79b
--- /dev/null
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-baser-aemv8r64/0012-vexp=
ress64-Add-BASER_FVP-vexpress-board-variant.patch
@@ -0,0 +1,275 @@
+From fdc36eaf590bfadfa184ccf589076e0b3420b859 Mon Sep 17 00:00:00 2001
+From: Peter Hoyes <Peter.Hoyes@arm.com>
+Date: Mon, 24 May 2021 11:47:53 +0100
+Subject: [PATCH 12/12] vexpress64: Add BASER_FVP vexpress board variant
+
+The BASER_FVP board variant is implemented on top of the BASE_FVP board
+config (which, in turn, is based on the Juno Versatile Express board
+config). They all share a similar memory map - for BASER_FVP the map is
+inverted from the BASE_FVP
+(https://developer.arm.com/documentation/100964/1114/Base-Platform/Base-=
--memory/BaseR-Platform-memory-map)
+
+ * Create new TARGET_VEXPRESS64_BASER_FVP target, which uses the same
+   board config as BASE_FVP and JUNO
+ * Implement inverted memory map in vexpress_aemv8.h
+ * Create vexpress_aemv8r defconfig
+ * Provide MPU and MMU memory maps for the BASER_FVP
+ * Provide default value for LNX_KRNL_IMG_TEXT_OFFSET_BASE
+ * Update vexpress64 documentation
+
+Issue-Id: SCM-3728
+Upstream-Status: Inappropriate [other]
+  Temporary patch
+Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
+Change-Id: Id173e52afad473abcf3f61c6bf374fc31f17edd3
+---
+ arch/arm/Kconfig                     |  8 +++++
+ board/armltd/vexpress64/Kconfig      |  6 +++-
+ board/armltd/vexpress64/MAINTAINERS  |  7 ++++
+ board/armltd/vexpress64/vexpress64.c | 52 ++++++++++++++++++++++++++++
+ configs/vexpress_aemv8r_defconfig    | 27 +++++++++++++++
+ doc/board/armltd/vexpress64.rst      |  1 +
+ include/configs/vexpress_aemv8.h     | 42 ++++++++++++++++++++++
+ 7 files changed, 142 insertions(+), 1 deletion(-)
+ create mode 100644 configs/vexpress_aemv8r_defconfig
+
+diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
+index 0448787b8b..7bf39264e3 100644
+--- a/arch/arm/Kconfig
++++ b/arch/arm/Kconfig
+@@ -1157,6 +1157,14 @@ config TARGET_VEXPRESS64_BASE_FVP
+ 	select PL01X_SERIAL
+ 	select SEMIHOSTING
+=20
++config TARGET_VEXPRESS64_BASER_FVP
++	bool "Support Versatile Express ARMv8r64 FVP BASE model"
++	select ARM64
++	select DM
++	select DM_SERIAL
++	select PL01X_SERIAL
++	select LINUX_KERNEL_IMAGE_HEADER
++
+ config TARGET_VEXPRESS64_JUNO
+ 	bool "Support Versatile Express Juno Development Platform"
+ 	select ARM64
+diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
+index 4aab3f092e..e824173fe1 100644
+--- a/board/armltd/vexpress64/Kconfig
++++ b/board/armltd/vexpress64/Kconfig
+@@ -1,4 +1,5 @@
+-if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
++if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || \
++	TARGET_VEXPRESS64_BASER_FVP
+=20
+ config SYS_BOARD
+ 	default "vexpress64"
+@@ -16,4 +17,7 @@ config JUNO_DTB_PART
+ 	  The ARM partition name in the NOR flash memory holding the
+ 	  device tree blob to configure U-Boot.
+=20
++config LNX_KRNL_IMG_TEXT_OFFSET_BASE
++    default 0x0
++
+ endif
+diff --git a/board/armltd/vexpress64/MAINTAINERS b/board/armltd/vexpress=
64/MAINTAINERS
+index 0ba044d7ff..e89d9711b8 100644
+--- a/board/armltd/vexpress64/MAINTAINERS
++++ b/board/armltd/vexpress64/MAINTAINERS
+@@ -14,3 +14,10 @@ JUNO DEVELOPMENT PLATFORM BOARD
+ M:	Linus Walleij <linus.walleij@linaro.org>
+ S:	Maintained
+ F:	configs/vexpress_aemv8a_juno_defconfig
++
++VEXPRESS_AEMV8R BOARD
++M:	Diego Sueiro <diego.sueiro@arm.com>
++M:	Peter Hoyes <peter.hoyes@arm.com>
++R:	Andre Przywara <andre.przywara@arm.com>
++S:	Maintained
++F:	configs/vexpress_aemv8r_defconfig
+diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
+index 821f9cfc3b..07c76609ab 100644
+--- a/board/armltd/vexpress64/vexpress64.c
++++ b/board/armltd/vexpress64/vexpress64.c
+@@ -18,6 +18,7 @@
+ #include <dm/platform_data/serial_pl01x.h>
+ #include "pcie.h"
+ #include <asm/armv8/mmu.h>
++#include <asm/armv8/mpu.h>
+ #ifdef CONFIG_VIRTIO_NET
+ #include <virtio_types.h>
+ #include <virtio.h>
+@@ -36,6 +37,56 @@ U_BOOT_DRVINFO(vexpress_serials) =3D {
+ 	.plat =3D &serial_plat,
+ };
+=20
++#ifdef CONFIG_TARGET_VEXPRESS64_BASER_FVP
++
++static struct mpu_region vexpress64_aemv8r_mem_map[] =3D {
++       {
++               .start =3D 0x0UL,
++               .end =3D 0x7fffffffUL,
++               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++       }, {
++               .start =3D 0x80000000UL,
++               .end =3D 0xffffffffUL,
++               .attrs =3D PRLAR_ATTRIDX(MT_DEVICE_NGNRNE)
++       }, {
++               .start =3D 0x100000000UL,
++               .end =3D 0xffffffffffUL,
++               .attrs =3D PRLAR_ATTRIDX(MT_NORMAL)
++       }, {
++               /* List terminator */
++               0,
++       }
++};
++
++struct mpu_region *mpu_mem_map =3D vexpress64_aemv8r_mem_map;
++
++static struct mm_region vexpress64_mem_map[] =3D {
++	{
++		.virt =3D 0x0UL,
++		.phys =3D 0x0UL,
++		.size =3D 0x80000000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
++			 PTE_BLOCK_INNER_SHARE
++	}, {
++		.virt =3D 0x80000000UL,
++		.phys =3D 0x80000000UL,
++		.size =3D 0x80000000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
++			 PTE_BLOCK_NON_SHARE |
++			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
++	},
++	{
++		.virt =3D 0x100000000UL,
++		.phys =3D 0x100000000UL,
++		.size =3D 0xff00000000UL,
++		.attrs =3D PTE_BLOCK_MEMTYPE(MT_NORMAL) |
++			 PTE_BLOCK_INNER_SHARE
++	}, {
++		/* List terminator */
++		0,
++	}
++};
++#else
+ static struct mm_region vexpress64_mem_map[] =3D {
+ 	{
+ 		.virt =3D 0x0UL,
+@@ -55,6 +106,7 @@ static struct mm_region vexpress64_mem_map[] =3D {
+ 		0,
+ 	}
+ };
++#endif
+=20
+ struct mm_region *mem_map =3D vexpress64_mem_map;
+=20
+diff --git a/configs/vexpress_aemv8r_defconfig b/configs/vexpress_aemv8r=
_defconfig
+new file mode 100644
+index 0000000000..37c393b66f
+--- /dev/null
++++ b/configs/vexpress_aemv8r_defconfig
+@@ -0,0 +1,27 @@
++CONFIG_ARM=3Dy
++CONFIG_TARGET_VEXPRESS64_BASER_FVP=3Dy
++CONFIG_SYS_TEXT_BASE=3D0x00080000
++CONFIG_POSITION_INDEPENDENT=3Dy
++CONFIG_SYS_LOAD_ADDR=3D0x10000000
++CONFIG_SYS_MALLOC_F_LEN=3D0x2000
++CONFIG_NR_DRAM_BANKS=3D2
++CONFIG_ENV_SIZE=3D0x40000
++CONFIG_ENV_SECT_SIZE=3D0x40000
++CONFIG_IDENT_STRING=3D" vexpress_aemv8r64"
++CONFIG_DISTRO_DEFAULTS=3Dy
++CONFIG_BOOTDELAY=3D3
++CONFIG_USE_BOOTARGS=3Dy
++CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x9c090000 rootfs=
type=3Dext4 root=3D/dev/vda2 rw rootwait"
++# CONFIG_USE_BOOTCOMMAND is not set
++# CONFIG_DISPLAY_CPUINFO is not set
++CONFIG_SYS_PROMPT=3D"VExpress64# "
++CONFIG_DM_ETH=3Dy
++CONFIG_OF_CONTROL=3Dy
++CONFIG_OF_BOARD=3Dy
++CONFIG_VIRTIO_MMIO=3Dy
++CONFIG_VIRTIO_BLK=3Dy
++CONFIG_VIRTIO_NET=3Dy
++CONFIG_ARMV8_SWITCH_TO_EL1=3Dy
++CONFIG_ARMV8_DISABLE_HVC=3Dn
++CONFIG_ARMV8_EXCEPTION_VECTORS=3Dn
++CONFIG_ARCH_FIXUP_FDT_MEMORY=3Dn
+diff --git a/doc/board/armltd/vexpress64.rst b/doc/board/armltd/vexpress=
64.rst
+index b98b096544..b8efbc1565 100644
+--- a/doc/board/armltd/vexpress64.rst
++++ b/doc/board/armltd/vexpress64.rst
+@@ -6,6 +6,7 @@ Arm Versatile Express
+ The vexpress_* board configuration supports the following platforms:
+=20
+  * FVP_Base_RevC-2xAEMvA
++ * FVP_BaseR_AEMv8R
+  * Juno development board
+=20
+ Fixed Virtual Platforms
+diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
+index 567a6dbf36..d0173735db 100644
+--- a/include/configs/vexpress_aemv8.h
++++ b/include/configs/vexpress_aemv8.h
+@@ -22,8 +22,13 @@
+ #define CONFIG_SYS_BOOTM_LEN (64 << 20)      /* Increase max gunzip siz=
e */
+=20
+ /* CS register bases for the original memory map. */
++#ifdef CONFIG_TARGET_VEXPRESS64_BASER_FVP
++#define V2M_BASE			0x00000000
++#define V2M_PA_BASE			0x80000000
++#else
+ #define V2M_BASE			0x80000000
+ #define V2M_PA_BASE			0x00000000
++#endif
+=20
+ #define V2M_PA_CS0			(V2M_PA_BASE + 0x00000000)
+ #define V2M_PA_CS1			(V2M_PA_BASE + 0x14000000)
+@@ -205,6 +210,43 @@
+ 				"fi"
+ #endif
+=20
++#elif CONFIG_TARGET_VEXPRESS64_BASER_FVP
++
++#define BOOTENV_DEV_MEM(devtypeu, devtypel, instance) \
++	"bootcmd_mem=3D " \
++		"source ${scriptaddr}; " \
++		"if test $? -eq 1; then " \
++		"  env import -t ${scriptaddr}; " \
++		"  if test -n $uenvcmd; then " \
++		"    echo Running uenvcmd ...; " \
++		"    run uenvcmd; " \
++		"  fi; " \
++		"fi\0"
++#define BOOTENV_DEV_NAME_MEM(devtypeu, devtypel, instance) "mem "
++
++#define BOOT_TARGET_DEVICES(func)	\
++	func(MEM, mem, na)		\
++	func(VIRTIO, virtio, 0)		\
++	func(PXE, pxe, na)		\
++	func(DHCP, dhcp, na)
++
++#include <config_distro_bootcmd.h>
++
++#define VEXPRESS_KERNEL_ADDR		0x00200000
++#define VEXPRESS_PXEFILE_ADDR		0x0fb00000
++#define VEXPRESS_FDT_ADDR		0x0fc00000
++#define VEXPRESS_SCRIPT_ADDR		0x0fd00000
++#define VEXPRESS_RAMDISK_ADDR		0x0fe00000
++
++#define CONFIG_EXTRA_ENV_SETTINGS       \
++		"kernel_addr_r=3D" __stringify(VEXPRESS_KERNEL_ADDR) "\0" \
++		"pxefile_addr_r=3D" __stringify(VEXPRESS_PXEFILE_ADDR) "\0" \
++		"fdt_addr_r=3D" __stringify(VEXPRESS_FDT_ADDR) "\0" \
++		"fdtfile=3Dboard.dtb\0" \
++		"scriptaddr=3D" __stringify(VEXPRESS_SCRIPT_ADDR) "\0"  \
++		"ramdisk_addr_r=3D" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
++		BOOTENV
++
+ #endif
+=20
+ /* Monitor Command Prompt */
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 88cf595..2eef58c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -75,3 +75,21 @@ SRC_URI:append:fvp-base =3D " file://bootargs.cfg"
 # FVP BASE ARM32
 #
 SRC_URI:append:fvp-base-arm32 =3D " file://0001-Add-vexpress_aemv8a_aarc=
h32-variant.patch"
+
+#
+# FVP BASER
+#
+SRC_URI:append:fvp-baser-aemv8r64 =3D " \
+    file://0001-armv8-Disable-pointer-authentication-traps-for-EL1.patch=
 \
+    file://0002-doc-Add-documentation-for-the-Arm-VExpress64-board-c.pat=
ch \
+    file://0003-vexpress64-Refactor-header-file-to-make-it-easier-to.pat=
ch \
+    file://0004-vexpress64-Clean-up-BASE_FVP-boot-configuration.patch \
+    file://0005-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for-VExpre.pat=
ch \
+    file://0006-vexpress64-Enable-VIRTIO_NET-network-driver.patch \
+    file://0007-armv8-Add-ARMv8-MPU-configuration-logic.patch \
+    file://0008-armv8-Allow-disabling-exception-vectors-on-non-SPL-b.pat=
ch \
+    file://0009-armv8-ARMV8_SWITCH_TO_EL1-improvements.patch \
+    file://0010-armv8-Make-disabling-HVC-configurable-when-switching.pat=
ch \
+    file://0011-vexpress64-Do-not-set-COUNTER_FREQUENCY.patch \
+    file://0012-vexpress64-Add-BASER_FVP-vexpress-board-variant.patch \
+    "
--=20
2.25.1


