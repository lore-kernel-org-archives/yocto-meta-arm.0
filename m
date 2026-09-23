Return-Path: <Ahmed.Gomaa@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F871C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 09:53:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3417.1790157212311375380
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 02:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=hURrZquG;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ahmed.gomaa@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3AEDE1576;
	Wed, 23 Sep 2026 02:53:28 -0700 (PDT)
Received: from e142471.cambridge.arm.com (e142471.arm.com [10.2.210.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 448E13F86F;
	Wed, 23 Sep 2026 02:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790157211; bh=37pnmChj9d4B/cja/2+4mHXcS2wE1K/+kJlHAF82OuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hURrZquGs8DFvhQ9ZzWDVZPLVpI3hcRKe7iM/RyOJSZ/U4BRM6KCXgaZTBlYLuIwL
	 XIEToR0UkNVqSS5MXSbR+UZEYIxZIaMOwePFPttSJLrrwa+OtFxw/lASfGUGAMTIK/
	 XAYnP8iCo9rvbu9ncimhpc0UopldNzj25QHfQ35M=
From: Ahmed Gomaa <ahmed.gomaa@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ahmed Gomaa <ahmed.gomaa@arm.com>
Subject: [PATCH 1/3] arm/trusted-firmware-m: add TF-M 2.3 signing support
Date: Wed, 23 Sep 2026 10:53:12 +0100
Message-ID: <20260923095314.382668-2-ahmed.gomaa@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923095314.382668-1-ahmed.gomaa@arm.com>
References: <20260923095314.382668-1-ahmed.gomaa@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Sep 2026 09:53:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7171

TF-M 2.3 packages its image-signing wrapper as the
mcuboot_imagesign_wrapper console command. Add the required native
Python runtime dependencies and install the bundled MCUboot PEM
signing keys in the native sysroot.

Install TF-M's patched MCUboot imgtool package, including its
imgtool.keys Python modules for loading and handling cryptographic
keys. These modules are part of the signing tool implementation,
separate from the PEM signing-key files installed above.

Prefer this patched package through PYTHONPATH because it supports
PSA key IDs and writes them into signed image metadata.

Update tfm_sign_image.bbclass to invoke the console command when
available, retaining wrapper.py as a fallback for older TF-M versions.
Add optional PSA key ID arguments so platforms can provide the
identifier expected by BL2 during image verification.

Signed-off-by: Ahmed Gomaa <ahmed.gomaa@arm.com>
---
 meta-arm/classes/tfm_sign_image.bbclass       | 18 +++++++++++++++-
 ...trusted-firmware-m-scripts-native_2.3.0.bb | 21 +++++++++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
index f7900bb0..adc919a1 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -17,6 +17,11 @@ TFM_IMAGE_SIGN_DEPLOY_DIR =3D "${WORKDIR}/deploy-tfm-s=
igned-images"
 # version by default
 RE_WRAPPER_SECURITY_COUNTER ?=3D "auto"
=20
+# Optional PSA key IDs to add to the signed image. Multiple IDs may be
+# provided as a space-separated list.
+TFM_IMAGE_SIGN_PSA_KEY_IDS ?=3D ""
+TFM_IMAGE_SIGN_PSA_KEY_ID_ARGS =3D "${@' '.join(['--psa-key-ids %s' % ke=
y_id for key_id in d.getVar('TFM_IMAGE_SIGN_PSA_KEY_IDS').split()])}"
+
 SSTATETASKS +=3D "do_sign_images"
 do_sign_images[sstate-inputdirs] =3D "${TFM_IMAGE_SIGN_DEPLOY_DIR}"
 do_sign_images[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
@@ -47,6 +52,7 @@ TFM_IMAGE_SIGN_ARGS ?=3D "\
     -s ${RE_WRAPPER_SECURITY_COUNTER} \
     --layout "${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}" \
     --public-key-format full \
+    ${TFM_IMAGE_SIGN_PSA_KEY_ID_ARGS} \
     --align 1 \
     --pad \
     --pad-header \
@@ -86,7 +92,17 @@ EOF
=20
     host_binary_signed=3D"${TFM_IMAGE_SIGN_DEPLOY_DIR}/signed_$(basename=
 "${1}")"
=20
-    ${PYTHON} "${STAGING_LIBDIR_NATIVE}/tfm-scripts/wrapper/wrapper.py" =
\
+    # TF-M 2.3 installs the wrapper as a console script. Older releases =
use
+    # the Python script under tfm-scripts, so retain that as a fallback.
+    if [ -x "${STAGING_BINDIR_NATIVE}/mcuboot_imagesign_wrapper" ]; then
+        tfm_sign_wrapper=3D"${STAGING_BINDIR_NATIVE}/mcuboot_imagesign_w=
rapper"
+    else
+        tfm_sign_wrapper=3D"${PYTHON} ${STAGING_LIBDIR_NATIVE}/tfm-scrip=
ts/wrapper/wrapper.py"
+    fi
+
+    # TF-M's patched imgtool contains IMAGE_TLV_KEYID support required t=
o add
+    # PSA key IDs to image metadata; prefer it over python3-imgtool-nati=
ve.
+    PYTHONPATH=3D"${STAGING_LIBDIR_NATIVE}/tfm-scripts" ${tfm_sign_wrapp=
er} \
             ${TFM_IMAGE_SIGN_ARGS} \
             -k  "${signing_key_path}" \
             "${1}" \
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.3.0.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.3.0.bb
index b5220934..d1fa266f 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.3.0.bb
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scripts-=
native_2.3.0.bb
@@ -3,7 +3,28 @@ require recipes-bsp/trusted-firmware-m/trusted-firmware-=
m-${PV}-src.inc
 inherit native python_setuptools_build_meta
=20
 RDEPENDS:${PN} =3D "\
+    python3-cryptography-native \
+    python3-pyasn1-native \
+    python3-pyyaml-native \
+    python3-cbor2-native \
+    python3-imgtool-native \
+    python3-click-native \
     python3-pyelftools-native \
     python3-rich-native \
     clang-native \
 "
+
+do_install:append() {
+    install -d ${D}${libdir}/tfm-scripts
+    install -m 0644 ${S}/bl2/ext/mcuboot/*.pem ${D}${libdir}/tfm-scripts=
/
+
+    # TF-M applies additional patches to its bundled MCUboot imgtool. In=
stall
+    # that copy privately so the signing wrapper can emit TF-M-specific =
TLVs.
+    install -d ${D}${libdir}/tfm-scripts/imgtool/keys
+    install -m 0644 ${S}/external/mcuboot/scripts/imgtool/*.py \
+        ${D}${libdir}/tfm-scripts/imgtool/
+    install -m 0644 ${S}/external/mcuboot/scripts/imgtool/keys/*.py \
+        ${D}${libdir}/tfm-scripts/imgtool/keys/
+}
+
+FILES:${PN} +=3D "${libdir}/tfm-scripts"

