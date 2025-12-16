Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C953D609D3
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26763.1765902211286970266
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:23:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93DD4FEC
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:23 -0800 (PST)
Received: from e133390.cambridge.arm.com (unknown [10.1.198.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E8323F73F
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:30 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/4] arm/trusted-firmware-a: Use firmware.bbclass
Date: Tue, 16 Dec 2025 16:23:08 +0000
Message-ID: <20251216162311.3985918-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216162311.3985918-1-peter.hoyes@arm.com>
References: <20251216162311.3985918-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6802

Replace inherit deploy with firmware.

Initialize TFA_DEBUG using the FIRMWARE_DEBUG_BUILD variable. Initialize
TFA_PLATFORM with FIRMWARE_PLATFORM.

Refactor do_install to use ${FIRMWARE_DIR} and remove now redundant
configuration. Drop the redundant ${TFA_PLATFORM} suffixes.

Update BSP conf files to use the new deploy location, including
symlinking back to ${DEPLOYDIR} where necessary.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm-bsp/conf/machine/fvp-base.conf       |  4 +--
 meta-arm-bsp/conf/machine/sgi575.conf         |  4 +--
 .../corstone1000-flash-firmware-image.bb      | 10 +++---
 .../recipes-bsp/images/firmware-image-juno.bb |  4 +--
 .../uefi/edk2-firmware-sbsa-ref.inc           |  4 +--
 .../wic/corstone1000-flash-firmware.wks.in    |  2 +-
 .../trusted-firmware-a/trusted-firmware-a.inc | 31 ++++++-------------
 .../trusted-firmware-a_%.bbappend             | 10 ++++++
 8 files changed, 33 insertions(+), 36 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/fvp-base.conf b/meta-arm-bsp/conf/=
machine/fvp-base.conf
index 52f1e1f2..83506c7e 100644
--- a/meta-arm-bsp/conf/machine/fvp-base.conf
+++ b/meta-arm-bsp/conf/machine/fvp-base.conf
@@ -58,8 +58,8 @@ FVP_CONFIG[cluster0.check_memory_attributes] ?=3D "0"
 FVP_CONFIG[cluster1.check_memory_attributes] ?=3D "0"
 FVP_CONFIG[cluster0.stage12_tlb_size] ?=3D "1024"
 FVP_CONFIG[cluster1.stage12_tlb_size] ?=3D "1024"
-FVP_CONFIG[bp.secureflashloader.fname] ?=3D "bl1-fvp.bin"
-FVP_CONFIG[bp.flashloader0.fname] ?=3D "fip-fvp.bin"
+FVP_CONFIG[bp.secureflashloader.fname] ?=3D "trusted-firmware-a/bl1.bin"
+FVP_CONFIG[bp.flashloader0.fname] ?=3D "trusted-firmware-a/fip.bin"
 FVP_CONFIG[bp.virtioblockdevice.image_path] ?=3D "${IMAGE_NAME}.wic"
=20
 # FVP Base default is 8.0, so there is no has_arm_v8-0 for it.  However,=
 this is needed for every version after.  So set this accordingly
diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 75403930..07d1e79c 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -49,8 +49,8 @@ FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "2=
0"
 FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp_ramfw.bin@0x0BD80000"
 FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "mcp_romfw.bin"
 FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp_romfw.bin"
-FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "bl1-sgi575.bin"
-FVP_CONFIG[board.flashloader0.fname] ?=3D "fip-sgi575.bin"
+FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "trusted-firmware-a/bl1.=
bin"
+FVP_CONFIG[board.flashloader0.fname] ?=3D "trusted-firmware-a/fip.bin"
=20
 FVP_CONSOLES[default] =3D "terminal_uart_ap"
 FVP_TERMINALS[css.scp.terminal_uart_aon] ?=3D "SCP Console"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index a452445e..e705efd3 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -115,7 +115,7 @@ CAPSULE_INDEXES +=3D "${PAYLOAD_FIP_INDEX} "
 CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
 CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
 CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
-UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/signed_fip-corstone1000=
.bin "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/signed_fip.bin "
 CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_FIP_VERSION} "
 CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_FIP_LOWEST_SUPPORTED_V=
ERSION} "
=20
@@ -155,8 +155,8 @@ CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_DUMMY_END_VERSION=
}"
 CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_DUMMY_END_LOWEST_SUPPO=
RTED_VERSION}"
=20
 # TF-A settings for signing host images
-TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
-TFA_FIP_BINARY =3D "fip-corstone1000.bin"
+TFA_BL2_BINARY =3D "bl2.bin"
+TFA_FIP_BINARY =3D "fip.bin"
 TFA_BL2_RE_IMAGE_LOAD_ADDRESS =3D "0x62353000"
 TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
 TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
