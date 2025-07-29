Return-Path: <hamideh.izadyar@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA921C87FC9
	for <webhook@archiver.kernel.org>; Tue, 29 Jul 2025 14:28:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.8702.1753799274498773944
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Jul 2025 07:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hamideh.izadyar@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 081741063;
	Tue, 29 Jul 2025 07:27:46 -0700 (PDT)
Received: from e140394.cambridge.arm.com (e140394.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73ADC3F673;
	Tue, 29 Jul 2025 07:27:53 -0700 (PDT)
From: Hamideh Izadyar <hamideh.izadyar@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: luca.fancellu@arm.com,
	Hamideh Izadyar <hamideh.izadyar@arm.com>
Subject: [walnascar] arm/trusted-firmware-m: apply TF-M downstream patches
Date: Tue, 29 Jul 2025 15:27:20 +0100
Message-ID: <20250729142720.3873148-1-hamideh.izadyar@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Jul 2025 14:28:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6626

Apply TF-M downstream patches in the main TF-M recipe, rather than doing
it in corstone1000 recipe.

Signed-off-by: Hamideh Izadyar <hamideh.izadyar@arm.com>
---
 .../trusted-firmware-m-corstone1000.inc               | 10 ----------
 .../trusted-firmware-m-2.1.1-src.inc                  | 11 +++++++++++
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index c79ac2e3..eced9634 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -50,16 +50,6 @@ SRC_URI:append:corstone1000-mps3 =3D " \
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
index 6b483995..96e7e5b1 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
@@ -55,3 +55,14 @@ SRCREV_tfm-psa-adac =3D "5f5490cebe66ae997f316f83c3fbf=
1f97deef625"
 SRCREV_FORMAT =3D "tfm"
=20
 S =3D "${WORKDIR}/git/tfm"
+
+# Apply patches
+inherit apply_local_src_patches
+LOCAL_SRC_PATCHES_INPUT_DIR =3D "N/A"
+
+do_apply_local_src_patches() {
+    apply_local_src_patches ${S}/lib/ext/qcbor ${WORKDIR}/git/qcbor
+    apply_local_src_patches ${S}/lib/ext/mbedcrypto ${WORKDIR}/git/mbedt=
ls
+    apply_local_src_patches ${S}/lib/ext/mcuboot ${WORKDIR}/git/mcuboot
+    apply_local_src_patches ${S}/lib/ext/tf-m-tests ${WORKDIR}/git/tf-m-=
tests
+}
--=20
2.43.0


