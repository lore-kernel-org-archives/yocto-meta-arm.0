Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDD58C43217
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 15:56:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1322.1636646170009548872
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 07:56:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 610A5ED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 07:56:09 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0CC383F718
	for <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 07:56:08 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 5/5] arm-bsp/trusted-firmware-m: remove INSANE_SKIP in
 corstone1000
Date: Thu, 11 Nov 2021 15:56:01 +0000
Message-Id: <20211111155601.2516005-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111155601.2516005-1-ross.burton@arm.com>
References: <20211111155601.2516005-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 11 Nov 2021 15:56:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2369

The build is successful without this, so presumably it's obsolete.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../trusted-firmware-m/trusted-firmware-m-corstone1000.inc    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted=
-firmware-m-corstone1000.inc
index 530968c3..9114905b 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-cors=
tone1000.inc
@@ -4,9 +4,7 @@ COMPATIBLE_MACHINE =3D "(corstone1000)"
=20
 TFM_DEBUG =3D "1"
=20
-INSANE_SKIP:${PN} =3D "arch"
-
-## Default is the FVP ##
+# Default is the FVP
 TFM_PLATFORM_IS_FVP ?=3D "TRUE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
=20
--=20
2.25.1


