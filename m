Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BD3C433F5
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 11:29:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17957.1664796568854551002
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 04:29:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B1A6139F;
	Mon,  3 Oct 2022 04:29:35 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.80.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9EE643F67D;
	Mon,  3 Oct 2022 04:29:27 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 2/3] arm/classes: Migrate TF-M image signing to bbclass
Date: Mon,  3 Oct 2022 12:29:58 +0100
Message-Id: <20221003112959.2123869-2-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003112959.2123869-1-peter.hoyes@arm.com>
References: <20221003112959.2123869-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 11:29:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3892

From: Peter Hoyes <Peter.Hoyes@arm.com>

Introduce a new recipe for the TF-M signing scripts.

To make the functionality easier to reuse, move the logic that is
currently in trusted-firmware-m-sign-host-images.inc to
tfm_sign_image.bbclass. This bbclass DEPENDS on
trusted-firmware-m-scrpits-native.

tfm_sign_image.bbclass can be inherited in image recipes to sign
artifacts.

Issue-Id: SCM-4964
Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: I74aaab5db1a43fedf13ea2564c2f31af207ae924
---
 .../trusted-firmware-m-sign-host-images.inc   | 50 ------------
 meta-arm/classes/tfm_sign_image.bbclass       | 79 +++++++++++++++++++
 ...trusted-firmware-m-scripts-native_1.6.0.bb | 24 ++++++
 3 files changed, 103 insertions(+), 50 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-f=
irmware-m-sign-host-images.inc
 create mode 100644 meta-arm/classes/tfm_sign_image.bbclass
 create mode 100644 meta-arm/recipes-devtools/trusted-firmware-m-scripts/=
