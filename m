Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14443D609C2
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27033.1765902213606080153
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Dec 2025 08:23:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4800FEC
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:25 -0800 (PST)
Received: from e133390.cambridge.arm.com (unknown [10.1.198.56])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BFAB73F73F
	for <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 08:23:32 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 4/4] arm/trusted-firmware-m: Use firmware.bbclass
Date: Tue, 16 Dec 2025 16:23:10 +0000
Message-ID: <20251216162311.3985918-4-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216162311.3985918-1-peter.hoyes@arm.com>
References: <20251216162311.3985918-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Dec 2025 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6804

Replace inherit deploy with firmware.

Initialize TFM_DEBUG using the FIRMWARE_DEBUG_BUILD variable. Initialize
TFM_PLATFORM with FIRMWARE_PLATFORM.

Refactor do_install to use ${FIRMWARE_DIR} and remove now redundant
configuration.

Refactor corstone1000 config files to use ${FIRMWARE_DIR} and the
base do_install.

Signed-off-by: Peter Hoyes <peter.hoyes@arm.com>
---
 .../corstone1000-firmware-deploy-image.inc    |  2 +-
 .../corstone1000-flash-firmware-image.bb      |  4 ++--
 .../trusted-firmware-m-corstone1000.inc       | 11 ++-------
 .../wic/corstone1000-flash-firmware.wks.in    |  4 ++--
 .../trusted-firmware-m/trusted-firmware-m.inc | 23 +++++++------------
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc
index dfd88971..eb06db10 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
@@ -1,7 +1,7 @@
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
 FIRMWARE_BINARIES =3D "corstone1000-flash-firmware-image-${MACHINE}.wic =
\
-                     bl1.bin \
+                     trusted-firmware-m/bl1.bin \
                      ${@bb.utils.contains('MACHINE_FEATURES', \
                                           'corstone1000-extsys', \
                                           'es_flashfw.bin', \
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index e705efd3..a8c74086 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -79,7 +79,7 @@ CAPSULE_INDEXES +=3D "${PAYLOAD_BL2_INDEX} "
 CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
 CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
 CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
-UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/bl2_signed.bin "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/trusted-firmware-m/bl2_=
signed.bin "
 CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_BL2_VERSION} "
 CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_BL2_LOWEST_SUPPORTED_V=
ERSION} "
=20
@@ -97,7 +97,7 @@ CAPSULE_INDEXES +=3D "${PAYLOAD_TFM_S_INDEX} "
 CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
 CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
 CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
-UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/tfm_s_signed.bin "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/trusted-firmware-m/tfm_=
s_signed.bin "
 CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_TFM_S_VERSION} "
 CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_TFM_S_LOWEST_SUPPORTED=
_VERSION} "
=20
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index a355e844..97f1bf6a 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -51,16 +51,9 @@ SRC_URI:append:corstone1000-mps3 =3D " \
     file://0003-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
     "
=20
-do_install() {
-  install -D -p -m 0644 ${B}/bin/tfm_s_signed.bin ${D}/firmware/tfm_s_si=
gned.bin
-  install -D -p -m 0644 ${B}/bin/bl2_signed.bin ${D}/firmware/bl2_signed=
.bin
-  install -D -p -m 0644 ${B}/bin/bl1_1.bin ${D}/firmware/bl1_1.bin
-  install -D -p -m 0644 ${B}/bin/bl1_provisioning_bundle.bin ${D}/firmwa=
re/bl1_provisioning_bundle.bin
-}
-
 create_bl1_image(){
-    dd conv=3Dnotrunc bs=3D1 if=3D${D}/firmware/bl1_1.bin of=3D${D}/firm=
ware/bl1.bin seek=3D0
+    dd conv=3Dnotrunc bs=3D1 if=3D${D}${FIRMWARE_DIR}/bl1_1.bin of=3D${D=
}${FIRMWARE_DIR}/bl1.bin seek=3D0
     # Size of bl1_1.bin is 58KB (59392 bytes) =20
-    dd conv=3Dnotrunc bs=3D1 if=3D${D}/firmware/bl1_provisioning_bundle.=
bin of=3D${D}/firmware/bl1.bin seek=3D59392
+    dd conv=3Dnotrunc bs=3D1 if=3D${D}${FIRMWARE_DIR}/bl1_provisioning_b=
undle.bin of=3D${D}${FIRMWARE_DIR}/bl1.bin seek=3D59392
 }
 do_install[postfuncs] +=3D "create_bl1_image"
