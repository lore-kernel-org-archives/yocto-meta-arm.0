Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00D5C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 18:30:57 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.11742.1641925856506555969
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 11 Jan 2022 10:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 28541D6E
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:56 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C250A3F766
	for <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 10:30:55 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm/opencsd: upgrade to 1.2.0
Date: Tue, 11 Jan 2022 18:30:53 +0000
Message-Id: <20220111183053.3220111-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 11 Jan 2022 18:30:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2818

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../opencsd/{opencsd_1.1.0.bb =3D> opencsd_1.2.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.1.0.bb =3D> opencsd_=
1.2.0.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.2.0.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb
index 804efb50..0ff4b172 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.1.0.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.2.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "54c3f67811fbcea853b7d223383d4a755819bb7e"
+SRCREV =3D "dac554d62d514b202174506995afc0e109ef3fea"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1


