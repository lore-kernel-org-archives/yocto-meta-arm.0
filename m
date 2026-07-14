Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1578FC43458
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 13:24:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9401.1784035488481837695
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 14 Jul 2026 06:24:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cST6etjN;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A342E2F
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:24:43 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BBB593F93E
	for <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 06:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784035487; bh=blPeXs4Ztj/C/dM3smC/wwVLFwN8+i7lLNylHY6lJ+o=;
	h=From:To:Subject:Date:From;
	b=cST6etjNtMhoJHJci878bLJnNfGFqK80zQ1M25bI9nGpAndOQKxuZ7MSrSsetV04i
	 KjNE1qeu1hz43EV/VBZ7PLzyxvSoArMG8Y/uPaQ6oPX0E8mjPdqm1TMXls5ytiZtRd
	 Ih3EVcf5J/xaffJ4eI2HZfU3HjmxlnitSZHDbzWU=
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/opencsd: update to 1.8.3
Date: Tue, 14 Jul 2026 09:24:45 -0400
Message-ID: <20260714132446.60585-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 14 Jul 2026 13:24:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/7113

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../opencsd/{opencsd_1.8.2.bb =3D> opencsd_1.8.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-devtools/opencsd/{opencsd_1.8.2.bb =3D> opencsd_=
1.8.3.bb} (95%)

diff --git a/meta-arm/recipes-devtools/opencsd/opencsd_1.8.2.bb b/meta-ar=
m/recipes-devtools/opencsd/opencsd_1.8.3.bb
similarity index 95%
rename from meta-arm/recipes-devtools/opencsd/opencsd_1.8.2.bb
rename to meta-arm/recipes-devtools/opencsd/opencsd_1.8.3.bb
index 0a0c7cd62ebf..c18acd313fdb 100644
--- a/meta-arm/recipes-devtools/opencsd/opencsd_1.8.2.bb
+++ b/meta-arm/recipes-devtools/opencsd/opencsd_1.8.3.bb
@@ -4,7 +4,7 @@ LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dad8cb685eb324d2fa2530b985a43f=
3e5"
=20
 SRC_URI =3D "git://github.com/Linaro/OpenCSD;protocol=3Dhttps;branch=3Dm=
aster"
-SRCREV =3D "9b462f77a4e1c6ab363fafe8f1f5d7374f5782b5"
+SRCREV =3D "59f15320637ce6e510604e7bed550d7ad109d15d"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|arm|aarch64).*-linux"
=20
--=20
2.50.1 (Apple Git-155)


