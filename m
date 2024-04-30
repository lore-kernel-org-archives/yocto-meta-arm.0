Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68953C10F16
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20461.1714494609190364199
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39E66339;
	Tue, 30 Apr 2024 09:30:35 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45D023F73F;
	Tue, 30 Apr 2024 09:30:08 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 1/6] arm-systemready: Fix regex in arm-systemready-ir-acs recipe
Date: Tue, 30 Apr 2024 17:29:52 +0100
Message-Id: <20240430162957.94499-2-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5666

From: Drew Reed <Drew.Reed@arm.com>

The regex used to validate compatible machines is incorrect as it's only
checking the machine name starts with "fvp" not "fvp-" as intended.
It's also been modified to allow FVPs called xxx-fvp to be compatible
with Corstone-1000.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 .../recipes-test/arm-systemready-acs/arm-systemready-ir-acs.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-sy=
stemready-ir-acs.bb b/meta-arm-systemready/recipes-test/arm-systemready-a=
cs/arm-systemready-ir-acs.bb
index f9226c31..41ac2f77 100644
--- a/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
+++ b/meta-arm-systemready/recipes-test/arm-systemready-acs/arm-systemrea=
dy-ir-acs.bb
@@ -41,7 +41,7 @@ file://${COMMON_LICENSE_DIR}/Zlib;md5=3D87f239f408daca8=
a157858e192597633 \
 "
 IMAGE_CLASSES:remove =3D "license_image"
=20
-COMPATIBLE_MACHINE =3D "fvp-*"
+COMPATIBLE_MACHINE =3D "(fvp-.+|.+-fvp)"
=20
 TEST_SUITES =3D "arm_systemready_ir_acs"
=20
--=20
2.25.1


