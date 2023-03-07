Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E0E2C678D5
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 16:17:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.19392.1678205816411324675
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 07 Mar 2023 08:16:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57485113E
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 08:17:39 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C13613F67D
	for <meta-arm@lists.yoctoproject.org>; Tue,  7 Mar 2023 08:16:55 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/fvp-base-arm32: remove support
Date: Tue,  7 Mar 2023 11:16:49 -0500
Message-Id: <20230307161650.476217-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230307161650.476217-1-jon.mason@arm.com>
References: <20230307161650.476217-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 07 Mar 2023 16:17:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4479

fvp-base-arm32 isn't a real machine and supporting it has become hacky.
Drop support and remove from meta-arm-bsp

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |   7 -
 ci/fvp-base-arm32.yml                         |   7 -
 meta-arm-bsp/conf/machine/fvp-base-arm32.conf |  23 ---
 meta-arm-bsp/documentation/fvp-base-arm32.md  |  30 ---
 .../trusted-firmware-a-fvp-arm32.inc          |  12 --
 .../trusted-firmware-a_2.8.%.bbappend         |   1 -
 ...-Add-vexpress_aemv8a_aarch32-variant.patch | 184 ------------------
 ...4-Enable-OF_CONTROL-and-OF_BOARD-for.patch | 111 -----------
 .../recipes-bsp/u-boot/u-boot_%.bbappend      |   7 -
 .../bsp/arm-platforms/fvp-arm32-standard.scc  |   8 -
 .../bsp/arm-platforms/fvp-arm32.scc           |  14 --
 .../bsp/arm-platforms/fvp-arm32/fvp-board.cfg |  12 --
 .../arm-platforms/fvp-arm32/fvp-features.cfg  |   9 -
 .../0001-ARM-vexpress-enable-GICv3.patch      |  31 ---
 .../linux/linux-arm-platforms.inc             |  16 --
 15 files changed, 472 deletions(-)
 delete mode 100644 ci/fvp-base-arm32.yml
 delete mode 100644 meta-arm-bsp/conf/machine/fvp-base-arm32.conf
 delete mode 100644 meta-arm-bsp/documentation/fvp-base-arm32.md
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-fvp-arm32.inc
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32=
/0001-Add-vexpress_aemv8a_aarch32-variant.patch
 delete mode 100644 meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32=
/0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp-arm32-standard.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp-arm32.scc
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp-arm32/fvp-board.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta=
/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
 delete mode 100644 meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm3=
2/0001-ARM-vexpress-enable-GICv3.patch

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 75d36094..9036efbd 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -101,13 +101,6 @@ fvp-base:
     matrix:
       - TESTING: testimage
=20
-fvp-base-arm32:
-  extends: .build
-  parallel:
-    matrix:
-      - TOOLCHAINS: [gcc, external-gccarm]
-        TESTING: testimage
-
 fvp-baser-aemv8r64:
   extends: .build
   parallel:
