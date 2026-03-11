Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCA3D1062884
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 12:12:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19948.1773231166476663320
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 11 Mar 2026 05:12:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CA6FF22BE
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:39 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E54183F7BD
	for <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 05:12:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm/qemuarm64-secureboot: get edk2 and trusted-firmware a working
Date: Wed, 11 Mar 2026 08:12:43 -0400
Message-ID: <20260311121244.72838-5-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260311121244.72838-1-jon.mason@arm.com>
References: <20260311121244.72838-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 11 Mar 2026 12:12:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6950

Do the changes necessary to get qemuarm64-secureboot to work with edk2
firmware, and add it to CI.  The CI changes needed to make it dynamic
based on edk2.yml or u-boot.yml required moving the relevant parts into
inc files.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml                                |  1 +
 ci/edk2.yml                                   |  2 +-
 .../trusted-firmware-a-qemuarm-secureboot.inc | 19 +++++++
 ...rusted-firmware-a-qemuarm64-secureboot.inc | 36 ++++++++++++
 .../trusted-firmware-a_%.bbappend             | 55 ++-----------------
 .../recipes-bsp/uefi/edk2-firmware_%.bbappend |  6 ++
 6 files changed, 68 insertions(+), 51 deletions(-)
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-qemuarm-secureboot.inc
 create mode 100644 meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmw=
are-a-qemuarm64-secureboot.inc

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 048366bd46a3..a93a0f1e0dec 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -258,6 +258,7 @@ qemuarm64-secureboot:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
+        FIRMWARE: [u-boot, edk2]
         TCLIBC: [glibc, musl]
         TS: [none, qemuarm64-secureboot-ts]
         TESTING: testimage
diff --git a/ci/edk2.yml b/ci/edk2.yml
index cf2f5851b85d..e14c16e1df27 100644
--- a/ci/edk2.yml
+++ b/ci/edk2.yml
@@ -13,5 +13,5 @@ local_conf_header:
     EXTRA_IMAGEDEPENDS +=3D "edk2-firmware"
     EFI_PROVIDER ?=3D "grub-efi"
=20
-    QB_DEFAULT_BIOS =3D "QEMU_EFI.fd"
+    QB_DEFAULT_BIOS ??=3D "QEMU_EFI.fd"
     WKS_FILE ?=3D "efi-disk.wks.in"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-q=
emuarm-secureboot.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-f=
irmware-a-qemuarm-secureboot.inc
new file mode 100644
index 000000000000..6227d1882924
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-qemuarm-=
secureboot.inc
@@ -0,0 +1,19 @@
+COMPATIBLE_MACHINE =3D "qemuarm-secureboot"
+
+TFA_PLATFORM =3D "qemu"
+
+# EDK2 dropped support for 32bit Arm, so u-boot only
+TFA_UBOOT =3D "1"
+TFA_INSTALL_TARGET =3D "flash.bin"
+
+do_compile:append() {
+    # Create a secure flash image for booting AArch64 Qemu. See:
+    # https://trustedfirmware-a.readthedocs.io/en/latest/plat/qemu.html
+    dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
+    dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
+}
+
+do_deploy:append(){
+    # runqemu requires flash.bin to be in the deploy directory
+    ln -srn ${DEPLOYDIR}/${PN}/flash.bin ${DEPLOYDIR}/flash.bin
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-q=
emuarm64-secureboot.inc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-qemuarm64-secureboot.inc
new file mode 100644
index 000000000000..9bfe52c5b44d
--- /dev/null
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a-qemuarm6=
4-secureboot.inc
@@ -0,0 +1,36 @@
+COMPATIBLE_MACHINE =3D "qemuarm64-secureboot"
+
+# Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+SRC_URI:append =3D " file://0001-Add-spmc_manifest-for-qemu.patch"
+
+TFA_PLATFORM =3D "qemu"
+
+# Trusted Services secure partitions require arm-ffa machine feature.
+# Enabling Secure-EL1 Payload Dispatcher (SPD) in this case
+TFA_SPD =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-ffa', 'spmd',=
 'opteed', d)}"
