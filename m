Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D25FCCFA05
	for <webhook@archiver.kernel.org>; Thu,  6 Nov 2025 14:24:18 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16817.1762439053296376519
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Nov 2025 06:24:13 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 95EEE1515
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:04 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 048FC3F66E
	for <meta-arm@lists.yoctoproject.org>; Thu,  6 Nov 2025 06:24:11 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready/arm-systemready-linux-distros-fedora: update ISO URL
Date: Thu,  6 Nov 2025 14:24:07 +0000
Message-ID: <20251106142407.546981-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 06 Nov 2025 14:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6751

The Fedora 39 artifacts have been moved to an /archive/ directory, so
update the SRC_URI to match.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../arm-systemready-linux-distros-fedora.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-fedora.bb b/meta-arm-systemready/recipe=
s-test/arm-systemready-linux-distros/arm-systemready-linux-distros-fedora=
.bb
index 2f7e912d83..df2043b59f 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-fedora.bb
@@ -107,7 +107,7 @@ EFI_IMAGE =3D "${@oe.utils.vartrue("DISTRO_UNATTENDED=
_INST_TESTS", "images/efiboot
=20
 PV =3D "39.1.5"
 SRC_URI =3D "\
-    https://download.fedoraproject.org/pub/fedora/linux/releases/39/Serv=
er/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;downloadfi=
lename=3D${ISO_IMAGE_NAME}.iso;name=3Dfedora_iso_image \
+    https://download.fedoraproject.org/pub/archive/fedora/linux/releases=
/39/Server/aarch64/iso/Fedora-Server-dvd-aarch64-39-1.5.iso;unpack=3D0;do=
wnloadfilename=3D${ISO_IMAGE_NAME}.iso;name=3Dfedora_iso_image \
     file://unattended-boot-conf/Fedora/ks.cfg\
     "
 SRC_URI[fedora_iso_image.sha256sum] =3D "d19dc2a39758155fa53e6fd555d0d17=
3ccc8175b55dea48002d499f39cb30ce0"
--=20
2.43.0


