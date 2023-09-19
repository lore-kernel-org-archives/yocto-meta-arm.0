Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAFDBCD5BAE
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 12:44:42 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.7500.1695127480485379490
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 Sep 2023 05:44:40 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 70288C15
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:45:17 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EF46A3F67D
	for <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 05:44:39 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] arm/opencsd: update to v1.4.1
Date: Tue, 19 Sep 2023 07:44:34 -0500
Message-Id: <20230919124435.3776850-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230919124435.3776850-1-jon.mason@arm.com>
References: <20230919124435.3776850-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 19 Sep 2023 12:44:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5059

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.4.0.bb =3D> opencsd_1.4.1.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.4.0.bb =3D> opencsd_=
1.4.1.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.4.0.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.4.1.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.4.0.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.4.1.bb
index 59c4f9ca..01b0f7be 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.4.0.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.4.1.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "78ce8ef47c55a489b0ca575b981cd4856d03f44b"
+SRCREV =3D "553d74524332be146675980ef611153d1a1ab6f8"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.30.2


