Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE9DC83F09
	for <webhook@archiver.kernel.org>; Tue,  8 Jul 2025 13:55:14 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.19570.1751982910945177395
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 08 Jul 2025 06:55:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E590153B
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Jul 2025 06:54:58 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 09B983F694
	for <meta-arm@lists.yoctoproject.org>; Tue,  8 Jul 2025 06:55:09 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready/ir-acs: Update URL
Date: Tue,  8 Jul 2025 14:55:04 +0100
Message-ID: <20250708135504.78280-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 08 Jul 2025 13:55:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6603

From: Jon Mason <jon.mason@arm.com>

The github URL where the image was located has gone away on the master
branch.  Update the URL to point to the legacy branch, which should stay
around (according to the documentation).

Fixes: aebe535aa8c3 ("arm-systemready: Introduce the Arm SystemReady laye=
r")
Signed-off-by: Jon Mason <jon.mason@arm.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-test/arm-systemready-acs/arm-systemready-ir-acs.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index eef1c0456c..3558d4a08e 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -48,7 +48,7 @@ TEST_SUITES =3D "arm_systemready_ir_acs"
 PV =3D "2.0.0"
 PV_DATE =3D "23.03"
 FULL_PV =3D "v${PV_DATE}_${PV}"
-ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "main"
+ARM_SYSTEMREADY_IR_ACS_BRANCH ?=3D "legacy_systemready"
 IMAGE_FILENAME =3D "ir-acs-live-image-generic-arm64-${PV}.wic"
 SRC_URI =3D " \
     https://github.com/ARM-software/arm-systemready/raw/${ARM_SYSTEMREAD=
Y_IR_ACS_BRANCH}/IR/prebuilt_images/${FULL_PV}/ir-acs-live-image-generic-=
arm64.wic.xz;name=3Dacs-img;downloadfilename=3D${IMAGE_FILENAME}.xz \
--=20
2.43.0


