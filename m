Return-Path: <peter.hoyes@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C497DC433FE
	for <webhook@archiver.kernel.org>; Mon,  3 Oct 2022 11:29:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.17958.1664796571708910640
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 03 Oct 2022 04:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: peter.hoyes@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3EE06139F;
	Mon,  3 Oct 2022 04:29:37 -0700 (PDT)
Received: from e125920.arm.com (unknown [10.57.80.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AA8E33F67D;
	Mon,  3 Oct 2022 04:29:29 -0700 (PDT)
From: Peter Hoyes <peter.hoyes@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: diego.sueiro@arm.com,
	Peter Hoyes <Peter.Hoyes@arm.com>
Subject: [PATCH 3/3] arm-bsp/corstone1000: Refactor image signing to use new
 bbclass
Date: Mon,  3 Oct 2022 12:29:59 +0100
Message-Id: <20221003112959.2123869-3-peter.hoyes@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003112959.2123869-1-peter.hoyes@arm.com>
References: <20221003112959.2123869-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 03 Oct 2022 11:29:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3893

From: Peter Hoyes <Peter.Hoyes@arm.com>

The prevoius commit refactored trusted-firmware-m-sign-host-images.inc
into tfm_sign_image.bbclass.

Move the image signing logic from the TF-M bbappend to
corstone1000-image.bb, using the new bbclass.

Signed-off-by: Peter Hoyes <Peter.Hoyes@arm.com>
Change-Id: Ib76dce2ba9102e343d0611d929250d1d8aee518b
---
 .../conf/machine/include/corstone1000.inc     |  2 +-
 .../recipes-bsp/images/corstone1000-image.bb  | 21 ++++++++++++++++++-
 .../trusted-firmware-a-corstone1000.inc       |  3 ---
 .../trusted-firmware-m-corstone1000.inc       | 17 ---------------
 4 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/meta-arm-bsp/conf/machine/include/corstone1000.inc b/meta-ar=
m-bsp/conf/machine/include/corstone1000.inc
index 5d22b464..d0265364 100644
--- a/meta-arm-bsp/conf/machine/include/corstone1000.inc
+++ b/meta-arm-bsp/conf/machine/include/corstone1000.inc
@@ -18,7 +18,7 @@ TFA_BL2_RE_SIGN_BIN_SIZE =3D "0x2d000"
 TFA_FIP_RE_IMAGE_LOAD_ADDRESS =3D "0x68130000"
 TFA_FIP_RE_SIGN_BIN_SIZE =3D "0x00200000"
 RE_LAYOUT_WRAPPER_VERSION =3D "0.0.7"
-TFM_SIGN_PRIVATE_KEY =3D "${S}/bl2/ext/mcuboot/root-RSA-3072_1.pem"
+TFM_SIGN_PRIVATE_KEY =3D "${libdir}/tfm-scripts/root-RSA-3072_1.pem"
 RE_IMAGE_OFFSET =3D "0x1000"
=20
 # u-boot
diff --git a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb b/meta=
-arm-bsp/recipes-bsp/images/corstone1000-image.bb
index ad5ec958..76a7126b 100644
--- a/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
+++ b/meta-arm-bsp/recipes-bsp/images/corstone1000-image.bb
@@ -6,8 +6,27 @@ LICENSE =3D "MIT"
 COMPATIBLE_MACHINE =3D "corstone1000"
=20
 inherit image
-inherit wic_nopt
+inherit wic_nopt tfm_sign_image
=20
 PACKAGE_INSTALL =3D ""
=20
 IMAGE_FSTYPES +=3D "wic wic.nopt"
+
+do_sign_images() {
+    # Sign TF-A BL2
+    sign_host_image ${RECIPE_SYSROOT}/firmware/${TFA_BL2_BINARY} \
+        ${TFA_BL2_RE_IMAGE_LOAD_ADDRESS} ${TFA_BL2_RE_SIGN_BIN_SIZE}
+
+    # Update BL2 in the FIP image
+    cp ${RECIPE_SYSROOT}/firmware/${TFA_FIP_BINARY} .
+    fiptool update --tb-fw ${TFM_IMAGE_SIGN_DIR}/signed_${TFA_BL2_BINARY=
} \
+        ${TFM_IMAGE_SIGN_DIR}/${TFA_FIP_BINARY}
+
+    # Sign the FIP image
+    sign_host_image ${TFM_IMAGE_SIGN_DIR}/${TFA_FIP_BINARY} \
+        ${TFA_FIP_RE_IMAGE_LOAD_ADDRESS} ${TFA_FIP_RE_SIGN_BIN_SIZE}
+}
+do_sign_images[depends] =3D "\
+    trusted-firmware-a:do_populate_sysroot \
+    fiptool-native:do_populate_sysroot \
+    "
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware=
-a-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted=
-firmware-a-corstone1000.inc
index 341c8a27..3034680d 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-cors=
tone1000.inc
@@ -37,6 +37,3 @@ EXTRA_OEMAKE:append =3D " \
                         BL32=3D${RECIPE_SYSROOT}/lib/firmware/tee-pager_=
v2.bin \
                         LOG_LEVEL=3D50 \
                         "
-
-# trigger TF-M build so TF-A binaries get signed
-do_deploy[depends]+=3D "virtual/trusted-firmware-m:do_prepare_recipe_sys=
root"
diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index eb400e52..95c49d06 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -25,25 +25,8 @@ SRC_URI +=3D "git://github.com/OpenAMP/open-amp.git;pr=
otocol=3Dhttps;branch=3Dmain;nam
 SRCREV_openamp =3D "347397decaa43372fc4d00f965640ebde042966d"
 EXTRA_OECMAKE +=3D "-DLIBOPENAMP_SRC_PATH=3D${WORKDIR}/git/openamp -DLIB=
OPENAMP_BIN_PATH=3D${B}/libopenamp-build"
=20
-DEPENDS +=3D "trusted-firmware-a"
-
-# adding host images signing support
-require trusted-firmware-m-sign-host-images.inc
-
 do_install() {
   install -D -p -m 0644 ${B}/install/outputs/tfm_s_signed.bin ${D}/firmw=
are/tfm_s_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl2_signed.bin ${D}/firmwar=
e/bl2_signed.bin
   install -D -p -m 0644 ${B}/install/outputs/bl1.bin ${D}/firmware/bl1.b=
in
-
-  #
-  # Signing TF-A BL2 and the FIP image
-  #
-
-  sign_host_image ${TFA_BL2_BINARY} ${RECIPE_SYSROOT}/firmware ${TFA_BL2=
_RE_IMAGE_LOAD_ADDRESS} ${TFA_BL2_RE_SIGN_BIN_SIZE}
-
-  fiptool update \
-      --tb-fw ${D}/firmware/signed_${TFA_BL2_BINARY} \
-      ${RECIPE_SYSROOT}/firmware/${TFA_FIP_BINARY}
-
-  sign_host_image ${TFA_FIP_BINARY} ${RECIPE_SYSROOT}/firmware ${TFA_FIP=
_RE_IMAGE_LOAD_ADDRESS} ${TFA_FIP_RE_SIGN_BIN_SIZE}
 }
--=20
2.25.1