diff --git a/ci/fvp-base-arm32.yml b/ci/fvp-base-arm32.yml
deleted file mode 100644
index 9f790f67..00000000
--- a/ci/fvp-base-arm32.yml
+++ /dev/null
@@ -1,7 +0,0 @@
-header:
-  version: 11
-  includes:
-    - ci/base.yml
-    - ci/fvp.yml
-
-machine: fvp-base-arm32
diff --git a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf b/meta-arm-bsp=
/conf/machine/fvp-base-arm32.conf
deleted file mode 100644
index d3452b74..00000000
--- a/meta-arm-bsp/conf/machine/fvp-base-arm32.conf
+++ /dev/null
@@ -1,23 +0,0 @@
-# Configuration for Armv7-A Base Platform FVP
-
-#@TYPE: Machine
-#@NAME: Armv7-A Base Platform FVP machine
-#@DESCRIPTION: Machine configuration for Armv7-A Base Platform FVP model
-
-require conf/machine/include/fvp-common.inc
-require conf/machine/include/arm/arch-armv7a.inc
-
-# FVP u-boot configuration
-PREFERRED_VERSION_u-boot ?=3D "2022.04"
-UBOOT_MACHINE =3D "vexpress_aemv8a_aarch32_defconfig"
-
-KERNEL_IMAGETYPE =3D "zImage"
-
-FVP_CONFIG[cluster0.cpu0.CONFIG64] =3D "0"
-FVP_CONFIG[cluster0.cpu1.CONFIG64] =3D "0"
-FVP_CONFIG[cluster0.cpu2.CONFIG64] =3D "0"
-FVP_CONFIG[cluster0.cpu3.CONFIG64] =3D "0"
-FVP_CONFIG[cluster1.cpu0.CONFIG64] =3D "0"
-FVP_CONFIG[cluster1.cpu1.CONFIG64] =3D "0"
-FVP_CONFIG[cluster1.cpu2.CONFIG64] =3D "0"
-FVP_CONFIG[cluster1.cpu3.CONFIG64] =3D "0"
diff --git a/meta-arm-bsp/documentation/fvp-base-arm32.md b/meta-arm-bsp/=
documentation/fvp-base-arm32.md
deleted file mode 100644
index 141e61f3..00000000
--- a/meta-arm-bsp/documentation/fvp-base-arm32.md
+++ /dev/null
@@ -1,30 +0,0 @@
-# Armv8-A Base Platform FVP (32-bit) Support in meta-arm-bsp
-
-## Howto Build and Run
-
-### Configuration:
-In the local.conf file, `MACHINE` should be set:
-```
-MACHINE =3D "fvp-base-arm32"
-```
-
-### Build:
-```
-$ bitbake core-image-base
-```
-
-### Run:
-The `fvp-base` machine has support for the `runfvp` script, so running i=
s simple:
-
-```
-$ runfvp tmp/deploy/images/fvp-base-arm32/core-image-base-fvp-base-arm32=
.fvpconf
-```
-## Devices supported in the kernel
-- serial
-- virtio disk
-- network
-- watchdog
-- rtc
-
-## Devices not supported or not functional
-None
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp-arm32.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fi=
rmware-a-fvp-arm32.inc
deleted file mode 100644
index fdaadb9f..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp-=
arm32.inc
+++ /dev/null
@@ -1,12 +0,0 @@
-# Armv7-A FVP specific TFA parameters
-
-COMPATIBLE_MACHINE =3D "fvp-base-arm32"
-TFA_PLATFORM =3D "fvp"
-TFA_UBOOT =3D "1"
-TFA_BUILD_TARGET =3D "dtbs bl1 bl32 fip"
-
-EXTRA_OEMAKE:append =3D " \
-    ARCH=3Daarch32 \
-    AARCH32_SP=3Dsp_min \
-    "
-
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.8.%.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a_2.8.%.bbappend
index 09ed3f79..220dd6e3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.8.=
%.bbappend
@@ -6,7 +6,6 @@ MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE:corstone500 =3D "trusted-firmware-a-corstone500.inc"
 MACHINE_TFA_REQUIRE:corstone1000 =3D "trusted-firmware-a-corstone1000.in=
c"
 MACHINE_TFA_REQUIRE:fvp-base =3D "trusted-firmware-a-fvp.inc"
-MACHINE_TFA_REQUIRE:fvp-base-arm32 =3D "trusted-firmware-a-fvp-arm32.inc=
"
 MACHINE_TFA_REQUIRE:juno =3D "trusted-firmware-a-juno.inc"
 MACHINE_TFA_REQUIRE:n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE:sgi575 =3D "trusted-firmware-a-sgi575.inc"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-A=
