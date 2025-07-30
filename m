Return-Path: <harsimransingh.tungal@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4D11C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 11:54:00 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.33476.1753876437992477888
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 30 Jul 2025 04:53:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: harsimransingh.tungal@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EFDA2681;
	Wed, 30 Jul 2025 04:53:49 -0700 (PDT)
Received: from e132995.cambridge.arm.com (e132995.arm.com [10.1.25.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8B9213F66E;
	Wed, 30 Jul 2025 04:53:56 -0700 (PDT)
From: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
Subject: [PATCH 07/13] arm-bsp/corstone1000: Support multi-payload capsule generation
Date: Wed, 30 Jul 2025 12:53:21 +0100
Message-Id: <20250730115327.3671160-8-harsimransingh.tungal@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
References: <20250730115327.3671160-1-harsimransingh.tungal@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 30 Jul 2025 11:54:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6644

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

- Add 'CAPSULE_SELECTED_COMPONENTS' to enable filtering of firmware
  components during capsule generation. Only components listed in
  'CAPSULE_SELECTED_COMPONENTS' will be included in the final capsule
  image.

- Introduce CAPSULE_EXTRA_ARGS to allow passing additional arguments.
  '--capflag PersistAcrossReset' to retain capsule across reboots.

- Payload selection is now controlled via the KAS YAML configuration
  (corstone1000-image-configuration.yml), allowing per-image control
  over which firmware components are included.

- With the introduction of multiple payload support, 'CAPSULE_VERSION'
  no longer represents the firmware version itself but is instead
  used for naming the capsule and assigning a common version to all
  payloads to simplify testing.

- Use EDK2 tool to switch from single FMP capsule generation to multiple
  FMP capsules using a JSON-based configuration. This removes the need
  for manually combining firmware images into a .nopt image.

- Remove legacy nopt image creation logic, as each firmware binary is
  now handled individually. Components no longer need to be merged.
  Deploy task was removed with nopt logic.

- Generate dummy.bin for EDK2 tool compatibility. EDK2 requires
  at least one input file for each payload.

- Added dependency on  to  to ensure images are signed before capsule
  generation.

- Add CAPSULE_LOWEST_SUPPORTED_VERSION to
  corstone1000-image-configuration.yml.It in the same file where
  the firmware version (FW_VERSION) is defined, ensuring a unified
  location for version-related metadata. This value was chosen to
  be equal to the firmware version to represent a downgrade
  scenario (from version 6 to version 5) during testing.

- CAPSULE_HARDWARE_INSTANCE is set to "1" by default (instead of 0),
  indicating the first hardware.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
Signed-off-by: Harsimran Singh Tungal <harsimransingh.tungal@arm.com>
---
 kas/corstone1000-image-configuration.yml      |   5 +-
 .../corstone1000-flash-firmware-image.bb      | 165 ++++++++++++++----
 2 files changed, 133 insertions(+), 37 deletions(-)

diff --git a/kas/corstone1000-image-configuration.yml b/kas/corstone1000-=
image-configuration.yml
index f955d7ab..b5e17200 100644
--- a/kas/corstone1000-image-configuration.yml
+++ b/kas/corstone1000-image-configuration.yml
@@ -41,6 +41,7 @@ local_conf_header:
     CORE_IMAGE_EXTRA_INSTALL:firmware +=3D "packagegroup-ts-tests-psa"
=20
   capsule: |
+    # These variables are set here since they are not defined in the arm=
-systemready-firmware recipe or under multiconfig mode.
     CAPSULE_EXTENSION =3D "uefi.capsule"
-    CAPSULE_FW_VERSION =3D "6"
-    CAPSULE_NAME =3D "${MACHINE}-v${CAPSULE_FW_VERSION}"
+    CAPSULE_VERSION =3D "6"
+    CAPSULE_NAME =3D "${MACHINE}-v${CAPSULE_VERSION}"
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-=
image.bb b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-im=
age.bb
index 5d313c7b..2b9a180d 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-flash-firmware-image.b=
b
@@ -26,21 +26,133 @@ IMAGE_LINGUAS =3D ""
=20
 PACKAGE_INSTALL =3D ""
=20
-# The generated ${MACHINE}_image.nopt is used instead of the default wic=
 image
-# for the capsule generation. The uefi.capsule image type doesn't have t=
o
-# depend on the wic because of this.
-#
 # The corstone1000_capsule_cert.crt and corstone1000_capsule_key.key are=
 installed
 # by the U-Boot recipe so this recipe has to depend on that.
+
 CAPSULE_IMGTYPE =3D ""
-CAPSULE_CERTIFICATE_PATH =3D "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_c=
ert.crt"
-CAPSULE_GUID:corstone1000-fvp ?=3D "989f3a4e-46e0-4cd0-9877-a25c70c01329=
"
-CAPSULE_GUID:corstone1000-mps3 ?=3D "df1865d1-90fb-4d59-9c38-c9f2c1bba8c=
c"
-CAPSULE_IMGLOCATION =3D "${DEPLOY_DIR_IMAGE}"
-CAPSULE_INDEX =3D "1"
-CAPSULE_MONOTONIC_COUNT =3D "1"
-CAPSULE_PRIVATE_KEY_PATH =3D "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_k=
ey.key"
-UEFI_FIRMWARE_BINARY =3D "${B}/${MACHINE}_image.nopt"
+CAPSULE_IMG_LOCATION =3D "${DEPLOY_DIR_IMAGE}"
+
+# User-configurable common capsule settings
+CAPSULE_EXTENSION ?=3D "uefi.capsule"
+CAPSULE_VERSION ?=3D "6"
+CAPSULE_LOWEST_SUPPORTED_VERSION ?=3D "6"
+CAPSULE_NAME ?=3D "${MACHINE}-v${CAPSULE_VERSION}"
+CAPSULE_SELECTED_COMPONENTS ?=3D "BL2 TFM_S FIP INITRAMFS"
+CAPSULE_EXTRA_ARGS ?=3D "--capflag PersistAcrossReset"
+
+# Non-configurable common payloads settings
+PAYLOAD_CERTIFICATE_PATH =3D "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_c=
ert.crt"
+PAYLOAD_HARDWARE_INSTANCE =3D "1"
+PAYLOAD_MONOTONIC_COUNT =3D "1"
+PAYLOAD_PRIVATE_KEY_PATH =3D "${DEPLOY_DIR_IMAGE}/corstone1000_capsule_k=
ey.key"
+CAPSULE_SELECTED_COMPONENTS +=3D " DUMMY_START DUMMY_END"
+
+# All capsule fields are reset and initialized with DUMMY_START since it=
 is the first payload
+# DUMMY_START
+PAYLOAD_DUMMY_START_INDEX ?=3D "5"
+PAYLOAD_DUMMY_START_VERSION ?=3D "${CAPSULE_VERSION}"
+PAYLOAD_DUMMY_START_LOWEST_SUPPORTED_VERSION ?=3D "${CAPSULE_LOWEST_SUPP=
ORTED_VERSION}"
+PAYLOAD_DUMMY_START_GUID ?=3D  "6f784cbf-7938-5c23-8d6e-24d2f1410fa9"
+
+CAPSULE_ALL_COMPONENTS =3D "DUMMY_START "
+CAPSULE_CERTIFICATE_PATHS =3D "${PAYLOAD_CERTIFICATE_PATH} "
+CAPSULE_GUIDS =3D "${PAYLOAD_DUMMY_START_GUID} "
+CAPSULE_INDEXES =3D "${PAYLOAD_DUMMY_START_INDEX} "
+CAPSULE_HARDWARE_INSTANCES =3D "${PAYLOAD_HARDWARE_INSTANCE} "
+CAPSULE_MONOTONIC_COUNTS =3D "${PAYLOAD_MONOTONIC_COUNT} "
+CAPSULE_PRIVATE_KEY_PATHS =3D "${PAYLOAD_PRIVATE_KEY_PATH} "
+UEFI_FIRMWARE_BINARIES =3D "${B}/dummy.bin "
+CAPSULE_FW_VERSIONS =3D "${PAYLOAD_DUMMY_START_VERSION} "
+CAPSULE_LOWEST_SUPPORTED_VERSIONS =3D "${PAYLOAD_DUMMY_START_LOWEST_SUPP=
ORTED_VERSION} "
+
+# BL2
+PAYLOAD_BL2_INDEX ?=3D "1"
+PAYLOAD_BL2_VERSION ?=3D "${CAPSULE_VERSION}"
+PAYLOAD_BL2_LOWEST_SUPPORTED_VERSION ?=3D "${CAPSULE_LOWEST_SUPPORTED_VE=
RSION}"
+PAYLOAD_BL2_GUID:corstone1000-fvp ?=3D "f1d883f9-dfeb-5363-98d8-686ee3b6=
9f4f"
+PAYLOAD_BL2_GUID:corstone1000-mps3 ?=3D "fbfbefaa-0a56-50d5-b651-74091d3=
d62cf"
+
+CAPSULE_ALL_COMPONENTS +=3D "BL2 "
+CAPSULE_CERTIFICATE_PATHS +=3D "${PAYLOAD_CERTIFICATE_PATH} "
+CAPSULE_GUIDS +=3D "${PAYLOAD_BL2_GUID} "
+CAPSULE_INDEXES +=3D "${PAYLOAD_BL2_INDEX} "
+CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
+CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
+CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/bl2_signed.bin "
+CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_BL2_VERSION} "
+CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_BL2_LOWEST_SUPPORTED_V=
ERSION} "
+
+# TFM_S
+PAYLOAD_TFM_S_INDEX ?=3D "2"
+PAYLOAD_TFM_S_VERSION ?=3D "${CAPSULE_VERSION}"
+PAYLOAD_TFM_S_LOWEST_SUPPORTED_VERSION ?=3D "${CAPSULE_LOWEST_SUPPORTED_=
VERSION}"
+PAYLOAD_TFM_S_GUID:corstone1000-fvp ?=3D "7fad470e-5ec5-5c03-a2c1-4756b4=
95de61"
+PAYLOAD_TFM_S_GUID:corstone1000-mps3 ?=3D "af4cc7ad-ee2e-5a39-aad5-fac8a=
1e6173c"
+
+CAPSULE_ALL_COMPONENTS +=3D "TFM_S "
+CAPSULE_CERTIFICATE_PATHS +=3D "${PAYLOAD_CERTIFICATE_PATH} "
+CAPSULE_GUIDS +=3D "${PAYLOAD_TFM_S_GUID} "
+CAPSULE_INDEXES +=3D "${PAYLOAD_TFM_S_INDEX} "
+CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
+CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
+CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/tfm_s_signed.bin "
+CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_TFM_S_VERSION} "
+CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_TFM_S_LOWEST_SUPPORTED=
_VERSION} "
+
+# FIP
+PAYLOAD_FIP_INDEX ?=3D "3"
+PAYLOAD_FIP_VERSION ?=3D "${CAPSULE_VERSION}"
+PAYLOAD_FIP_LOWEST_SUPPORTED_VERSION ?=3D "${CAPSULE_LOWEST_SUPPORTED_VE=
RSION}"
+PAYLOAD_FIP_GUID:corstone1000-fvp ?=3D "f1933675-5a8c-5b6d-9ef4-846739e8=
9bc8"
+PAYLOAD_FIP_GUID:corstone1000-mps3 ?=3D "55302f96-c4f0-5cf9-8624-e7cc388=
f2b68"
+
+CAPSULE_ALL_COMPONENTS +=3D "FIP "
+CAPSULE_CERTIFICATE_PATHS +=3D "${PAYLOAD_CERTIFICATE_PATH} "
+CAPSULE_GUIDS +=3D "${PAYLOAD_FIP_GUID} "
+CAPSULE_INDEXES +=3D "${PAYLOAD_FIP_INDEX} "
+CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
+CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
+CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/signed_fip-corstone1000=
.bin "
+CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_FIP_VERSION} "
+CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_FIP_LOWEST_SUPPORTED_V=
ERSION} "
+
+# INITRAMFS
+PAYLOAD_INITRAMFS_INDEX ?=3D "4"
+PAYLOAD_INITRAMFS_VERSION ?=3D "${CAPSULE_VERSION}"
+PAYLOAD_INITRAMFS_LOWEST_SUPPORTED_VERSION ?=3D "${CAPSULE_LOWEST_SUPPOR=
TED_VERSION}"
+PAYLOAD_INITRAMFS_GUID:corstone1000-fvp ?=3D "f771aff9-c7e9-5f99-9eda-23=
69dd694f61"
+PAYLOAD_INITRAMFS_GUID:corstone1000-mps3 ?=3D "3e8ac972-c33c-5cc9-90a0-c=
dd3159683ea"
+
+CAPSULE_ALL_COMPONENTS +=3D "INITRAMFS "
+CAPSULE_CERTIFICATE_PATHS +=3D "${PAYLOAD_CERTIFICATE_PATH} "
+CAPSULE_GUIDS +=3D "${PAYLOAD_INITRAMFS_GUID} "
+CAPSULE_INDEXES +=3D "${PAYLOAD_INITRAMFS_INDEX} "
+CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE} "
+CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT} "
+CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH} "
+UEFI_FIRMWARE_BINARIES +=3D "${DEPLOY_DIR_IMAGE}/Image.gz-initramfs-${MA=
CHINE}.bin "
+CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_INITRAMFS_VERSION} "
+CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_INITRAMFS_LOWEST_SUPPO=
RTED_VERSION} "
+
+# DUMMY_END
+PAYLOAD_DUMMY_END_INDEX ?=3D "6"
+PAYLOAD_DUMMY_END_VERSION ?=3D "${CAPSULE_VERSION}"
+PAYLOAD_DUMMY_END_LOWEST_SUPPORTED_VERSION ?=3D "${CAPSULE_LOWEST_SUPPOR=
TED_VERSION}"
+PAYLOAD_DUMMY_END_GUID ?=3D "b57e432b-a250-5c73-93e3-90205e64baba"
+
+CAPSULE_ALL_COMPONENTS +=3D "DUMMY_END"
+CAPSULE_CERTIFICATE_PATHS +=3D "${PAYLOAD_CERTIFICATE_PATH}"
+CAPSULE_GUIDS +=3D "${PAYLOAD_DUMMY_END_GUID}"
+CAPSULE_INDEXES +=3D "${PAYLOAD_DUMMY_END_INDEX}"
+CAPSULE_HARDWARE_INSTANCES +=3D "${PAYLOAD_HARDWARE_INSTANCE}"
+CAPSULE_MONOTONIC_COUNTS +=3D "${PAYLOAD_MONOTONIC_COUNT}"
+CAPSULE_PRIVATE_KEY_PATHS +=3D "${PAYLOAD_PRIVATE_KEY_PATH}"
+UEFI_FIRMWARE_BINARIES +=3D "${B}/dummy.bin"
+CAPSULE_FW_VERSIONS +=3D "${PAYLOAD_DUMMY_END_VERSION}"
+CAPSULE_LOWEST_SUPPORTED_VERSIONS +=3D "${PAYLOAD_DUMMY_END_LOWEST_SUPPO=
RTED_VERSION}"
=20
 # TF-A settings for signing host images
 TFA_BL2_BINARY =3D "bl2-corstone1000.bin"
