Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.6126.1606307601570310596
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Nov 2020 04:33:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A10C31B
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:33:21 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAABF3F70D
	for <meta-arm@lists.yoctoproject.org>; Wed, 25 Nov 2020 04:33:20 -0800 (PST)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm-bsp: remove foundation-armv8 machine
Date: Wed, 25 Nov 2020 12:33:15 +0000
Message-Id: <20201125123316.3226624-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

The Foundation FVP machine is no longer relevant now that meta-arm has
Base FVP machines and the Base FVPs are freely available.

Change-Id: Ia7043d98e2bcd8433c8c3d2661cd28484f691276
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../conf/machine/foundation-armv8.conf        | 17 -------
 .../documentation/foundation-armv8.md         | 51 -------------------
 .../trusted-firmware-a-fvp.inc                |  5 +-
 .../trusted-firmware-a_2.3.bbappend           |  1 -
 .../u-boot/u-boot_2020.07.bbappend            |  6 ---
 .../linux/linux-arm-platforms.inc             |  7 ---
 6 files changed, 2 insertions(+), 85 deletions(-)
 delete mode 100644 meta-arm-bsp/conf/machine/foundation-armv8.conf
 delete mode 100644 meta-arm-bsp/documentation/foundation-armv8.md

diff --git a/meta-arm-bsp/conf/machine/foundation-armv8.conf b/meta-arm-b=
sp/conf/machine/foundation-armv8.conf
deleted file mode 100644
index 0ec6ecd..0000000
--- a/meta-arm-bsp/conf/machine/foundation-armv8.conf
+++ /dev/null
@@ -1,17 +0,0 @@
-# Configuration for Armv8-A Foundation
-
-#@TYPE: Machine
-#@NAME: Armv8-A Foundation Platform machine
-#@DESCRIPTION: Machine configuration for Armv8-A Foundation Platform mod=
el
-
-require conf/machine/fvp-common.inc
-require conf/machine/include/arm/arch-armv8a.inc
-
-TUNE_FEATURES =3D "aarch64"
-
-# FVP u-boot configuration
-UBOOT_MACHINE =3D "vexpress_aemv8a_semi_defconfig"
-
-KERNEL_IMAGETYPE =3D "Image"
-
-KERNEL_DEVICETREE =3D "arm/foundation-v8-gicv3-psci.dtb"
diff --git a/meta-arm-bsp/documentation/foundation-armv8.md b/meta-arm-bs=
p/documentation/foundation-armv8.md
deleted file mode 100644
index 72f9f66..0000000
--- a/meta-arm-bsp/documentation/foundation-armv8.md
+++ /dev/null
@@ -1,51 +0,0 @@
-# Armv8-A Base Platform Support in meta-arm-bsp
-
-## Howto Build and Run
-
-### Configuration:
-In the local.conf file, MACHINE should be set as follow:
-MACHINE ?=3D "foundation-armv8"
-
-### Build:
-```bash$ bitbake core-image-minimal```
-
-### Run:
-To Run the Fixed Virtual Platform simulation tool you must download "Arm=
v8-A
-Foundation Platform" from Arm developer (This might require the user to
-register) from this address:
-https://developer.arm.com/tools-and-software/simulation-models/fixed-vir=
tual-platforms
-and install it on your host PC.
-
-Fast Models Fixed Virtual Platforms (FVP) Reference Guide:
-https://developer.arm.com/docs/100966/latest
-
-Armv8=E2=80=91A Foundation Platform User Guide:
-https://developer.arm.com/docs/100961/latest/
-
-
-Once done, do the following to build and run an image:
-```bash$ bitbake core-image-minimal```
-```bash$ export YOCTO_DEPLOY_IMGS_DIR=3D"<yocto-build-dir/tmp/deploy/ima=
ges/foundation-v8>"```
-```bash$ cd <path-to-Foundation_Platformpkg-dir/models/Linux64_GCC-X.X/>=
```
-```
-bash$ ./Foundation_Platform --cores=3D4 --no-sve --gicv3 \
-         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/bl1-fvp.bin@0x0 \
-         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/fip-fvp.bin@0x8000000 \
-         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/Image@0x80080000 \
-         --data=3D${YOCTO_DEPLOY_IMGS_DIR}/foundation-v8-gicv3-psci.dtb@=
0x83000000 \
-         --block-device=3D${YOCTO_DEPLOY_IMGS_DIR}/core-image-minimal-fo=
undation-armv8.disk.img
-```
-
-If you have built a configuration without a ramdisk, you can use the fol=
lowing
-command in U-boot to start Linux:
-```VExpress64# booti 0x80080000 - 0x83000000```
-
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
-a-fvp.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-fvp.inc
index 27031eb..43340cd 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.=
inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-fvp.=
inc
@@ -1,11 +1,10 @@
 # FVP specific TFA parameters