dd-vexpress_aemv8a_aarch32-variant.patch b/meta-arm-bsp/recipes-bsp/u-boo=
t/u-boot/fvp-base-arm32/0001-Add-vexpress_aemv8a_aarch32-variant.patch
deleted file mode 100644
index 5138335e..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0001-Add-vexp=
ress_aemv8a_aarch32-variant.patch
+++ /dev/null
@@ -1,184 +0,0 @@
-From 424d186ab0a0c4dd62dfb13ac87e8d1fd26c101e Mon Sep 17 00:00:00 2001
-From: Anders Dellien <anders.dellien@arm.com>
-Date: Thu, 23 Jul 2020 17:32:55 +0100
-Subject: [PATCH 1/2] Add vexpress_aemv8a_aarch32 variant
-
-The ARM AEMv8 FVP model can be run in Aarch64 or Aarch32 mode. Aarch32
-support is enable per-CPU when launching the model, eg:
-
--C cluster0.cpu0.CONFIG64=3D0
-
-This patch adds a new defconfig and some variant specific selections in
-vexpress_armv8a.h.
-
-This patch is co-authored with Soby Mathew <Soby.Mathew@arm.com>.
-
-Upstream-Status: Denied
-
-For upstream discussion, please visit
-https://www.mail-archive.com/u-boot@lists.denx.de/msg233429.html
-
-Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
-Signed-off-by: Asha R <asha.r@arm.com>
-Signed-off-by: Anders Dellien <anders.dellien@arm.com>
----
- arch/arm/Kconfig                          |  5 +++
- board/armltd/vexpress64/Kconfig           |  2 +-
- configs/vexpress_aemv8a_aarch32_defconfig | 40 ++++++++++++++++++
- include/configs/vexpress_aemv8.h          | 50 +++++++++++++++--------
- 4 files changed, 80 insertions(+), 17 deletions(-)
- create mode 100644 configs/vexpress_aemv8a_aarch32_defconfig
-
-diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
-index 4567c183fb84..99cc414d6760 100644
---- a/arch/arm/Kconfig
-+++ b/arch/arm/Kconfig
-@@ -1250,6 +1250,11 @@ config TARGET_VEXPRESS64_BASE_FVP
- 	select PL01X_SERIAL
- 	select SEMIHOSTING
-=20
-+config TARGET_VEXPRESS64_BASE_FVP_AARCH32
-+        bool "Support Versatile Express ARMv8a 32-bit FVP BASE model"
-+        select CPU_V7A
-+        select SEMIHOSTING
-+
- config TARGET_VEXPRESS64_JUNO
- 	bool "Support Versatile Express Juno Development Platform"
- 	select ARM64
-diff --git a/board/armltd/vexpress64/Kconfig b/board/armltd/vexpress64/K=
config
-index 4aab3f092ecb..0a5e3fcc004a 100644
---- a/board/armltd/vexpress64/Kconfig
-+++ b/board/armltd/vexpress64/Kconfig
-@@ -1,4 +1,4 @@
--if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO
-+if TARGET_VEXPRESS64_BASE_FVP || TARGET_VEXPRESS64_JUNO || TARGET_VEXPR=
ESS64_BASE_FVP_AARCH32
-=20
- config SYS_BOARD
- 	default "vexpress64"
-diff --git a/configs/vexpress_aemv8a_aarch32_defconfig b/configs/vexpres=
s_aemv8a_aarch32_defconfig
-new file mode 100644
-index 000000000000..9c5c3367ec4d
---- /dev/null
-+++ b/configs/vexpress_aemv8a_aarch32_defconfig
-@@ -0,0 +1,40 @@
-+CONFIG_ARM=3Dy
-+CONFIG_SYS_ARCH_TIMER=3Dy
-+CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32=3Dy
-+CONFIG_SYS_TEXT_BASE=3D0x88000000
-+CONFIG_SYS_MALLOC_F_LEN=3D0x2000
-+CONFIG_NR_DRAM_BANKS=3D2
-+CONFIG_IDENT_STRING=3D" vexpress_aemv8a fvp aarch32"
-+CONFIG_REMAKE_ELF=3Dy
-+CONFIG_SYS_LOAD_ADDR=3D0x90000000
-+CONFIG_BOOTDELAY=3D1
-+CONFIG_USE_BOOTARGS=3Dy
-+CONFIG_BOOTARGS=3D"console=3DttyAMA0 earlycon=3Dpl011,0x1c090000 debug =
user_debug=3D31 systemd.log_target=3Dnull root=3D/dev/vda1 rw androidboot=
.hardware=3Dfvpbase rootwait loglevel=3D9"
-+# CONFIG_DISPLAY_CPUINFO is not set
-+# CONFIG_DISPLAY_BOARDINFO is not set
-+CONFIG_HUSH_PARSER=3Dy
-+CONFIG_SYS_PROMPT=3D"fvp32# "
-+# CONFIG_CMD_CONSOLE is not set
-+CONFIG_CMD_BOOTZ=3Dy
-+# CONFIG_CMD_XIMG is not set
-+# CONFIG_CMD_EDITENV is not set
-+# CONFIG_CMD_ENV_EXISTS is not set
-+CONFIG_CMD_MEMTEST=3Dy
-+CONFIG_CMD_ARMFLASH=3Dy
-+# CONFIG_CMD_LOADS is not set
-+# CONFIG_CMD_ITEST is not set
-+# CONFIG_CMD_SETEXPR is not set
-+CONFIG_CMD_DHCP=3Dy
-+# CONFIG_CMD_NFS is not set
-+CONFIG_CMD_MII=3Dy
-+CONFIG_CMD_PING=3Dy
-+CONFIG_CMD_CACHE=3Dy
-+CONFIG_CMD_FAT=3Dy
-+CONFIG_DM=3Dy
-+CONFIG_MTD_NOR_FLASH=3Dy
-+CONFIG_FLASH_CFI_DRIVER=3Dy
-+CONFIG_SYS_FLASH_CFI=3Dy
-+CONFIG_DM_SERIAL=3Dy
-+CONFIG_PL01X_SERIAL=3Dy
-+CONFIG_OF_LIBFDT=3Dy
-+CONFIG_REMAKE_ELF=3Dy
-diff --git a/include/configs/vexpress_aemv8.h b/include/configs/vexpress=
_aemv8.h
-index f0c5ceb3849a..854fbb41bfc1 100644
---- a/include/configs/vexpress_aemv8.h
-+++ b/include/configs/vexpress_aemv8.h
-@@ -86,7 +86,7 @@
- #endif
- #endif /* !CONFIG_GICV3 */
-=20
--#if defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) && !defined(CONFIG_DM_ET=
H)
-+#if (defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || defined(CONFIG_TARGE=
T_VEXPRESS64_BASE_FVP_AARCH32)) && !defined(CONFIG_DM_ETH)
- /* The Vexpress64 BASE_FVP simulator uses SMSC91C111 */
- #define CONFIG_SMC91111			1
- #define CONFIG_SMC91111_BASE		(V2M_PA_BASE + 0x01A000000)
-@@ -114,7 +114,7 @@
- #ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- #define PHYS_SDRAM_2			(0x880000000)
- #define PHYS_SDRAM_2_SIZE		0x180000000
--#elif CONFIG_NR_DRAM_BANKS =3D=3D 2
-+#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP && CONFIG_NR_DRAM_BANKS =3D=3D =
2
- #define PHYS_SDRAM_2			(0x880000000)
- #define PHYS_SDRAM_2_SIZE		0x80000000
- #endif
-@@ -171,23 +171,41 @@
- 				"fdt_addr_r=3D0x80000000\0" \
- 				BOOTENV
-=20
--#elif CONFIG_TARGET_VEXPRESS64_BASE_FVP
-+#elif defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP) || \
-+        defined(CONFIG_TARGET_VEXPRESS64_BASE_FVP_AARCH32)
-=20
--#define VEXPRESS_KERNEL_ADDR	0x80080000
--#define VEXPRESS_FDT_ADDR	0x8fc00000
--#define VEXPRESS_BOOT_ADDR	0x8fd00000
--#define VEXPRESS_RAMDISK_ADDR	0x8fe00000
-+#define VEXPRESS_KERNEL_ADDR   0x80080000
-+#define VEXPRESS_FDT_ADDR      0x8fc00000
-+#define VEXPRESS_BOOT_ADDR     0x8fd00000
-+#define VEXPRESS_RAMDISK_ADDR  0x8fe00000
-=20
--#define CONFIG_EXTRA_ENV_SETTINGS	\
-+#define CONFIG_EXTRA_ENV_SETTINGS      \
- 				"kernel_name=3DImage\0"		\
--				"kernel_addr_r=3D" __stringify(VEXPRESS_KERNEL_ADDR) "\0"	\
--				"ramdisk_name=3Dramdisk.img\0"	\
--				"ramdisk_addr_r=3D" __stringify(VEXPRESS_RAMDISK_ADDR) "\0" \
--				"fdtfile=3Ddevtree.dtb\0"	\
--				"fdt_addr_r=3D" __stringify(VEXPRESS_FDT_ADDR) "\0"	\
--				"boot_name=3Dboot.img\0" \
--				"boot_addr_r=3D" __stringify(VEXPRESS_BOOT_ADDR) "\0"
--
-+                                "kernel_addr_r=3D" __stringify(VEXPRESS=
_KERNEL_ADDR) "\0" \
-+                                "ramdisk_name=3Dramdisk.img\0"    \
-+                                "ramdisk_addr_r=3D" __stringify(VEXPRES=
S_RAMDISK_ADDR) "\0" \
-+                                "fdtfile=3Ddevtree.dtb\0" \
-+                                "fdt_addr_r=3D" __stringify(VEXPRESS_FD=
T_ADDR) "\0"       \
-+                                "boot_name=3Dboot.img\0" \
-+                                "boot_addr_r=3D" __stringify(VEXPRESS_B=
OOT_ADDR) "\0"
-+
-+#ifndef CONFIG_BOOTCOMMAND
-+#define CONFIG_BOOTCOMMAND	"if smhload ${boot_name} ${boot_addr_r}; the=
n " \
-+				"  set bootargs; " \
-+				"  abootimg addr ${boot_addr_r}; " \
-+				"  abootimg get dtb --index=3D0 fdt_addr_r; " \
-+				"  bootm ${boot_addr_r} ${boot_addr_r} " \
-+				"  ${fdt_addr_r}; " \
-+				"else; " \
-+				"  smhload ${kernel_name} ${kernel_addr_r}; " \
-+				"  smhload ${fdtfile} ${fdt_addr_r}; " \
-+				"  smhload ${ramdisk_name} ${initrd_addr_r} "\
-+				"  initrd_end; " \
-+				"  fdt addr ${fdt_addr_r}; fdt resize; " \
-+				"  fdt chosen ${ramdisk_addr_r} ${initrd_end}; " \
-+				"  bootz $kernel_addr_r - $fdt_addr_r; " \
-+				"fi"
-+#endif
- #endif
-=20
- /* Monitor Command Prompt */
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-R=
evert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.patch b/meta-arm-bsp/=
recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-Revert-vexpress64-Enable-OF=
_CONTROL-and-OF_BOARD-for.patch
deleted file mode 100644
index d916d420..00000000
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot/fvp-base-arm32/0002-Revert-v=
express64-Enable-OF_CONTROL-and-OF_BOARD-for.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-From e896d48c57d272327410416887f34ac0db550390 Mon Sep 17 00:00:00 2001
-From: Jon Mason <jdmason@kudzu.us>
-Date: Mon, 13 Jun 2022 10:59:53 -0400
-Subject: [PATCH 2/2] Revert "vexpress64: Enable OF_CONTROL and OF_BOARD =
for
- VExpress64"
-
-This patch only works for aarch64 (as the 'x' registers are not
-available for ARMv7). Since this platform is ARMv7 in the previous
-patch, this either needs to be changed or removed.  I opted to remove
-it, as it doesn't seem to be necessary to boot the virtual hardware.
-Given that the previous patch was rejected upstream, it is not
-appropriate to fix this upstream.
-
-Upstream-Status: Inappropriate
-Signed-off-by: Jon Mason <jon.mason@arm.com>
-
-This reverts commit 2661397464e47d45cd25bbc5e6b9de7594b3268d.
----
- board/armltd/vexpress64/Makefile        |  2 +-
- board/armltd/vexpress64/lowlevel_init.S | 12 ------------
- board/armltd/vexpress64/vexpress64.c    | 26 -------------------------
- 3 files changed, 1 insertion(+), 39 deletions(-)
- delete mode 100644 board/armltd/vexpress64/lowlevel_init.S
-
-diff --git a/board/armltd/vexpress64/Makefile b/board/armltd/vexpress64/=
Makefile
-index 1878fbed4ec9..868dc4f629f2 100644
---- a/board/armltd/vexpress64/Makefile
-+++ b/board/armltd/vexpress64/Makefile
-@@ -3,5 +3,5 @@
- # (C) Copyright 2000-2004
- # Wolfgang Denk, DENX Software Engineering, wd@denx.de.
-=20
--obj-y	:=3D vexpress64.o lowlevel_init.o
-+obj-y	:=3D vexpress64.o
- obj-$(CONFIG_TARGET_VEXPRESS64_JUNO)	+=3D pcie.o
-diff --git a/board/armltd/vexpress64/lowlevel_init.S b/board/armltd/vexp=
ress64/lowlevel_init.S
-deleted file mode 100644
-index 3dcfb85d0e9a..000000000000
---- a/board/armltd/vexpress64/lowlevel_init.S
-+++ /dev/null
-@@ -1,12 +0,0 @@
--/* SPDX-License-Identifier: GPL-2.0 */
--/*
-- * (C) Copyright 2021 Arm Limited
-- */
--
--.global save_boot_params
--save_boot_params:
--
--	adr	x8, prior_stage_fdt_address
--	str	x0, [x8]
--
--	b	save_boot_params_ret
-diff --git a/board/armltd/vexpress64/vexpress64.c b/board/armltd/vexpres=
s64/vexpress64.c
-index 5e22e89824ee..cedab86d984b 100644
---- a/board/armltd/vexpress64/vexpress64.c
-+++ b/board/armltd/vexpress64/vexpress64.c
-@@ -92,15 +92,7 @@ int dram_init_banksize(void)
- 	return 0;
- }
-=20
--/* Assigned in lowlevel_init.S
-- * Push the variable into the .data section so that it
-- * does not get cleared later.
-- */
--unsigned long __section(".data") prior_stage_fdt_address;
--
- #ifdef CONFIG_OF_BOARD
--
--#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- #define JUNO_FLASH_SEC_SIZE	(256 * 1024)
- static phys_addr_t find_dtb_in_nor_flash(const char *partname)
- {
-@@ -145,11 +137,9 @@ static phys_addr_t find_dtb_in_nor_flash(const char=
 *partname)
-=20
- 	return ~0;
- }
--#endif
-=20
- void *board_fdt_blob_setup(int *err)
- {
--#ifdef CONFIG_TARGET_VEXPRESS64_JUNO
- 	phys_addr_t fdt_rom_addr =3D find_dtb_in_nor_flash(CONFIG_JUNO_DTB_PAR=
T);
-=20
- 	*err =3D 0;
-@@ -159,22 +149,6 @@ void *board_fdt_blob_setup(int *err)
- 	}
-=20
- 	return (void *)fdt_rom_addr;
--#endif
--
--#ifdef VEXPRESS_FDT_ADDR
--	if (fdt_magic(VEXPRESS_FDT_ADDR) =3D=3D FDT_MAGIC) {
--		*err =3D 0;
--		return (void *)VEXPRESS_FDT_ADDR;
--	}
--#endif
--
--	if (fdt_magic(prior_stage_fdt_address) =3D=3D FDT_MAGIC) {
--		*err =3D 0;
--		return (void *)prior_stage_fdt_address;
--	}
--
--	*err =3D -ENXIO;
--	return NULL;
- }
- #endif
-=20
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend b/meta-arm=
-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
index 10ba76ae..f637fd0c 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_%.bbappend
@@ -53,13 +53,6 @@ SRC_URI:append:fvp-base =3D " file://bootargs.cfg \
 	file://0001-Revert-vexpress64-pick-DRAM-size-from-DT.patch \
 	"
