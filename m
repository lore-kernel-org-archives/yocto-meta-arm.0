Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE5D0C6FA9E
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 12:05:16 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6959.1677067511841091151
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 22 Feb 2023 04:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56DB4139F;
	Wed, 22 Feb 2023 04:05:54 -0800 (PST)
Received: from e125920.cambridge.arm.com (unknown [10.1.199.64])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA2F03F881;
	Wed, 22 Feb 2023 04:05:10 -0800 (PST)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 6/6] arm/classes: Add sstate support to tfm_sign_images
Date: Wed, 22 Feb 2023 12:04:41 +0000
Message-Id: <20230222120441.2684534-6-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222120441.2684534-1-peter.hoyes@arm.com>
References: <20230222120441.2684534-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 22 Feb 2023 12:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4442

From: Peter Hoyes <Peter.Hoyes@arm.com>

Defining a task called do_deploy in an image recipe causes the
license_image bbclass in OE-core to think the recipe is not an image
recipe, which causes errors with license information collection if you
have an image recipe which depends on an image recipe using this
bbclass.

To fix this, and to add support for caching the signed binaries, use a
single task, do_sign_images (and its setscene task). The implementation
is based on deploy.bbclass, so the sstate is responsible for installing
the signed binaries in ${DEPLOY_DIR_IMAGE}, but using a different name
so that license information collection still works as expected.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
---
 .../recipes-bsp/images/corstone1000-image.bb  |  3 +-
 meta-arm/classes/tfm_sign_image.bbclass       | 28 +++++++++----------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index 932b1619..3a1639ea 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -24,7 +24,8 @@ do_sign_images() {
=20
     # Update BL2 in the FIP image
     cp ${RECIPE_SYSROOT}/firmware/${TFA_FIP_BINARY} .
-    fiptool update --tb-fw ${TFM_IMAGE_SIGN_DIR}/signed_${TFA_BL2_BINARY=
} \
+    fiptool update --tb-fw \
+        ${TFM_IMAGE_SIGN_DEPLOY_DIR}/signed_${TFA_BL2_BINARY} \
         ${TFM_IMAGE_SIGN_DIR}/${TFA_FIP_BINARY}
=20
     # Sign the FIP image
diff --git a/meta-arm/classes/tfm_sign_image.bbclass b/meta-arm/classes/t=
fm_sign_image.bbclass
index 5ba57dc8..24df7682 100644
--- a/meta-arm/classes/tfm_sign_image.bbclass
+++ b/meta-arm/classes/tfm_sign_image.bbclass
@@ -6,28 +6,28 @@
 #  * Write the signing logic, which may call the function sign_host_imag=
e,
 #    described below
=20
-inherit python3native deploy
+inherit python3native
=20
 # The output and working directory
 TFM_IMAGE_SIGN_DIR =3D "${WORKDIR}/tfm-signed-images"
+TFM_IMAGE_SIGN_DEPLOY_DIR =3D "${WORKDIR}/deploy-tfm-signed-images"
=20
+SSTATETASKS +=3D "do_sign_images"
+do_sign_images[sstate-inputdirs] =3D "${TFM_IMAGE_SIGN_DEPLOY_DIR}"
+do_sign_images[sstate-outputdirs] =3D "${DEPLOY_DIR_IMAGE}"
+do_sign_images[dirs] =3D "${TFM_IMAGE_SIGN_DEPLOY_DIR} ${TFM_IMAGE_SIGN_=
DIR}"
+do_sign_images[cleandirs] =3D "${TFM_IMAGE_SIGN_DEPLOY_DIR} ${TFM_IMAGE_=
SIGN_DIR}"
+do_sign_images[stamp-extra-info] =3D "${MACHINE_ARCH}"
 tfm_sign_image_do_sign_images() {
     :
 }
-addtask sign_images after do_configure before do_compile
-do_sign_images[dirs] =3D "${TFM_IMAGE_SIGN_DIR}"
+addtask sign_images after do_prepare_recipe_sysroot before do_image
+EXPORT_FUNCTIONS do_sign_images
=20
-tfm_sign_image_do_deploy() {
-    :
-}
-addtask deploy after do_sign_images
-
-deploy_signed_images() {
-    cp ${TFM_IMAGE_SIGN_DIR}/signed_* ${DEPLOYDIR}/
+python do_sign_images_setscene () {
+    sstate_setscene(d)
 }
-do_deploy[postfuncs] +=3D "deploy_signed_images"
-
-EXPORT_FUNCTIONS do_sign_images do_deploy
+addtask do_sign_images_setscene
=20
 DEPENDS +=3D "trusted-firmware-m-scripts-native"
=20
@@ -77,7 +77,7 @@ enum image_attributes {
 };
 EOF
=20
-    host_binary_signed=3D"${TFM_IMAGE_SIGN_DIR}/signed_$(basename "${1}"=
)"
+    host_binary_signed=3D"${TFM_IMAGE_SIGN_DEPLOY_DIR}/signed_$(basename=
 "${1}")"
=20
     ${PYTHON} "${STAGING_LIBDIR_NATIVE}/tfm-scripts/wrapper/wrapper.py" =
\
             ${TFM_IMAGE_SIGN_ARGS} \
--=20
2.34.1


