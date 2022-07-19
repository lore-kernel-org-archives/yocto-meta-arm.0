Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B57DC433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:14:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.45397.1658261640891354111
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:14:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2321D1576;
	Tue, 19 Jul 2022 13:14:01 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2EB293F766;
	Tue, 19 Jul 2022 13:14:00 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 7/9] arm/trusted-firmware-a: ignore buildpath warnings
Date: Tue, 19 Jul 2022 21:13:51 +0100
Message-Id: <20220719201353.1467716-7-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719201353.1467716-1-ross.burton@arm.com>
References: <20220719201353.1467716-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:14:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3580

Latest oe-core has enabled the buildpaths QA check, which warns if the
build paths are present inside binaries. This is because build paths in
deployed binaries is both information leakage and non-reproducible.

Until this is fixed, skip this check.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
index dfb56753..c5b695e4 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-a/trusted-firmware-a.inc
@@ -231,7 +231,10 @@ SYSROOT_DIRS +=3D "/firmware"
=20
 FILES:${PN}-dbg =3D "/firmware/*.elf"
 # Skip QA check for relocations in .text of elf binaries
-INSANE_SKIP:${PN}-dbg =3D "textrel"
+INSANE_SKIP:${PN}-dbg +=3D "textrel"
+# Build paths are currently embedded
+INSANE_SKIP:${PN} +=3D "buildpaths"
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
=20
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
--=20
2.34.1


