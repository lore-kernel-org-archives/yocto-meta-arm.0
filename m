Return-Path: <musa.antike@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF01CC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 13:56:23 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.21500.1736949381338349338
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 05:56:21 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: musa.antike@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1EE0912FC
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:56:49 -0800 (PST)
Received: from e132696.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EC6AA3F63F
	for <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:56:19 -0800 (PST)
From: Musa Antike <musa.antike@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/5] arm-systemready/linux-distros: Move Fedora unattended conf to SRC_URI
Date: Wed, 15 Jan 2025 13:56:02 +0000
Message-Id: <20250115135606.3820325-1-musa.antike@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 15 Jan 2025 13:56:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6326

- Replace THISDIR with UNPACKDIR by adding unattended conf to SRC_URI

Signed-off-by: Musa Antike <musa.antike@arm.com>
---
 .../arm-systemready-linux-distros-fedora.bb              | 9 ++++++---
 .../{ =3D> files}/unattended-boot-conf/Fedora/ks.cfg       | 0
 2 files changed, 6 insertions(+), 3 deletions(-)
 rename meta-arm-systemready/recipes-test/arm-systemready-linux-distros/{=
 =3D> files}/unattended-boot-conf/Fedora/ks.cfg (100%)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-fedora.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-fedora=
.bb
index de4ea36d..2f7e912d 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
@@ -106,11 +106,14 @@ BOOT_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTEN=
DED_INST_TESTS", "EFI/BOOT/BOOT
 EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED_INST_TESTS", "imag=
es/efiboot.img", "", d)}"
=20
 PV =3D "39.1.5"
-SRC_URI =3D "https://download.fedoraproject.org/pub/fedora/linux/release=
s/39/Server/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;d=
ownloadfilename=3D${ISO_IMAGE_NAME}.iso"
-SRC_URI[sha256sum] =3D "d19dc2a39758155fa53e6fd555d0d173ccc8175b55dea480=
02d499f39cb30ce0"
+SRC_URI =3D "\
+    https://download.fedoraproject.org/pub/fedora/linux/releases/39/Serv=
er/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;downloadfi=
lename=3D${ISO_IMAGE_NAME}.iso;name=3Dfedora_iso_image \
+    file://unattended-boot-conf/Fedora/ks.cfg\
+    "
+SRC_URI[fedora_iso_image.sha256sum] =3D "d19dc2a39758155fa53e6fd555d0d17=
3ccc8175b55dea48002d499f39cb30ce0"
=20
 modifyiso() {
-    UNATTENDED_CONF_DIR=3D"${THISDIR}/unattended-boot-conf/Fedora"
+    UNATTENDED_CONF_DIR=3D"${UNPACKDIR}/unattended-boot-conf/Fedora"
    =20
     cp "${UNATTENDED_CONF_DIR}/ks.cfg" ${EXTRACTED_ISO_TEMP_DIR}
     sed -i 's/set default=3D"1"/set default=3D"0"/g' "${EXTRACTED_ISO_TE=
MP_DIR}/EFI/BOOT/grub.cfg"
diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/unattended-boot-conf/Fedora/ks.cfg b/meta-arm-systemready/recipes-tes=
t/arm-systemready-linux-distros/files/unattended-boot-conf/Fedora/ks.cfg
similarity index 100%
rename from meta-arm-systemready/recipes-test/arm-systemready-linux-distr=
os/unattended-boot-conf/Fedora/ks.cfg
rename to meta-arm-systemready/recipes-test/arm-systemready-linux-distros=
/files/unattended-boot-conf/Fedora/ks.cfg
--=20
2.34.1


