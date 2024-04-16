Return-Path: <bence.balogh@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD657C04FFF
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 16:15:04 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.24984.1713284097956763977
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 09:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: bence.balogh@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6E0C339;
	Tue, 16 Apr 2024 09:15:25 -0700 (PDT)
Received: from e126523.budapest.arm.com (e126523.budapest.arm.com [10.45.26.201])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE3D73F792;
	Tue, 16 Apr 2024 09:14:56 -0700 (PDT)
From: bence.balogh@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH 2/3] arm/uefi_capsule: use U-Boot for capsule generation
Date: Tue, 16 Apr 2024 18:14:45 +0200
Message-Id: <20240416161446.217376-3-bence.balogh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240416161446.217376-1-bence.balogh@arm.com>
References: <20240416161446.217376-1-bence.balogh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 16 Apr 2024 16:15:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5552

From: Bence Balogh <bence.balogh@arm.com>

Currently, only the Corstone-1000 platform uses the capsule generation
class. Corstone-1000 uses U-Boot instead of EDK2. With this change,
the dependency on EDK2 was removed.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 kas/corstone1000-image-configuration.yml      |  5 ++
 .../corstone1000-firmware-deploy-image.inc    |  2 +-
 .../corstone1000-flash-firmware-image.bb      | 26 ++++++++--
 ...h-firmware-image-capsule-update-image.json | 11 -----
 meta-arm/classes/uefi_capsule.bbclass         | 49 +++++++++----------
 5 files changed, 52 insertions(+), 41 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/images/files/corstone1000-fl=
ash-firmware-image-capsule-update-image.json

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index 2b285223..01360484 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -38,3 +38,8 @@ local_conf_header:
=20
     # TS PSA API tests commands for crypto, its, ps and iat
     CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
+
+  capsule: |
+    CAPSULE_EXTENSION =3D "uefi.capsule"
+    CAPSULE_FW_VERSION =3D "6"
+    CAPSULE_NAME =3D "${MACHINE}-v${CAPSULE_FW_VERSION}"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy=
-image.inc
index 2d192745..f959573d 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-firmware-deploy-image.=
inc
@@ -3,7 +3,7 @@ COMPATIBLE_MACHINE =3D "corstone1000"
 FIRMWARE_BINARIES =3D "corstone1000-flash-firmware-image-${MACHINE}.wic =
\
                      bl1.bin \
                      es_flashfw.bin \
-                     corstone1000-flash-firmware-image-${MACHINE}.wic.ue=
fi.capsule \
+                     ${CAPSULE_NAME}.${CAPSULE_EXTENSION} \
                      corstone1000_capsule_cert.crt \
                      corstone1000_capsule_key.key \
                     "
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 5238d1d3..0f5ae011 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -12,10 +12,12 @@ IMAGE_FSTYPES =3D "wic uefi_capsule"
 inherit image
 inherit tfm_sign_image
 inherit uefi_capsule
+inherit deploy
=20
 DEPENDS +=3D "external-system \
             trusted-firmware-a \
             trusted-firmware-m \
+            u-boot \
 "
=20
 IMAGE_FEATURES =3D ""
@@ -23,9 +25,21 @@ IMAGE_LINGUAS =3D ""
=20
 PACKAGE_INSTALL =3D ""
=20
-UEFI_FIRMWARE_BINARY =3D "${IMAGE_LINK_NAME}.${CAPSULE_IMGTYPE}"
-UEFI_CAPSULE_CONFIG =3D "${THISDIR}/files/${PN}-capsule-update-image.jso=
n"
-CAPSULE_IMGTYPE =3D "wic"
+# The generated ${MACHINE}_image.nopt is used instead of the default wic=
 image
+# for the capsule generation. The uefi.capsule image type doesn't have t=
o
+# depend on the wic because of this.
+#
+# The corstone1000_capsule_cert.crt and corstone1000_capsule_key.key are=
 installed
+# by the U-Boot recipe so this recipe has to depend on that.
+CAPSULE_IMGTYPE =3D ""
+CAPSULE_CERTIFICATE_PATH =3D "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_c=
ert.crt"
+CAPSULE_GUID:corstone1000-fvp ?=3D "989f3a4e-46e0-4cd0-9877-a25c70c01329=
"
+CAPSULE_GUID:corstone1000-mps3 ?=3D "df1865d1-90fb-4d59-9c38-c9f2c1bba8c=
c"
+CAPSULE_IMGLOCATION =3D "${DEPLOY_DIR_IMAGE}"
+CAPSULE_INDEX =3D "1"
+CAPSULE_MONOTONIC_COUNT =3D "1"
+CAPSULE_PRIVATE_KEY_PATH =3D "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_k=
ey.key"
+UEFI_FIRMWARE_BINARY =3D "${B}/${MACHINE}_image.nopt"
=20
 # TF-A settings for signing host images
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
@@ -73,3 +87,9 @@ create_nopt_image() {
 }
 create_nopt_image[depends] +=3D "mc:firmware:linux-yocto:do_deploy"
 do_image_uefi_capsule[prefuncs] +=3D "create_nopt_image"
