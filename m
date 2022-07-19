Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59377C3F2D4
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45532.1658261638420344606
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5049B1576;
	Tue, 19 Jul 2022 13:13:58 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5AE313F766;
	Tue, 19 Jul 2022 13:13:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 3/9] arm/edk2-firmware: ignore buildpath warnings
Date: Tue, 19 Jul 2022 21:13:47 +0100
Message-Id: <20220719201353.1467716-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719201353.1467716-1-ross.burton@arm.com>
References: <20220719201353.1467716-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3576

Latest oe-core has enabled the buildpaths QA check, which warns if the
build paths are present inside binaries. This is because build paths in
deployed binaries is both information leakage and non-reproducible.

Until this is fixed in edk2-firmware, skip this check.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/uefi/edk2-firmware.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc b/meta-arm/recip=
es-bsp/uefi/edk2-firmware.inc
index 76f9d62c..e0dfa28b 100644
--- a/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
+++ b/meta-arm/recipes-bsp/uefi/edk2-firmware.inc
@@ -114,7 +114,9 @@ do_install() {
 FILES:${PN} =3D "/firmware"
 SYSROOT_DIRS +=3D "/firmware"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP:${PN} =3D "textrel"
+INSANE_SKIP:${PN} +=3D "textrel"
+# Build paths are currently embedded
+INSANE_SKIP:${PN} +=3D "buildpaths"
=20
 do_deploy() {
     # Copy the images to deploy directory
--=20
2.34.1


