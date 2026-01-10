Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B17D277F7
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 16:52:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11913.1768063964343152687
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 10 Jan 2026 08:52:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 059D71691
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:37 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9DD3D3F6A8
	for <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 08:52:43 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/opencsd: update to 1.7.1
Date: Sat, 10 Jan 2026 11:52:39 -0500
Message-ID: <20260110165242.38662-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260110165242.38662-1-jon.mason@arm.com>
References: <20260110165242.38662-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 10 Jan 2026 16:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6832

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.6.1.bb =3D> opencsd_1.7.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.6.1.bb =3D> opencsd_=
1.7.1.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.6.1.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.7.1.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.6.1.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.7.1.bb
index fb132d73dd8c..f8429dbbadc9 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.6.1.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.7.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "78141e2f0ef8fb67284cc1a159cb62737666c965"
+SRCREV =3D "83e4575459305c054ce43f7d5eb5e468e304645c"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
--=20
2.50.1 (Apple Git-155)


