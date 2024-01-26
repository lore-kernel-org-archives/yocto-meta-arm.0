Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A76DC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 15:12:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.573.1706281958109093856
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 07:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 075B21FB
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 07:13:22 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6E6BC3F73F
	for <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 07:12:37 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] arm/opencsd: update to v1.5.1
Date: Fri, 26 Jan 2024 10:12:34 -0500
Message-Id: <20240126151236.59981-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 26 Jan 2024 15:12:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5361

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.4.2.bb =3D> opencsd_1.5.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.4.2.bb =3D> opencsd_=
1.5.1.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.4.2.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.5.1.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.4.2.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.5.1.bb
index 4bfed2780860..5f838557db9f 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.4.2.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "37ace5c3e1a9f87d0541b3d3cbbbf39267258dbc"
+SRCREV =3D "c16418833b5d7cbcbcb4e2a2d917ad0147efb2be"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.3 (Apple Git-145)


