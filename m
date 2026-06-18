Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBDB0CD98F7
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 12:59:28 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18999.1781787561741591774
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 18 Jun 2026 05:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=gPSABzGT;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 893D6293B
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:17 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 11A423F915
	for <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 05:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781787562; bh=Rus51KJ0MYnVzGV2BC9VVunfmRVkFrUd9H971ZqJl58=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gPSABzGT8RrMoM9BKRQOwVQgRy7oOmvFOdYCTz77jawpDDnr4LupIXBfSI+cWZf4L
	 sFWmKhSGvf0vDIxaE++cTJSubFwcIMJ5W0Ve9r3M8AsmNNQ56JYHLJgli359B3tgNN
	 NWr4lC6Bs8/REvkj3zRrmhd5zdBa1uB590AtiAWo=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 6/7] arm/opencsd: upgrade to v1.8.2
Date: Thu, 18 Jun 2026 08:59:17 -0400
Message-ID: <20260618125918.62619-6-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260618125918.62619-1-jon.mason@arm.com>
References: <20260618125918.62619-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 18 Jun 2026 12:59:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7090

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.7.1.bb =3D> opencsd_1.8.2.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.7.1.bb =3D> opencsd_=
1.8.2.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.7.1.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.8.2.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.7.1.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.8.2.bb
index f8429dbbadc9..0a0c7cd62ebf 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.7.1.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.8.2.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "83e4575459305c054ce43f7d5eb5e468e304645c"
+SRCREV =3D "9b462f77a4e1c6ab363fafe8f1f5d7374f5782b5"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
--=20
2.50.1 (Apple Git-155)