=20
-#
-# FVP BASE ARM32
-#
-SRC_URI:append:fvp-base-arm32 =3D " file://0001-Add-vexpress_aemv8a_aarc=
h32-variant.patch \
-				  file://0002-Revert-vexpress64-Enable-OF_CONTROL-and-OF_BOARD-for.p=
atch \
-				"
-
 #
 # FVP BASER
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-arm32-standard.scc b/meta-arm-bsp/recipes-kernel/linux/ar=
m-platforms-kmeta/bsp/arm-platforms/fvp-arm32-standard.scc
deleted file mode 100644
index 65690274..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32-standard.scc
+++ /dev/null
@@ -1,8 +0,0 @@
-define KMACHINE fvp-arm32
-define KTYPE standard
-define KARCH arm
-
-include ktypes/standard/standard.scc
-
-include fvp-arm32.scc
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-arm32.scc b/meta-arm-bsp/recipes-kernel/linux/arm-platfor=
ms-kmeta/bsp/arm-platforms/fvp-arm32.scc
deleted file mode 100644
index ff7ce572..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32.scc
+++ /dev/null
@@ -1,14 +0,0 @@
-include features/input/input.scc
-include features/net/net.scc
-include cfg/timer/no_hz.scc
-include cfg/virtio.scc
-
-kconf hardware fvp-arm32/fvp-board.cfg
-kconf hardware fvp-arm32/fvp-features.cfg
-kconf hardware fvp/fvp-net.cfg
-kconf hardware fvp/fvp-rtc.cfg
-kconf hardware fvp/fvp-serial.cfg
-kconf hardware fvp/fvp-cfi.cfg
-kconf hardware fvp/fvp-drm.cfg
-kconf hardware fvp/fvp-timer.cfg
-kconf hardware fvp/fvp-watchdog.cfg
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-arm32/fvp-board.cfg b/meta-arm-bsp/recipes-kernel/linux/a=
rm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-board.cfg
deleted file mode 100644
index e49a1e36..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32/fvp-board.cfg
+++ /dev/null
@@ -1,12 +0,0 @@
-CONFIG_ARM=3Dy
-
-CONFIG_ARCH_VEXPRESS=3Dy
-CONFIG_SMP=3Dy
-CONFIG_NR_CPUS=3D8
-CONFIG_HOTPLUG_CPU=3Dy
-
-CONFIG_REGULATOR=3Dy
-CONFIG_REGULATOR_FIXED_VOLTAGE=3Dy
-
-CONFIG_CPU_IDLE=3Dy
-CONFIG_ARM_CPUIDLE=3Dy
diff --git a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/ar=
m-platforms/fvp-arm32/fvp-features.cfg b/meta-arm-bsp/recipes-kernel/linu=
x/arm-platforms-kmeta/bsp/arm-platforms/fvp-arm32/fvp-features.cfg
deleted file mode 100644
index 12e76971..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/arm-platforms-kmeta/bsp/arm-platf=
orms/fvp-arm32/fvp-features.cfg
+++ /dev/null
@@ -1,9 +0,0 @@
-CONFIG_BINFMT_MISC=3Dy
-CONFIG_BOUNCE=3Dy
-CONFIG_HIGHMEM=3Dy
-CONFIG_HIGHPTE=3Dy
-CONFIG_KERNEL_MODE_NEON=3Dy
-CONFIG_NEON=3Dy
-CONFIG_VFP=3Dy
-CONFIG_VFPv3=3Dy
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-=
ARM-vexpress-enable-GICv3.patch b/meta-arm-bsp/recipes-kernel/linux/files=
/fvp-base-arm32/0001-ARM-vexpress-enable-GICv3.patch
deleted file mode 100644
index 184a7631..00000000
--- a/meta-arm-bsp/recipes-kernel/linux/files/fvp-base-arm32/0001-ARM-vex=
press-enable-GICv3.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 9fe529a146f4528ec80a3d04588e387f3651dc22 Mon Sep 17 00:00:00 2001
-From: Ryan Harkin <ryan.harkin@linaro.org>
-Date: Wed, 16 Nov 2016 14:43:02 +0000
-Subject: [PATCH] ARM: vexpress: enable GICv3
-
-Upstream-Status: Pending
-
-ARMv8 targets such as ARM's FVP Cortex-A32 model can run the 32-bit
-ARMv7 kernel.  And these targets often contain GICv3.
-
-Signed-off-by: Ryan Harkin <ryan.harkin@linaro.org>
-Signed-off-by: Jon Medhurst <tixy@linaro.org>
----
- arch/arm/mach-versatile/Kconfig | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/K=
config
-index 2ef226194c3a..3d54877fe339 100644
---- a/arch/arm/mach-versatile/Kconfig
-+++ b/arch/arm/mach-versatile/Kconfig
-@@ -251,6 +251,7 @@ menuconfig ARCH_VEXPRESS
- 	depends on ARCH_MULTI_V7
- 	select ARM_AMBA
- 	select ARM_GIC
-+	select ARM_GIC_V3
- 	select ARM_GLOBAL_TIMER
- 	select ARM_TIMER_SP804
- 	select GPIOLIB
---=20
-2.30.2
-
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 3fdfe96f..dc6f34e9 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -14,7 +14,6 @@ ARMBSPFILESPATHS :=3D "${THISDIR}:${THISDIR}/files:"
 # Arm platforms kmeta
 SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-pl=
