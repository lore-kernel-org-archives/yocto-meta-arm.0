Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58ECFCCA486
	for <webhook@archiver.kernel.org>; Tue, 19 Jul 2022 20:14:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.45533.1658261638866557614
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Jul 2022 13:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A40115BF;
	Tue, 19 Jul 2022 13:13:59 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14B353F766;
	Tue, 19 Jul 2022 13:13:57 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/9] arm/hafnium: ignore buildpath warnings
Date: Tue, 19 Jul 2022 21:13:48 +0100
Message-Id: <20220719201353.1467716-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220719201353.1467716-1-ross.burton@arm.com>
References: <20220719201353.1467716-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Jul 2022 20:14:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3577

Latest oe-core has enabled the buildpaths QA check, which warns if the
build paths are present inside binaries. This is because build paths in
deployed binaries is both information leakage and non-reproducible.

Until this is fixed, skip this check.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb b/meta-arm/recip=
es-bsp/hafnium/hafnium_2.6.bb
index a9f41b90..ae89e8d9 100644
--- a/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
+++ b/meta-arm/recipes-bsp/hafnium/hafnium_2.6.bb
@@ -59,6 +59,8 @@ FILES:${PN}-dbg =3D "/firmware/*.elf"
 SYSROOT_DIRS +=3D "/firmware"
 INSANE_SKIP:${PN} =3D "ldflags"
 INSANE_SKIP:${PN}-dbg =3D "ldflags"
+# Build paths are currently embedded
+INSANE_SKIP:${PN}-dbg +=3D "buildpaths"
=20
 do_deploy() {
     cp -rf ${D}/firmware/* ${DEPLOYDIR}/
--=20
2.34.1


