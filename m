Return-Path: <hamideh.izadyar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA8FC87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 10:53:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.16933.1753440810464702897
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 03:53:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hamideh.izadyar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 433301756;
	Fri, 25 Jul 2025 03:53:23 -0700 (PDT)
Received: from e140394.cambridge.arm.com (e140394.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55ABF3F66E;
	Fri, 25 Jul 2025 03:53:29 -0700 (PDT)
From: Hamideh Izadyar <hamideh.izadyar@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: luca.fancellu@arm.com,
	Hamideh Izadyar <hamideh.izadyar@arm.com>
Subject: [PATCH] arm/trusted-firmware-m: apply TF-M downstream patches
Date: Fri, 25 Jul 2025 11:53:05 +0100
Message-ID: <20250725105305.9589-1-hamideh.izadyar@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 25 Jul 2025 10:53:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6624

Apply TF-M downstream patches in the main TF-M recipe, rather than doing
it in corstone1000 recipe.

Signed-off-by: Hamideh Izadyar <hamideh.izadyar@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc              | 10 ----------
 .../trusted-firmware-m-2.1.1-src.inc                 | 11 +++++++++++
 .../trusted-firmware-m-2.2.0-src.inc                 | 12 ++++++++++++
 3 files changed, 23 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index e3a07b72..b47dbe9b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -51,16 +51,6 @@ SRC_URI:append:corstone1000-mps3 =3D " \
     file://0003-Fix-psa_key_handle_t-initialization.patch;patchdir=3D../=
tfm-psa-adac \
     "
=20
-# TF-M ships patches for external dependencies that needs to be applied
-apply_tfm_patches() {
-    find ${S}/lib/ext/qcbor -type f -name '*.patch' -print0 | sort -z | =
xargs -r -t -0 -n 1 patch -p1 -d ${S}/../qcbor/ -i
-    find ${S}/lib/ext/mbedcrypto -type f -name '*.patch' -print0 | sort =
-z | xargs -r -t -0 -n 1 patch -p1 -d ${S}/../mbedtls/ -i
-    find ${S}/lib/ext/mcuboot -type f -name '*.patch' -print0 | sort -z =
| xargs -r -t -0 -n 1 patch -p1 -d ${S}/../mcuboot/ -i
-    find ${S}/lib/ext/tf-m-tests -type f -name '*.patch' -print0 | sort =
-z | xargs -r -t -0 -n 1 patch -p1 -d ${S}/../tf-m-tests/ -i
-}
-
-do_patch[postfuncs] +=3D "apply_tfm_patches"
-
 do_install() {
   install -D -p -m 0644 ${B}/bin/tfm_s_signed.bin ${D}/firmware/tfm_s_si=
gned.bin
   install -D -p -m 0644 ${B}/bin/bl2_signed.bin ${D}/firmware/bl2_signed=
.bin
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.1-src.inc
index 1e47589d..5eaf48c5 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
@@ -55,3 +55,14 @@ SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf=
1f97deef625"
 SRCREV_FORMAT =3D "tfm"
=20
 S =3D "${UNPACKDIR}/tfm"
+
+# Apply patches
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
+}
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.2.0-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.2.0-src.inc
index c2015253..4162cc9c 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.0-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.2.0-sr=
c.inc
@@ -64,3 +64,15 @@ SRCREV_t-cose =3D "3076010eeb6383f0827bd992c75b68af931=
1cf1d"
 SRCREV_FORMAT =3D "tfm"
=20
 S =3D "${UNPACKDIR}/tfm"
+
+# Apply patches
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/lib/ext/qcbor ${UNPACKDIR}/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${UNPACKDIR}/mbedtls
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${UNPACKDIR}/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${UNPACKDIR}/tf-m-te=
sts
+    apply_local_src_patches ${S}/lib/ext/t_cose ${UNPACKDIR}/t_cose
+}
--=20
2.43.0