+
+do_deploy() {
+    install -m 0755 ${B}/${MACHINE}_image.nopt  ${DEPLOYDIR}
+}
+
+addtask deploy after do_image_uefi_capsule
diff --git a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-fir=
mware-image-capsule-update-image.json b/meta-arm-bsp/recipes-bsp/images/f=
iles/corstone1000-flash-firmware-image-capsule-update-image.json
deleted file mode 100644
index 0f011ff7..00000000
--- a/meta-arm-bsp/recipes-bsp/images/files/corstone1000-flash-firmware-i=
mage-capsule-update-image.json
+++ /dev/null
@@ -1,11 +0,0 @@
-{
-    "Payloads": [
-        {
-            "FwVersion": "5",
-            "Guid": "e2bb9c06-70e9-4b14-97a3-5a7913176e3f",
-            "LowestSupportedVersion": "1",
-            "Payload": "$UEFI_FIRMWARE_BINARY",
-            "UpdateImageIndex": "0"
-        }
-    ]
-}
diff --git a/meta-arm/classes/uefi_capsule.bbclass b/meta-arm/classes/uef=
i_capsule.bbclass
index 690e7af4..a0709c0f 100644
--- a/meta-arm/classes/uefi_capsule.bbclass
+++ b/meta-arm/classes/uefi_capsule.bbclass
@@ -1,13 +1,10 @@
 # This class generates UEFI capsules
 # The current class supports generating a capsule with single firmware b=
inary
=20
-DEPENDS +=3D "gettext-native"
-inherit python3native
-
 IMAGE_TYPES +=3D "uefi_capsule"
=20
-# edk2 base tools should be installed in the native sysroot directory
-do_image_uefi_capsule[depends] +=3D "edk2-basetools-native:do_populate_s=
ysroot"
+# u-boot-tools should be installed in the native sysroot directory
+do_image_uefi_capsule[depends] +=3D "u-boot-tools-native:do_populate_sys=
root"
=20
 # By default the wic image is used to create a capsule
 CAPSULE_IMGTYPE ?=3D "wic"
@@ -18,37 +15,37 @@ CAPSULE_IMGLOCATION ?=3D "${IMGDEPLOYDIR}"
 # The generated capsule by default has uefi.capsule extension
 CAPSULE_EXTENSION ?=3D "uefi.capsule"
=20
+# The generated capsule's name by default is the same as UEFI_FIRMWARE_B=
INARY
+CAPSULE_NAME ?=3D "${UEFI_FIRMWARE_BINARY}"
+
 # The following variables must be set to be able to generate a capsule u=
pdate
+CAPSULE_CERTIFICATE_PATH ?=3D ""
+CAPSULE_FW_VERSION ?=3D ""
+CAPSULE_GUID ?=3D ""
+CAPSULE_INDEX ?=3D ""
+CAPSULE_MONOTONIC_COUNT ?=3D ""
+CAPSULE_PRIVATE_KEY_PATH ?=3D ""
 UEFI_FIRMWARE_BINARY ?=3D ""
-UEFI_CAPSULE_CONFIG ?=3D ""
=20
 # Check if the required variables are set
 python() {
-    for var in ["UEFI_FIRMWARE_BINARY", "UEFI_CAPSULE_CONFIG"]:
+    for var in ["CAPSULE_CERTIFICATE_PATH", "CAPSULE_FW_VERSION", \
+                "CAPSULE_GUID", "CAPSULE_INDEX", \
+                "CAPSULE_MONOTONIC_COUNT", "CAPSULE_PRIVATE_KEY_PATH", \
+                "UEFI_FIRMWARE_BINARY"]:
         if not d.getVar(var):
             raise bb.parse.SkipRecipe(f"{var} not set")
 }
=20
 IMAGE_CMD:uefi_capsule(){
-
-    # Force the GenerateCapsule script to use python3
-    export PYTHON_COMMAND=3D${PYTHON}
-
-    # Copy the firmware and the capsule config json to current directory
-    if [ -e ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} ]; then
-        cp ${CAPSULE_IMGLOCATION}/${UEFI_FIRMWARE_BINARY} . ;
-    fi
-
-    export UEFI_FIRMWARE_BINARY=3D${UEFI_FIRMWARE_BINARY}
-    envsubst < ${UEFI_CAPSULE_CONFIG} > ./${MACHINE}-capsule-update-imag=
e.json
-
-    ${STAGING_DIR_NATIVE}/usr/bin/edk2-BaseTools/BinWrappers/PosixLike/G=
enerateCapsule \
-    -e -o ${IMGDEPLOYDIR}/${UEFI_FIRMWARE_BINARY}.${CAPSULE_EXTENSION} -=
j \
-    ${MACHINE}-capsule-update-image.json
-
-    # Remove the firmware to avoid contamination of IMGDEPLOYDIR
-    rm ${UEFI_FIRMWARE_BINARY}
-
+    mkeficapsule --certificate ${CAPSULE_CERTIFICATE_PATH} \
+                 --fw-version ${CAPSULE_FW_VERSION} \
+                 --guid ${CAPSULE_GUID} \
+                 --index ${CAPSULE_INDEX} \
+                 --monotonic-count ${CAPSULE_MONOTONIC_COUNT} \
+                 --private-key ${CAPSULE_PRIVATE_KEY_PATH} \
+                 ${UEFI_FIRMWARE_BINARY} \
+                 ${CAPSULE_IMGLOCATION}/${CAPSULE_NAME}.${CAPSULE_EXTENS=
ION}
 }
=20
 # The firmware binary should be created before generating the capsule
--=20
2.25.1


