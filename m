Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8ABC36008
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 13:20:39 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.22264.1742995236542903409
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Mar 2025 06:20:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BF1C01424
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 06:20:41 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6F7D3F58B
	for <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 06:20:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH][styhead] arm-system-ready/arm-systemready-ir-acs: add version to download filename
Date: Wed, 26 Mar 2025 13:20:32 +0000
Message-ID: <20250326132032.423938-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 26 Mar 2025 13:20:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6413

The download filename wasn't versioned so multiple versions would write
to the same file on disk and conflict, causing repeated downloads and
fetch failures.

Add the PV to the filename on disk to resolve this.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../arm-systemready-acs/arm-systemready-ir-acs.bb             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index 83257b30..eef1c045 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -49,9 +49,9 @@ PV =3D "2.0.0"
 PV_DATE =3D "23.03"
 FULL_PV =3D "v${PV_DATE}_${PV}"
 ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "main"
-IMAGE_FILENAME =3D "ir-acs-live-image-generic-arm64.wic"
+IMAGE_FILENAME =3D "ir-acs-live-image-generic-arm64-${PV}.wic"
 SRC_URI =3D " \
-    https://github.com/ARM-software/arm-systemready/raw/${ARM_SYSTEMREAD=
Y_IR_ACS_BRANCH}/IR/prebuilt_images/${FULL_PV}/${IMAGE_FILENAME}.xz;name=3D=
acs-img \
+    https://github.com/ARM-software/arm-systemready/raw/${ARM_SYSTEMREAD=
Y_IR_ACS_BRANCH}/IR/prebuilt_images/${FULL_PV}/ir-acs-live-image-generic-=
arm64.wic.xz;name=3Dacs-img;downloadfilename=3D${IMAGE_FILENAME}.xz \
     git://git.gitlab.arm.com/systemready/systemready-ir-template.git;pro=
tocol=3Dhttps;nobranch=3D1;destsuffix=3Dsystemready-ir-template;name=3Dsr=
-ir-template \
 "
 SRC_URI[acs-img.sha256sum] =3D "ea52f84dab44bde97de3e2d2224d883acaae3572=
4dd8e2bdfb125de49040f9b3"
--=20
2.43.0