atforms-kmeta;destsuffix=3Darm-platforms-kmeta"
 SRC_URI:append:fvp-base =3D " ${SRC_URI_KMETA}"
-SRC_URI:append:fvp-base-arm32 =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:fvp-baser-aemv8r64 =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:juno =3D " ${SRC_URI_KMETA}"
 SRC_URI:append:n1sdp =3D " ${SRC_URI_KMETA}"
@@ -67,21 +66,6 @@ KMACHINE:fvp-base =3D "fvp"
 FILESEXTRAPATHS:prepend:fvp-base :=3D "${ARMBSPFILESPATHS}"
 SRC_URI:append:fvp-base =3D " file://0001-arm64-dts-fvp-Enable-virtio-rn=
g-support.patch"
=20
-#
-# FVP BASE ARM32 KMACHINE
-#
-COMPATIBLE_MACHINE:fvp-base-arm32 =3D "fvp-base-arm32"
-KMACHINE:fvp-base-arm32 =3D "fvp-arm32"
-FILESEXTRAPATHS:prepend:fvp-base-arm32 :=3D "${ARMBSPFILESPATHS}"
-SRC_URI:append:fvp-base-arm32 =3D " file://0001-ARM-vexpress-enable-GICv=
3.patch"
-# We want to use the DT in the arm64 tree but the kernel build doesn't l=
ike that, so symlink it
-do_compile:prepend:fvp-base-arm32() {
-    mkdir --parents ${S}/arch/arm/boot/dts/arm
-    for file in fvp-base-revc.dts rtsm_ve-motherboard.dtsi rtsm_ve-mothe=
rboard-rs2.dtsi; do
-        ln -fsr ${S}/arch/arm64/boot/dts/arm/$file ${S}/arch/arm/boot/dt=
s/arm
-    done
-}
-
 #
 # FVP BaseR AEMv8r64 Machine
 #
--=20
2.25.1