+# Configure tf-a accordingly to TS requirements if included
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-f=
fa', ' CTX_INCLUDE_EL2_REGS=3D0 SPMC_OPTEE=3D1 ', '' , d)}"
+# Cortex-A57 supports Armv8.0 (no S-EL2 execution state).
+# The SPD SPMC component should run at the S-EL1 execution state.
+TFA_SPMD_SPM_AT_SEL2 =3D "0"
+
+TFA_UBOOT ?=3D "1"
+
+TFA_INSTALL_TARGET =3D "flash.bin"
+
+# When using OP-TEE SPMC specify the SPMC manifest file.
+EXTRA_OEMAKE:append =3D "${@bb.utils.contains('MACHINE_FEATURES', 'arm-f=
fa', \
+    'QEMU_TOS_FW_CONFIG_DTS=3D${S}/plat/qemu/fdts/optee_spmc_manifest.dt=
s', '', d)}"
+
+do_compile:append() {
+    # Create a secure flash image for booting AArch64 Qemu. See:
+    # https://trustedfirmware-a.readthedocs.io/en/latest/plat/qemu.html
+    dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
+    dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
+}
+
+do_deploy:append(){
+    # runqemu requires flash.bin to be in the deploy directory
+    ln -srn ${DEPLOYDIR}/${PN}/flash.bin ${DEPLOYDIR}/flash.bin
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index 679f6f222fa0..a230a0c73fd3 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -1,32 +1,14 @@
-COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64-secureboot"
-COMPATIBLE_MACHINE:qemuarm-secureboot =3D "qemuarm-secureboot"
+# Machine specific TFAs
=20
-# Enable passing TOS_FW_CONFIG from FIP package to Trusted OS.
-FILESEXTRAPATHS:prepend:qemuarm64-secureboot :=3D "${THISDIR}/files:"
-SRC_URI:append:qemuarm64-secureboot =3D " \
-            file://0001-Add-spmc_manifest-for-qemu.patch \
-        "
+QEMU_TFA_REQUIRE ?=3D ""
+QEMU_TFA_REQUIRE:qemuarm-secureboot =3D "trusted-firmware-a-qemuarm-secu=
reboot.inc"
+QEMU_TFA_REQUIRE:qemuarm64-secureboot =3D "trusted-firmware-a-qemuarm64-=
secureboot.inc"
=20
-TFA_PLATFORM:qemuarm64-secureboot =3D "qemu"
-TFA_PLATFORM:qemuarm-secureboot =3D "qemu"
+require ${QEMU_TFA_REQUIRE}
=20
-# Trusted Services secure partitions require arm-ffa machine feature.
-# Enabling Secure-EL1 Payload Dispatcher (SPD) in this case
-TFA_SPD:qemuarm64-secureboot =3D "${@bb.utils.contains('MACHINE_FEATURES=
', 'arm-ffa', 'spmd', 'opteed', d)}"
-# Configure tf-a accordingly to TS requirements if included
-EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@bb.utils.contains('MACH=
INE_FEATURES', 'arm-ffa', ' CTX_INCLUDE_EL2_REGS=3D0 SPMC_OPTEE=3D1 ', ''=
 , d)}"
-# Cortex-A57 supports Armv8.0 (no S-EL2 execution state).
-# The SPD SPMC component should run at the S-EL1 execution state.
-TFA_SPMD_SPM_AT_SEL2:qemuarm64-secureboot =3D "0"
-
-TFA_UBOOT:qemuarm64-secureboot =3D "1"
-TFA_UBOOT:qemuarm-secureboot =3D "1"
 TFA_BUILD_TARGET:aarch64:qemuall =3D "all fip"
 TFA_BUILD_TARGET:arm:qemuall =3D "all fip"
=20
-TFA_INSTALL_TARGET:qemuarm64-secureboot =3D "flash.bin"
-TFA_INSTALL_TARGET:qemuarm-secureboot =3D "flash.bin"
-
 DEPENDS:append:aarch64:qemuall =3D " optee-os"
 DEPENDS:append:arm:qemuall =3D " optee-os"
=20
@@ -46,30 +28,3 @@ EXTRA_OEMAKE:append:arm:qemuall =3D " \
     BL32_RAM_LOCATION=3Dtdram \
     AARCH32_SP=3Doptee \
     "
-# When using OP-TEE SPMC specify the SPMC manifest file.
-EXTRA_OEMAKE:append:qemuarm64-secureboot =3D "${@bb.utils.contains('MACH=
INE_FEATURES', 'arm-ffa', \
-    'QEMU_TOS_FW_CONFIG_DTS=3D${S}/plat/qemu/fdts/optee_spmc_manifest.dt=
s', '', d)}"
-
-do_compile:append:qemuarm64-secureboot() {
-    # Create a secure flash image for booting AArch64 Qemu. See:
-    # https://trustedfirmware-a.readthedocs.io/en/latest/plat/qemu.html
-    dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
-    dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
-}
-
-do_compile:append:qemuarm-secureboot() {
-    # Create a secure flash image for booting AArch64 Qemu. See:
-    # https://trustedfirmware-a.readthedocs.io/en/latest/plat/qemu.html
-    dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
-    dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
-}
-
-do_deploy:append:qemuarm64-secureboot(){
-    # runqemu requires flash.bin to be in the deploy directory
-    ln -srn ${DEPLOYDIR}/${PN}/flash.bin ${DEPLOYDIR}/flash.bin
-}
-
-do_deploy:append:qemuarm-secureboot(){
-    # runqemu requires flash.bin to be in the deploy directory
-    ln -srn ${DEPLOYDIR}/${PN}/flash.bin ${DEPLOYDIR}/flash.bin
-}
diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend b/meta-ar=
m/recipes-bsp/uefi/edk2-firmware_%.bbappend
index 063136242bef..9f75e0a954a3 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware_%.bbappend
@@ -5,6 +5,12 @@ EDK2_BIN_NAME:qemuarm64      =3D "QEMU_EFI.fd"
 # No need for PXE booting in qemu, disable to reduce unnecessary noise
 EDK2_EXTRA_BUILD:qemuarm64 +=3D " -D NETWORK_PXE_BOOT_ENABLE=3DFALSE "
=20
+COMPATIBLE_MACHINE:qemuarm64-secureboot =3D "qemuarm64-secureboot"
+EDK2_PLATFORM:qemuarm64-secureboot      =3D "ArmVirtQemuKernel-AArch64"
+EDK2_PLATFORM_DSC:qemuarm64-secureboot  =3D "ArmVirtPkg/ArmVirtQemuKerne=
l.dsc"
+EDK2_BIN_NAME:qemuarm64-secureboot      =3D "QEMU_EFI.fd"
+#EDK2_BUILD_RELEASE:qemuarm64-secureboot =3D "0"
+
 do_install:append:qemuarm64() {
     install ${B}/Build/${EDK2_PLATFORM}/${EDK2_BUILD_MODE}_${EDK_COMPILE=
R}/FV/${EDK2_BIN_NAME} ${D}/firmware/
 }
--=20
2.50.1 (Apple Git-155)