diff --git a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in b/meta-a=
rm-bsp/wic/corstone1000-flash-firmware.wks.in
index 8cc0558c..78109aff 100644
--- a/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
+++ b/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
@@ -16,10 +16,10 @@ part --source empty --size 4k --align 4 --offset 28k =
--part-name=3D"private_metada
 part --source empty --size 4k --align 4 --offset 32k --part-name=3D"priv=
ate_metadata_replica_2" --uuid DCE9C503-8DFD-4DCB-8889-647E49641552 --par=
t-type ECB55DC3-8AB7-4A84-AB56-EB0A9974DB42
=20
 # The size has to be aligned to TF-M's SE_BL2_PARTITION_SIZE (tfm/platfo=
rm/ext/target/arm/corstone1000/partition/flash_layout.h)
-part --source rawcopy --size 144k --sourceparams=3D"file=3Dbl2_signed.bi=
n" --offset 36k --align 4 --part-name=3D"bl2_primary" --uuid 9A3A8FBF-55E=
F-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-4819-8688-03AB4CAB0ED9
+part --source rawcopy --size 144k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/bl2_signed.bin" --offset 36k --align 4 --part-name=3D"bl2_primary" =
--uuid 9A3A8FBF-55EF-439C-80C9-A3F728033929 --part-type 64BD8ADB-02C0-481=
9-8688-03AB4CAB0ED9
=20
 # The size has to be aligned to TF-M's TFM_PARTITION_SIZE (tfm/platform/=
ext/target/arm/corstone1000/partition/flash_layout.h)
-part --source rawcopy --size 320k --sourceparams=3D"file=3Dtfm_s_signed.=
bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9616C-1233-439C-ACBA=
-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060CB465CD4E
+part --source rawcopy --size 320k --sourceparams=3D"file=3Dtrusted-firmw=
are-m/tfm_s_signed.bin" --align 4 --part-name=3D"tfm_primary" --uuid 07F9=
616C-1233-439C-ACBA-72D75421BF70 --part-type D763C27F-07F6-4FF0-B2F3-060C=
B465CD4E
=20
 # Rawcopy of the FIP binary
 part --source rawcopy --size 2 --sourceparams=3D"file=3Dsigned_fip.bin" =
--align 4 --part-name=3D"FIP_A" --uuid B9C7AC9D-40FF-4675-956B-EEF4DE9DF1=
C5 --part-type B5EB19BD-CF56-45E8-ABA7-7ADB228FFEA7
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index dc11e984..d47541da 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -15,7 +15,7 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "^TF-Mv(?P<pver>\d+(\.\d=
+)+)$"
 # cmake here. You can easily short-circuit the toolchain but the install
 # is so convoluted there's no gain.
=20
-inherit python3native deploy
+inherit python3native firmware
=20
 # Baremetal and we bring a compiler below
 INHIBIT_DEFAULT_DEPS =3D "1"
@@ -44,10 +44,10 @@ DEPENDS +=3D "cmake-native \
 B =3D "${WORKDIR}/build"
=20
 # Build for debug (set TFM_DEBUG to 1 to activate)
-TFM_DEBUG ?=3D "0"
+TFM_DEBUG ?=3D "${FIRMWARE_DEBUG_BUILD}"
=20
-# Platform must be set, ideally in the machine configuration.
-TFM_PLATFORM ?=3D ""
+# Platform can be overridden in the machine configuration.
+TFM_PLATFORM ?=3D "${FIRMWARE_PLATFORM}"
 python() {
     if not d.getVar("TFM_PLATFORM"):
         raise bb.parse.SkipRecipe("TFM_PLATFORM needs to be set")
@@ -106,17 +106,10 @@ do_compile[progress] =3D "outof:^\[(\d+)/(\d+)\]\s+=
"
=20
 do_install() {
     # TODO install headers and static libraries when we know how they're=
 used
-    install -d -m 755 ${D}/firmware
-    install -m 0644 ${B}/bin/* ${D}/firmware/
-}
-
-FILES:${PN} =3D "/firmware"
-SYSROOT_DIRS +=3D "/firmware"
-FILES:${PN}-dbg =3D "/firmware/*.elf"
-
-addtask deploy after do_install
-do_deploy() {
-    cp -rf ${D}/firmware/* ${DEPLOYDIR}/
+    install -d -m 755 ${D}${FIRMWARE_DIR}
+    find ${B}/bin \( -name '*.bin' -o -name '*.elf' \) -type f | while r=
ead -r file; do
+        install -m 0644 "$file" "${D}${FIRMWARE_DIR}"
+    done
 }
=20
 # Build paths are currently embedded because it's impossible to pass -fd=
ebug-prefix-map
--=20
2.43.0


