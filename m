Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31D6C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 13:52:25 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.30991.1750081936248208988
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 16 Jun 2025 06:52:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F4217150C
	for <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 06:51:53 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 544833F58B
	for <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 06:52:15 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-systemready/ir-acs: Update URL
Date: Mon, 16 Jun 2025 09:52:14 -0400
Message-Id: <20250616135214.29942-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 13:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6555

The github URL where the image was located has gone away on the master
branch.  Update the URL to point to the legacy branch, which should stay
around (according to the documentation).

Signed-off-by: Jon Mason <jon.mason@arm.com>
Fixes: aebe535aa8c3 ("arm-systemready: Introduce the Arm SystemReady laye=
r")
---
 .../recipes-test/arm-systemready-acs/arm-systemready-ir-acs.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index eef1c0456c05..3558d4a08e86 100644
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
2.39.5 (Apple Git-154)


