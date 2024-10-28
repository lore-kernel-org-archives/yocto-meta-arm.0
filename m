Return-Path: <Ziad.Elhanafy@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40023D339A8
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 17:18:52 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.57691.1730135928283751389
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 10:18:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ziad.elhanafy@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 857F1497
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Oct 2024 10:19:17 -0700 (PDT)
Received: from e133758.cambridge.arm.com (e133758.arm.com [10.1.36.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 31BDD3F66E
	for <meta-arm@lists.yoctoproject.org>; Mon, 28 Oct 2024 10:18:47 -0700 (PDT)
From: Ziad Elhanafy <ziad.elhanafy@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready/linux-distros: Follow WORKDIR -> UNPACKDIR transition
Date: Mon, 28 Oct 2024 17:18:35 +0000
Message-Id: <20241028171835.2387945-1-ziad.elhanafy@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 28 Oct 2024 17:18:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6235

This adapts to the oe-core rework to enforce a separate directory
for unpacking local sources (UNPACKDIR) instead of polluting WORKDIR
directly.

Follows the guidelines from:
https://lists.openembedded.org/g/openembedded-architecture/message/2007

Signed-off-by: Ziad Elhanafy <ziad.elhanafy@arm.com>
---
 .../arm-systemready-linux-distros-unattended.inc              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-linux-dist=
ros/arm-systemready-linux-distros-unattended.inc b/meta-arm-systemready/r=
ecipes-test/arm-systemready-linux-distros/arm-systemready-linux-distros-u=
nattended.inc
index f8c9c6c5..75951b0e 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-unattended.inc
+++ b/meta-arm-systemready/recipes-test/arm-systemready-linux-distros/arm=
-systemready-linux-distros-unattended.inc
@@ -19,7 +19,7 @@ python () {
=20
 unpackiso() {
     # Unpack the ISO image
-    bsdtar -xf ${WORKDIR}/${ISO_IMAGE_NAME}.iso -C ${EXTRACTED_ISO_TEMP_=
DIR}
+    bsdtar -xf ${UNPACKDIR}/${ISO_IMAGE_NAME}.iso -C ${EXTRACTED_ISO_TEM=
P_DIR}
     chmod -R u+rw ${EXTRACTED_ISO_TEMP_DIR}
 }
=20
@@ -34,7 +34,7 @@ repackiso() {
             -boot-load-size 4 -boot-info-table -J -R -V ${ISO_LABEL} -el=
torito-alt-boot \
             -eltorito-boot ${EFI_IMAGE} -no-emul-boot ${EXTRACTED_ISO_TE=
MP_DIR}
=20
-    mv -f ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso ${WORKDIR}
+    mv -f ${NEW_ISO_TEMP_DIR}/${ISO_IMAGE_NAME}.iso ${UNPACKDIR}
 }
=20
 # Write the test data in IMAGE_POSTPROCESS_COMMAND
--=20
2.34.1


