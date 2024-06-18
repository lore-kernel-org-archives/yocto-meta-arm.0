Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57E8C2BA18
	for <webhook@archiver.kernel.org>; Tue, 18 Jun 2024 15:41:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.89634.1718725292886924438
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jun 2024 08:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 369461042
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 08:41:57 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 376213F6A8
	for <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 08:41:32 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm-bsp/firmware-image-juno: use UNPACKDIR
Date: Tue, 18 Jun 2024 15:41:28 +0000
Message-Id: <20240618154129.456464-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240618154129.456464-1-ross.burton@arm.com>
References: <20240618154129.456464-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jun 2024 15:41:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5826

Update the source/fetching for the new S/UNPACKDIR behaviour. This patch
is complicated by the recipe using UNPACK_DIR already, so I changed that
to avoid confusion.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/images/firmware-image-juno.bb | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb b/met=
a-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
index 45f2ec72..0b17b024 100644
--- a/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
+++ b/meta-arm-bsp/recipes-bsp/images/firmware-image-juno.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE =3D "juno"
=20
 LINARO_RELEASE =3D "19.06"
=20
-SRC_URI =3D "http://releases.linaro.org/members/arm/platforms/${LINARO_R=
ELEASE}/juno-latest-oe-uboot.zip;subdir=3D${UNPACK_DIR} \
+SRC_URI =3D "http://releases.linaro.org/members/arm/platforms/${LINARO_R=
ELEASE}/juno-latest-oe-uboot.zip;subdir=3D${S} \
     file://images-r0.txt \
     file://images-r1.txt \
     file://images-r2.txt \
@@ -23,7 +23,8 @@ SRC_URI =3D "http://releases.linaro.org/members/arm/pla=
tforms/${LINARO_RELEASE}/ju
 SRC_URI[md5sum] =3D "01b662b81fa409d55ff298238ad24003"
 SRC_URI[sha256sum] =3D "b8a3909bb3bc4350a8771b863193a3e33b358e2a727624a7=
7c9ecf13516cec82"
=20
-UNPACK_DIR =3D "juno-firmware-${LINARO_RELEASE}"
+FIRMWARE_DIR =3D "juno-firmware-${LINARO_RELEASE}"
+S =3D "${UNPACKDIR}/${FIRMWARE_DIR}"
=20
 inherit deploy nopackages
=20
@@ -33,23 +34,23 @@ do_compile[noexec] =3D "1"
 # The ${D} is used as a temporary directory and we don't generate any
 # packages for this recipe.
 do_install() {
-    cp -a ${WORKDIR}/${UNPACK_DIR} ${D}
+    cp -a ${S} ${D}/
     cp -f ${RECIPE_SYSROOT}/firmware/bl1-juno.bin \
-        ${D}/${UNPACK_DIR}/SOFTWARE/bl1.bin
+        ${D}/${FIRMWARE_DIR}/SOFTWARE/bl1.bin
=20
     cp -f ${RECIPE_SYSROOT}/firmware/fip-juno.bin \
-        ${D}/${UNPACK_DIR}/SOFTWARE/fip.bin
+        ${D}/${FIRMWARE_DIR}/SOFTWARE/fip.bin
=20
     cp -f ${RECIPE_SYSROOT}/firmware/scp_romfw_bypass.bin \
-        ${D}/${UNPACK_DIR}/SOFTWARE/scp_bl1.bin
+        ${D}/${FIRMWARE_DIR}/SOFTWARE/scp_bl1.bin
=20
     # u-boot environment file
-    cp -f ${WORKDIR}/uEnv.txt ${D}/${UNPACK_DIR}/SOFTWARE/
+    cp -f ${UNPACKDIR}/uEnv.txt ${D}/${FIRMWARE_DIR}/SOFTWARE/
=20
     # Juno images list file
-    cp -f ${WORKDIR}/images-r0.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262B/ima=
ges.txt
-    cp -f ${WORKDIR}/images-r1.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262C/ima=
ges.txt
-    cp -f ${WORKDIR}/images-r2.txt ${D}/${UNPACK_DIR}/SITE1/HBI0262D/ima=
ges.txt
+    cp -f ${UNPACKDIR}/images-r0.txt ${D}/${FIRMWARE_DIR}/SITE1/HBI0262B=
/images.txt
+    cp -f ${UNPACKDIR}/images-r1.txt ${D}/${FIRMWARE_DIR}/SITE1/HBI0262C=
/images.txt
+    cp -f ${UNPACKDIR}/images-r2.txt ${D}/${FIRMWARE_DIR}/SITE1/HBI0262D=
/images.txt
 }
=20
 do_deploy() {
@@ -59,18 +60,18 @@ do_deploy() {
     # task.
     for f in ${KERNEL_DEVICETREE}; do
         install -m 755 -c ${DEPLOY_DIR_IMAGE}/$(basename $f) \
-            ${D}/${UNPACK_DIR}/SOFTWARE/.
+            ${D}/${FIRMWARE_DIR}/SOFTWARE/
     done
=20
     if [ "${INITRAMFS_IMAGE_BUNDLE}" -eq 1 ]; then
         cp -L -f ${DEPLOY_DIR_IMAGE}/Image.gz-initramfs-juno.bin \
-            ${D}/${UNPACK_DIR}/SOFTWARE/Image
+            ${D}/${FIRMWARE_DIR}/SOFTWARE/Image
     else
-        cp -L -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${D}/${UNPACK_D=
IR}/SOFTWARE/
+        cp -L -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE} ${D}/${FIRMWARE=
_DIR}/SOFTWARE/
     fi
=20
     # Compress the files
-    tar -C ${D}/${UNPACK_DIR} -zcvf ${WORKDIR}/${PN}.tar.gz ./
+    tar -C ${D}/${FIRMWARE_DIR} -zcvf ${WORKDIR}/${PN}.tar.gz ./
=20
     # Deploy the compressed archive to the deploy folder
     install -D -p -m0644 ${WORKDIR}/${PN}.tar.gz ${DEPLOYDIR}/${PN}.tar.=
gz
--=20
2.34.1


