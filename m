Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB9CCEACFB
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 18:39:11 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.89492.1727807946668613964
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 01 Oct 2024 11:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9D4FA367
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:35 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B596C3F58B
	for <meta-arm@lists.yoctoproject.org>; Tue,  1 Oct 2024 11:39:05 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/5] arm/opencsd: update to 1.5.4
Date: Tue,  1 Oct 2024 14:39:00 -0400
Message-Id: <20241001183903.13457-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241001183903.13457-1-jon.mason@arm.com>
References: <20241001183903.13457-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 01 Oct 2024 18:39:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6157

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.5.3.bb =3D> opencsd_1.5.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.5.3.bb =3D> opencsd_=
1.5.4.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.3.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.5.4.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.5.3.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.5.4.bb
index fdd0d636e9e7..b07f5c7fee9c 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.5.3.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.5.4.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "adb97189b906d524d1c3008e67e4da34aaa0397d"
+SRCREV =3D "7323ae88d16be4f9972b0ad60198963c64d70070"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.39.5 (Apple Git-154)