trusted-firmware-m-scripts-native_1.6.0.bb

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-sign-host-images.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/tru=
sted-firmware-m-sign-host-images.inc
deleted file mode 100644
index 49af3568..00000000
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sign=
-host-images.inc
+++ /dev/null
@@ -1,50 +0,0 @@
-# Signing host images using TF-M tools
-
-DEPENDS +=3D "python3-imgtool-native fiptool-native"
-
-#
-# sign_host_image
-#
-# Description:
-#
-# A generic function that signs a host image
-# using MCUBOOT format
-#
-# Arguments:
-#
-# $1 ... host binary to sign
-# $2 ... host binary path
-# $3 ... load address of the given binary
-# $4 ... signed binary size
-#
-# Note: The signed binary is copied to ${D}/firmware
-#
-sign_host_image() {
-
-    host_binary_filename=3D"`basename -s .bin ${1}`"
-    host_binary_layout=3D"${host_binary_filename}_ns"
-
-    cat << EOF > ${B}/${host_binary_layout}
-enum image_attributes {
-    RE_IMAGE_LOAD_ADDRESS =3D ${3},
-    RE_SIGN_BIN_SIZE =3D ${4},
-};
-EOF
-
-    host_binary=3D"${2}/`basename ${1}`"
-    host_binary_signed=3D"${D}/firmware/signed_`basename ${1}`"
-
-    ${PYTHON} ${S}/bl2/ext/mcuboot/scripts/wrapper/wrapper.py \
-            -v ${RE_LAYOUT_WRAPPER_VERSION} \
-            --layout ${B}/${host_binary_layout} \
-            -k  ${TFM_SIGN_PRIVATE_KEY} \
-            --public-key-format full \
-            --align 1 \
-            --pad \
-            --pad-header \
-            -H ${RE_IMAGE_OFFSET} \
-            -s auto \
-            ${host_binary} \
-            ${host_binary_signed}
-
-}
diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
new file mode 100644
index 00000000..542b708b
--- /dev/null
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -0,0 +1,79 @@
+# Functionality to sign binary images using the wrapper script bundled w=
ith
+# TF-M. Signed images are written to the deploy directory by default.
+# To use:
+#  * Inherit this class
+#  * Override the do_sign_images task
+#  * Write the signing logic, which may call the function sign_host_imag=
e,
+#    described below
+
+inherit python3native deploy
+
+# The output and working directory
+TFM_IMAGE_SIGN_DIR =3D "${WORKDIR}/tfm-signed-images"
+
+tfm_sign_image_do_sign_images() {
+    :
+}
+addtask sign_images after do_configure before do_compile
+do_sign_images[dirs] =3D "${TFM_IMAGE_SIGN_DIR}"
+
+tfm_sign_image_do_deploy() {
+    :
+}
+addtask deploy after do_sign_images
+
+deploy_signed_images() {
+    cp ${TFM_IMAGE_SIGN_DIR}/signed_* ${DEPLOYDIR}/
+}
+do_deploy[postfuncs] +=3D "deploy_signed_images"
+
+EXPORT_FUNCTIONS do_sign_images do_deploy
+
+DEPENDS +=3D "trusted-firmware-m-scripts-native"
+
+# python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
+# right path until this is relocated automatically.
+export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
+
+#
+# sign_host_image
+#
+# Description:
+#
+# A generic function that signs a host image
+# using MCUBOOT format
+#
+# Arguments:
+#
+# $1 ... path of binary to sign
+# $2 ... load address of the given binary
+# $3 ... signed binary size
+#
+# Note: The signed binary is copied to ${TFM_IMAGE_SIGN_DIR}
+#
+sign_host_image() {
+    host_binary_filename=3D"$(basename -s .bin "${1}")"
+    host_binary_layout=3D"${host_binary_filename}_ns"
+
+    cat << EOF > ${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}
+enum image_attributes {
+    RE_IMAGE_LOAD_ADDRESS =3D ${2},
+    RE_SIGN_BIN_SIZE =3D ${3},
+};
+EOF
+
+    host_binary_signed=3D"${TFM_IMAGE_SIGN_DIR}/signed_$(basename "${1}"=
)"
+
+    ${PYTHON} "${STAGING_LIBDIR_NATIVE}/tfm-scripts/wrapper/wrapper.py" =
\
+            -v ${RE_LAYOUT_WRAPPER_VERSION} \
+            --layout "${TFM_IMAGE_SIGN_DIR}/${host_binary_layout}" \
+            -k  "${RECIPE_SYSROOT_NATIVE}/${TFM_SIGN_PRIVATE_KEY}" \
+            --public-key-format full \
+            --align 1 \
+            --pad \
+            --pad-header \
+            -H ${RE_IMAGE_OFFSET} \
+            -s auto \
+            "${1}" \
+            "${host_binary_signed}"
+}
diff --git a/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted=
-firmware-m-scripts-native_1.6.0.bb b/meta-arm/recipes-devtools/trusted-f=
irmware-m-scripts/trusted-firmware-m-scripts-native_1.6.0.bb
new file mode 100644
index 00000000..453d456a
--- /dev/null
+++ b/meta-arm/recipes-devtools/trusted-firmware-m-scripts/trusted-firmwa=
re-m-scripts-native_1.6.0.bb
@@ -0,0 +1,24 @@
+
+SRC_URI =3D "git://git.trustedfirmware.org/TF-M/trusted-firmware-m.git;p=
rotocol=3Dhttps;branch=3D${SRCBRANCH}"
+# Use the wrapper script from TF-Mv1.6.0
+SRCBRANCH ?=3D "release/1.6.x"
+SRCREV =3D "7387d88158701a3c51ad51c90a05326ee12847a8"
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://license.rst;md5=3D07f368487da347f3c7bd0fc30=
85f3afa"
+
+S =3D "${WORKDIR}/git"
+
+inherit native
+
+RDEPENDS:${PN} =3D "python3-imgtool-native python3-click-native"
+
+do_configure[noexec] =3D "1"
+do_compile[noexec] =3D "1"
+
+do_install() {
+    install -d ${D}/${libdir}
+    cp -rf ${S}/bl2/ext/mcuboot/scripts/ ${D}/${libdir}/tfm-scripts
+    cp -rf ${S}/bl2/ext/mcuboot/*.pem ${D}/${libdir}/tfm-scripts
+}
+FILES:${PN} =3D "${libdir}/tfm-scripts"
--=20
2.25.1