=20
 #
-# Armv8-A Base Platform FVP and Armv8-A Foundation Platform uses the sam=
e
-# TFAs.
+# Armv8-A Base Platform FVP
 #
=20
-COMPATIBLE_MACHINE =3D "fvp-base|foundation-armv8"
+COMPATIBLE_MACHINE =3D "fvp-base"
 TFA_PLATFORM =3D "fvp"
 TFA_DEBUG =3D "1"
 TFA_MBEDTLS =3D "1"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a_2.3.bbappend b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-fir=
mware-a_2.3.bbappend
index 0e6fb1e..357d4a3 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_2.3.=
bbappend
@@ -3,7 +3,6 @@
 MACHINE_TFA_REQUIRE ?=3D ""
 MACHINE_TFA_REQUIRE_tc0 =3D "trusted-firmware-a-tc0.inc"
 MACHINE_TFA_REQUIRE_a5ds =3D "trusted-firmware-a-a5ds.inc"
-MACHINE_TFA_REQUIRE_foundation-armv8 =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_fvp-base =3D "trusted-firmware-a-fvp.inc"
 MACHINE_TFA_REQUIRE_n1sdp =3D "trusted-firmware-a-n1sdp.inc"
 MACHINE_TFA_REQUIRE_juno =3D "trusted-firmware-a-juno.inc"
diff --git a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend b/me=
ta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
index c1f8b01..21ba1c5 100644
--- a/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
+++ b/meta-arm-bsp/recipes-bsp/u-boot/u-boot_2020.07.bbappend
@@ -3,7 +3,6 @@
 THIS_DIR :=3D "${THISDIR}"
 FILESEXTRAPATHS_prepend =3D "${THIS_DIR}/${BP}:"
 FILESEXTRAPATHS_prepend_fvp-base =3D "${THIS_DIR}/${BP}/fvp-common:"
-FILESEXTRAPATHS_prepend_foundation-armv8 =3D "${THIS_DIR}/${BP}/fvp-comm=
on:"
=20
 #
 # Cortex-A5 DesignStart KMACHINE
@@ -11,11 +10,6 @@ FILESEXTRAPATHS_prepend_foundation-armv8 =3D "${THIS_D=
IR}/${BP}/fvp-common:"
 SRC_URI_append_a5ds =3D " file://0001-armv7-add-mmio-timer.patch \
                         file://0002-board-arm-add-designstart-cortex-a5-=
board.patch"
=20
-#
-# FVP FOUNDATION KMACHINE
-#
-SRC_URI_append_foundation-armv8 =3D " file://u-boot_vexpress_fvp.patch"
-
 #
 # FVP BASE KMACHINE
 #
diff --git a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc b/=
meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
index 62b1dec..d60e60e 100644
--- a/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-kernel/linux/linux-arm-platforms.inc
@@ -9,7 +9,6 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}:${THISDIR}/files=
:"
=20
 # Arm platforms kmeta
 SRC_URI_KMETA =3D "file://arm-platforms-kmeta;type=3Dkmeta;name=3Darm-pl=
atforms-kmeta;destsuffix=3Darm-platforms-kmeta"
-SRC_URI_append_foundation-armv8 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_fvp-base-arm32 =3D " ${SRC_URI_KMETA}"
 SRC_URI_append_juno =3D " ${SRC_URI_KMETA}"
@@ -23,12 +22,6 @@ SRCREV_arm-platforms-kmeta =3D "6147e82375aa9df8f2a162=
d42ea6406c79c854c5"
 COMPATIBLE_MACHINE_a5ds =3D "a5ds"
 KMACHINE_a5ds =3D "a5ds"
=20
-#
-# FVP FOUNDATION KMACHINE
-#
-COMPATIBLE_MACHINE_foundation-armv8 =3D "foundation-armv8"
-KMACHINE_foundation-armv8 =3D "fvp"
-
 #
 # FVP BASE KMACHINE
 #
--=20
2.25.1

