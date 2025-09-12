Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF070CAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 21:27:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.234.1757712446689797720
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 12 Sep 2025 14:27:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D04A828C7
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:27:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F0AA63F694
	for <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 14:27:25 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/opencsd: update to 1.6.1
Date: Fri, 12 Sep 2025 17:27:24 -0400
Message-Id: <20250912212725.95249-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250912212725.95249-1-jon.mason@arm.com>
References: <20250912212725.95249-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 12 Sep 2025 21:27:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6708

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.5.6.bb =3D> opencsd_1.6.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.5.6.bb =3D> opencsd_=
1.6.1.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.6.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.6.1.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.5.6.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.6.1.bb
index 7b0cfded9037..fb132d73dd8c 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.6.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.6.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "1900c6fd110275305b956aa47bd9f0c76b13a134"
+SRCREV =3D "78141e2f0ef8fb67284cc1a159cb62737666c965"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
--=20
2.39.5 (Apple Git-154)