@@ -167,11 +167,11 @@ RE_IMAGE_OFFSET =3D "0x1000"
=20
 do_sign_images() {
     # Sign TF-A BL2
-    sign_host_image ${RECIPE_SYSROOT}/firmware/${TFA_BL2_BINARY} \
+    sign_host_image ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/${TFA_=
BL2_BINARY} \
         ${TFA_BL2_RE_IMAGE_LOAD_ADDRESS} ${TFA_BL2_RE_SIGN_BIN_SIZE}
=20
     # Update BL2 in the FIP image
-    cp ${RECIPE_SYSROOT}/firmware/${TFA_FIP_BINARY} .
+    cp ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/${TFA_FIP_BINARY} .
     fiptool update --tb-fw \
         ${TFM_IMAGE_SIGN_DEPLOY_DIR}/signed_${TFA_BL2_BINARY} \
         ${TFM_IMAGE_SIGN_DIR}/${TFA_FIP_BINARY}
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/met=
a-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index 0b17b024..16e4e8db 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -35,10 +35,10 @@ do_compile[noexec] =3D "1"
 # packages for this recipe.
 do_install() {
     cp -a ${S} ${D}/
-    cp -f ${RECIPE_SYSROOT}/firmware/bl1-juno.bin \
+    cp -f ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/bl1.bin \
         ${D}/${FIRMWARE_DIR}/SOFTWARE/bl1.bin
=20
-    cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
+    cp -f ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/fip.bin \
         ${D}/${FIRMWARE_DIR}/SOFTWARE/fip.bin
=20
     cp -f ${RECIPE_SYSROOT}/firmware/scp_romfw_bypass.bin \
diff --git a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc b/m=
eta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc
index f251aa46..06660aed 100644
--- a/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc
+++ b/meta-arm-bsp/recipes-bsp/uefi/edk2-firmware-sbsa-ref.inc
@@ -14,8 +14,8 @@ EDK2_BIN_NAME:sbsa-ref      =3D "SBSA_FLASH0.fd"
=20
 do_compile:prepend:sbsa-ref() {
     mkdir -p ${B}/Platform/Qemu/Sbsa/
-    cp ${RECIPE_SYSROOT}/firmware/bl1.bin ${B}/Platform/Qemu/Sbsa/
-    cp ${RECIPE_SYSROOT}/firmware/fip.bin ${B}/Platform/Qemu/Sbsa/
+    cp ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/bl1.bin ${B}/Platfo=
rm/Qemu/Sbsa/
+    cp ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/fip.bin ${B}/Platfo=
rm/Qemu/Sbsa/
 }
=20
 do_install:append:sbsa-ref() {
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware.wks.in
index 6ab4f048..8cc0558c 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
@@ -22,7 +22,7 @@ part --source rawcopy --size 144k --sourceparams=3D"fil=
e=3Dbl2_signed.bin" --offset
 part --source rawcopy --size 320k --sourceparams=3D"file=3Dtfm_s_signed.=
bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9616C-1233-439C-ACBA=
-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
=20
 # Rawcopy of the FIP binary
-part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip-corst=
one1000.bin" --align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-95=
6B-EEF4DE9DF1C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
+part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip.bin" =
--align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1=
C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
=20
 # Rawcopy of kernel with initramfs
 part --source rawcopy --size 12 --sourceparams=3D"file=3DImage.gz-initra=
mfs-${MACHINE}.bin" --align 4 --part-name=3D"kernel_primary" --uuid BF7A6=
142-0662-47FD-9434-6A8811980816 --part-type 8197561D-6124-46FC-921E-141CC=
5745B05
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index 1e2120ae..791ea9e8 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -2,9 +2,7 @@ DESCRIPTION =3D "Trusted Firmware-A"
 HOMEPAGE =3D "https://trustedfirmware-a.readthedocs.io/"
 LICENSE =3D "BSD-2-Clause & BSD-3-Clause & MIT & Apache-2.0"
=20
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
-
-inherit deploy
+inherit firmware
=20
 SRC_URI_TRUSTED_FIRMWARE_A ?=3D "git://review.trustedfirmware.org/TF-A/t=
rusted-firmware-a;protocol=3Dhttps"
 SRCBRANCH =3D "master"
@@ -17,7 +15,7 @@ SRCREV_FORMAT =3D "tfa"
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 # Platform must be set for each machine
-TFA_PLATFORM ?=3D "invalid"
+TFA_PLATFORM ?=3D "${FIRMWARE_PLATFORM}"
=20
 # Some platforms can have multiple board configurations
 # Leave empty for default behavior
@@ -38,7 +36,7 @@ TFA_SP_LAYOUT_FILE ?=3D ""
 TFA_ARM_SPMC_MANIFEST_DTS ?=3D ""
=20
 # Build for debug (set TFA_DEBUG to 1 to activate)
-TFA_DEBUG ?=3D "0"
+TFA_DEBUG ?=3D "${FIRMWARE_DEBUG_BUILD}"
=20
 B =3D "${WORKDIR}/build"
=20
@@ -180,7 +178,8 @@ do_compile() {
 do_compile[cleandirs] =3D "${B}"
=20
 do_install() {
-    install -d -m 755 ${D}/firmware
+    install -d -m 755 ${D}${FIRMWARE_DIR}
+
     for atfbin in ${TFA_INSTALL_TARGET}; do
         processed=3D"0"
         if [ "$atfbin" =3D "all" ]; then
@@ -194,28 +193,25 @@ do_install() {
         if [ -f ${BUILD_DIR}/$atfbin.bin ]; then
             echo "Install $atfbin.bin"
             install -m 0644 ${BUILD_DIR}/$atfbin.bin \
-                ${D}/firmware/$atfbin-${TFA_PLATFORM}.bin
-            ln -sf $atfbin-${TFA_PLATFORM}.bin ${D}/firmware/$atfbin.bin
+                ${D}${FIRMWARE_DIR}/$atfbin.bin
             processed=3D"1"
         fi
         if [ -f ${BUILD_DIR}/$atfbin/$atfbin.elf ]; then
             echo "Install $atfbin.elf"
             install -m 0644 ${BUILD_DIR}/$atfbin/$atfbin.elf \
-                ${D}/firmware/$atfbin-${TFA_PLATFORM}.elf
-            ln -sf $atfbin-${TFA_PLATFORM}.elf ${D}/firmware/$atfbin.elf
+                ${D}${FIRMWARE_DIR}/$atfbin.elf
             processed=3D"1"
         fi
         if [ -f ${BUILD_DIR}/$atfbin ]; then
             echo "Install $atfbin"
             install -m 0644 ${BUILD_DIR}/$atfbin \
-                ${D}/firmware/$atfbin-${TFA_PLATFORM}
-            ln -sf $atfbin-${TFA_PLATFORM} ${D}/firmware/$atfbin
+                ${D}${FIRMWARE_DIR}/$atfbin
             processed=3D"1"
         fi
         if [ -f ${BUILD_DIR}/fdts/$atfbin.dtb ]; then
             echo "Install $atfbin.dtb"
             install -m 0644 "${BUILD_DIR}/fdts/$atfbin.dtb" \
-                "${D}/firmware/$atfbin.dtb"
+                "${D}${FIRMWARE_DIR}/$atfbin.dtb"
             processed=3D"1"
         elif [ "$atfbin" =3D "dtbs" ]; then
             echo "dtbs install, skipped: set dtbs in TFA_INSTALL_TARGET"
@@ -228,21 +224,12 @@ do_install() {
     done
 }
=20
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-
-FILES:${PN}-dbg =3D "/firmware/*.elf"
 # Skip QA check for relocations in .text of elf binaries
 INSANE_SKIP:${PN}-dbg +=3D "textrel"
 # Build paths are currently embedded
 INSANE_SKIP:${PN} +=3D "buildpaths"
 INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
=20
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
-
 CVE_PRODUCT =3D "arm:arm-trusted-firmware \
                arm:trusted_firmware-a \
                arm:arm_trusted_firmware \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%=
.bbappend b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.=
bbappend
index 02c88148..679f6f22 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappe=
nd
@@ -63,3 +63,13 @@ do_compile:append:qemuarm-secureboot() {
     dd if=3D${BUILD_DIR}/bl1.bin of=3D${BUILD_DIR}/flash.bin bs=3D4096 c=
onv=3Dnotrunc
     dd if=3D${BUILD_DIR}/fip.bin of=3D${BUILD_DIR}/flash.bin seek=3D64 b=
s=3D4096 conv=3Dnotrunc
 }
+
+do_deploy:append:qemuarm64-secureboot(){
+    # runqemu requires flash.bin to be in the deploy directory
+    ln -srn ${DEPLOYDIR}/${PN}/flash.bin ${DEPLOYDIR}/flash.bin
+}
+
+do_deploy:append:qemuarm-secureboot(){
+    # runqemu requires flash.bin to be in the deploy directory
+    ln -srn ${DEPLOYDIR}/${PN}/flash.bin ${DEPLOYDIR}/flash.bin
+}
--=20
2.43.0


