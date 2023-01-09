Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DCA1C5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 17:20:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.78788.1673284827119386367
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 09 Jan 2023 09:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A45DF1596;
	Mon,  9 Jan 2023 09:21:08 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3CA563F587;
	Mon,  9 Jan 2023 09:20:26 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/4] arm/fvp-envelope: update HOMEPAGE
Date: Mon,  9 Jan 2023 17:20:20 +0000
Message-Id: <20230109172022.2280271-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109172022.2280271-1-ross.burton@arm.com>
References: <20230109172022.2280271-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 09 Jan 2023 17:20:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4245

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-devtools/fvp/fvp-envelope.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc b/meta-arm/re=
cipes-devtools/fvp/fvp-envelope.inc
index 2884bb56..1e8bb407 100644
--- a/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
+++ b/meta-arm/recipes-devtools/fvp/fvp-envelope.inc
@@ -1,6 +1,6 @@
 require fvp-common.inc
=20
-HOMEPAGE =3D "https://developer.arm.com/tools-and-software/simulation-mo=
dels/fixed-virtual-platforms/arm-ecosystem-models"
+HOMEPAGE =3D "https://developer.arm.com/Tools%20and%20Software/Fixed%20V=
irtual%20Platforms"
=20
 SRC_URI =3D "https://developer.arm.com/-/media/Files/downloads/ecosystem=
-models/${MODEL_CODE}_${PV_URL}_${FVP_ARCH}.tgz;subdir=3D${BP};name=3Dfvp=
-${HOST_ARCH}"
=20
--=20
2.34.1