@@ -53,13 +165,6 @@ RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
 TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
-# Offsets for the .nopt image generation
-# These offset values have to be aligned with those in
-# meta-arm/meta-arm-bsp/wic/corstone1000-flash-firmware.wks.in
-TFM_OFFSET =3D "147456"
-FIP_OFFSET =3D "475136"
-KERNEL_OFFSET =3D "2572288"
-
 do_sign_images() {
     # Sign TF-A BL2
     sign_host_image ${RECIPE_SYSROOT}/firmware/${TFA_BL2_BINARY} \
@@ -79,21 +184,11 @@ do_sign_images[depends] =3D "\
     fiptool-native:do_populate_sysroot \
     "
=20
-# This .nopt image is not the same as the one which is generated by meta=
-arm/meta-arm/classes/wic_nopt.bbclass.
-# The meta-arm/meta-arm/classes/wic_nopt.bbclass removes the partition t=
able from the wic image, but keeps the
-# second bank. This function creates a no-partition image with only the =
first bank.
-create_nopt_image() {
-    dd conv=3Dnotrunc bs=3D1 if=3D${DEPLOY_DIR_IMAGE}/bl2_signed.bin of=3D=
${B}/${MACHINE}_image.nopt
-    dd conv=3Dnotrunc bs=3D1 if=3D${DEPLOY_DIR_IMAGE}/tfm_s_signed.bin o=
f=3D${B}/${MACHINE}_image.nopt seek=3D${TFM_OFFSET}
-    dd conv=3Dnotrunc bs=3D1 if=3D${DEPLOY_DIR_IMAGE}/signed_fip-corston=
e1000.bin of=3D${B}/${MACHINE}_image.nopt seek=3D${FIP_OFFSET}
-    dd conv=3Dnotrunc bs=3D1 if=3D${DEPLOY_DIR_IMAGE}/Image.gz-initramfs=
-${MACHINE}.bin of=3D${B}/${MACHINE}_image.nopt seek=3D${KERNEL_OFFSET}
-}
-do_image_uefi_capsule[depends] +=3D " linux-yocto:do_deploy"
-do_image_uefi_capsule[mcdepends] +=3D " ${@bb.utils.contains('BBMULTICON=
FIG', 'firmware', 'mc::firmware:linux-yocto:do_deploy', '', d)}"
-do_image_uefi_capsule[prefuncs] +=3D "create_nopt_image"
-
-do_deploy() {
-    install -m 0755 ${B}/${MACHINE}_image.nopt  ${DEPLOYDIR}
+# Create an empty dummy payload file required for capsule generation
+create_dummy_image() {
+    touch  ${B}/dummy.bin
 }
=20
-addtask deploy after do_image_uefi_capsule
+do_image_uefi_capsule[depends] +=3D " linux-yocto:do_deploy corstone1000=
-flash-firmware-image:do_sign_images"
+do_image_uefi_capsule[mcdepends] +=3D " ${@bb.utils.contains('BBMULTICON=
FIG', 'firmware', 'mc::firmware:linux-yocto:do_deploy mc::firmware:corsto=
ne1000-flash-firmware-image:do_sign_images', '', d)}"
+do_image_uefi_capsule[prefuncs] +=3D "create_dummy_image"

