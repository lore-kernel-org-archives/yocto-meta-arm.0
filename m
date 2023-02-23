Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822D6C678DB
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:37:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.11955.1677163023270148170
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 23 Feb 2023 06:37:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC8E31063
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:45 -0800 (PST)
Received: from jdm-VirtualBox.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 947CB3F881
	for <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 06:37:02 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 3/5] arm/opencsd: update to v1.4.0
Date: Thu, 23 Feb 2023 09:36:55 -0500
Message-Id: <20230223143657.424913-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223143657.424913-1-jon.mason@arm.com>
References: <20230223143657.424913-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 23 Feb 2023 14:37:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4450

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.3.1.bb =3D> opencsd_1.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.3.1.bb =3D> opencsd_=
1.4.0.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.3.1.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.4.0.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.3.1.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.4.0.bb
index 1c1abaa7..59c4f9ca 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.3.1.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.4.0.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "8dab50c35c8d181fc3ed6ad46e156398447d753f"
+SRCREV =3D "78ce8ef47c55a489b0ca575b981cd4856d03f44b"
=20
 S =3D "${WORKDIR}/git"
=20
--=20
2.25.1


