Return-Path: <emekcan.aras@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760F9C25B10
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 16:30:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20462.1714494609841990803
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 09:30:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: emekcan.aras@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67662F4;
	Tue, 30 Apr 2024 09:30:35 -0700 (PDT)
Received: from e126835.cambridge.arm.com (e126835.cambridge.arm.com [10.1.29.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 131593F73F;
	Tue, 30 Apr 2024 09:30:08 -0700 (PDT)
From: emekcan.aras@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH 2/6] arm: Handle nodistro in firmware deployment
Date: Tue, 30 Apr 2024 17:29:53 +0100
Message-Id: <20240430162957.94499-3-emekcan.aras@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240430162957.94499-1-emekcan.aras@arm.com>
References: <20240430162957.94499-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 30 Apr 2024 16:30:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5667

From: Drew Reed <Drew.Reed@arm.com>

The nodistro settings in poky set the TMPDIR variable to include the
TCLIBC value so we need to spot that and swap the TCLIBC for the musl
one used in the firmware multiconfig.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 meta-arm/recipes-bsp/images/firmware-deploy-image.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/images/firmware-deploy-image.bb b/meta-=
arm/recipes-bsp/images/firmware-deploy-image.bb
index 76c82738..2f347f0b 100644
--- a/meta-arm/recipes-bsp/images/firmware-deploy-image.bb
+++ b/meta-arm/recipes-bsp/images/firmware-deploy-image.bb
@@ -15,7 +15,8 @@ do_install[noexec] =3D "1"
 FIRMWARE_BINARIES ?=3D ""
=20
 do_deploy() {
-    firmware_loc=3D"${TMPDIR}_${MACHINE}/deploy/images/${MACHINE}"
+    firmware_loc=3D$(echo "${TMPDIR}" | sed "s/${TCLIBC}/musl/")
+    firmware_loc=3D"${firmware_loc}_${MACHINE}/deploy/images/${MACHINE}"
     for firmware in ${FIRMWARE_BINARIES}; do
         echo "cp -av ${firmware_loc}/${firmware} ${DEPLOYDIR}/"
         cp -av "${firmware_loc}/${firmware}" ${DEPLOYDIR}/
--=20
2.25.1


