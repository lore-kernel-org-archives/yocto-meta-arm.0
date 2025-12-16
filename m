Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2448DD609D2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27032.1765902212274394945
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:23:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CFB4DFEC
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:24 -0800 (PST)
Received: from e133390.cambridge.arm.com (unknown [10.1.198.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AAF7A3F73F
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:31 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/4] arm/scp-firmware: Use firmware.bbclass
Date: Tue, 16 Dec 2025 16:23:09 +0000
Message-ID: <20251216162311.3985918-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216162311.3985918-1-peter.hoyes@arm.com>
References: <20251216162311.3985918-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6803

Replace inherit deploy with firmware.

Initialize SCP_DEBUG using the FIRMWARE_DEBUG_BUILD variable. Initialize
SCP_PLATFORM using the FIRMWARE_PLATFORM variable.

Refactor do_install to use ${FIRMWARE_DIR} and remove now redundant
configuration.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 meta-arm-bsp/conf/machine/sgi575.conf         |  6 ++--
 .../recipes-bsp/images/firmware-image-juno.bb |  2 +-
 .../scp-firmware/scp-firmware-juno.inc        |  4 +--
 .../trusted-firmware-a-juno.inc               |  2 +-
 .../scp-firmware/scp-firmware_2.16.0.bb       | 36 +++++++------------
 5 files changed, 20 insertions(+), 30 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/sgi575.conf b/meta-arm-bsp/conf/ma=
chine/sgi575.conf
index 07d1e79c..6217ecc2 100644
--- a/meta-arm-bsp/conf/machine/sgi575.conf
+++ b/meta-arm-bsp/conf/machine/sgi575.conf
@@ -46,9 +46,9 @@ FVP_CONFIG[css.cmn600.mesh_config_file] =3D "SGI-575_cm=
n600.yml"
 FVP_CONFIG[css.cmn600.force_rnsam_internal] ?=3D "false"
 FVP_CONFIG[css.gic_distributor.ITS-device-bits] ?=3D "20"
=20
-FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp_ramfw.bin@0x0BD80000"
-FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "mcp_romfw.bin"
-FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp_romfw.bin"
+FVP_DATA ?=3D "css.scp.armcortexm7ct=3Dscp-firmware/scp_ramfw.bin@0x0BD8=
0000"
+FVP_CONFIG[css.mcp.ROMloader.fname] ?=3D "scp-firmware/mcp_romfw.bin"
+FVP_CONFIG[css.scp.ROMloader.fname] ?=3D "scp-firmware/scp_romfw.bin"
 FVP_CONFIG[css.trustedBootROMloader.fname] ?=3D "trusted-firmware-a/bl1.=
bin"
 FVP_CONFIG[board.flashloader0.fname] ?=3D "trusted-firmware-a/fip.bin"
=20
diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/met=
a-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index 16e4e8db..48486d6e 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -41,7 +41,7 @@ do_install() {
     cp -f ${RECIPE_SYSROOT}/firmware/trusted-firmware-a/fip.bin \
         ${D}/${FIRMWARE_DIR}/SOFTWARE/fip.bin
=20
-    cp -f ${RECIPE_SYSROOT}/firmware/scp_romfw_bypass.bin \
+    cp -f ${RECIPE_SYSROOT}/firmware/scp-firmware/scp_romfw_bypass.bin \
         ${D}/${FIRMWARE_DIR}/SOFTWARE/scp_bl1.bin
=20
     # u-boot environment file
diff --git a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc =
b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
index 1f02d8e5..1bdc78e0 100644
--- a/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
+++ b/meta-arm-bsp/recipes-bsp/scp-firmware/scp-firmware-juno.inc
@@ -8,8 +8,8 @@ FW_INSTALL:append =3D " romfw_bypass"
 do_install:append() {
     for TYPE in ${FW_INSTALL}; do
         if [ "$TYPE" =3D "romfw_bypass" ]; then
-            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+            install -D "${B}/${TYPE}/${FW_TARGETS}/bin/${SCP_PLATFORM}-b=
l1-bypass.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
         fi
     done
 }
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-juno.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-juno.inc
index 3ddd8cb5..a3a35ab4 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno=
.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-juno=
.inc
@@ -10,4 +10,4 @@ TFA_BUILD_TARGET =3D "bl1 bl2 bl31 dtbs fip"
 # Juno needs the System Control Processor Firmware
 DEPENDS +=3D "virtual/control-processor-firmware"
=20
-EXTRA_OEMAKE:append =3D " SCP_BL2=3D${RECIPE_SYSROOT}/firmware/scp_ramfw=
.bin"
+EXTRA_OEMAKE:append =3D " SCP_BL2=3D${RECIPE_SYSROOT}${FIRMWARE_BASE_DIR=
}/scp-firmware/scp_ramfw.bin"
diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb b/m=
eta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
index d41a9892..6a32a734 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.16.0.bb
@@ -16,8 +16,9 @@ SRCREV  =3D "190e938c2da3631b4834a90448516423099c79f7"
=20
 PROVIDES +=3D "virtual/control-processor-firmware"
=20
-CMAKE_BUILD_TYPE    ?=3D "RelWithDebInfo"
-SCP_PLATFORM        ?=3D "${MACHINE}"
+SCP_DEBUG           ?=3D "${FIRMWARE_DEBUG_BUILD}"
+CMAKE_BUILD_TYPE    ?=3D "${@oe.utils.vartrue('SCP_DEBUG', 'Debug', 'Rel=
WithDebInfo', d)}"
+SCP_PLATFORM        ?=3D "${FIRMWARE_PLATFORM}"
 SCP_PRODUCT_GROUP   ?=3D "."
 SCP_LOG_LEVEL       ?=3D "WARN"
 SCP_PLATFORM_FEATURE_SET ?=3D "0"
@@ -31,7 +32,7 @@ DEPENDS =3D "gcc-arm-none-eabi-native \
 # For now we only build with GCC, so stop meta-clang trying to get invol=
ved
 TOOLCHAIN =3D "gcc"
=20
-inherit deploy
+inherit firmware
=20
 B =3D "${WORKDIR}/build"
=20
@@ -39,7 +40,6 @@ B =3D "${WORKDIR}/build"
 FW_TARGETS ?=3D "scp mcp"
 FW_INSTALL ?=3D "ramfw romfw"
=20
-PACKAGE_ARCH =3D "${MACHINE_ARCH}"
 COMPATIBLE_MACHINE ?=3D "invalid"
=20
 export CFLAGS =3D "${DEBUG_PREFIX_MAP}"
@@ -75,41 +75,31 @@ do_compile() {
 }
=20
 do_install() {
-    install -d ${D}/firmware
+    install -d ${D}${FIRMWARE_DIR}
     for TYPE in ${FW_INSTALL}; do
         for FW in ${FW_TARGETS}; do
            if [ "$TYPE" =3D "romfw" ]; then
                if [ "$FW" =3D "scp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
1.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
                else
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl1.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
                fi
            elif [ "$TYPE" =3D "ramfw" ]; then
                if [ "$FW" =3D "scp" ]; then
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-bl=
2.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
                else
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.bin" "${D}/firmware/${FW}_${TYPE}.bin"
-                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.elf" "${D}/firmware/${FW}_${TYPE}.elf"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.bin" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.bin"
+                   install -D "${B}/${TYPE}/${FW}/bin/${SCP_PLATFORM}-${=
FW}-bl2.elf" "${D}${FIRMWARE_DIR}/${FW}_${TYPE}.elf"
                fi
            fi
        done
     done
 }
=20
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-
-FILES:${PN}-dbg +=3D "/firmware/*.elf"
 # These binaries are specifically for 32-bit arm
 INSANE_SKIP:${PN}-dbg +=3D "arch"
 INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
 INHIBIT_PACKAGE_STRIP =3D "1"
-
-do_deploy() {
-    # Copy the images to deploy directory
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
-}
-addtask deploy after do_install
--=20
2.43.0


