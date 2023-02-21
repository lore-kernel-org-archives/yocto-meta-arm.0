Return-Path: <mohamed.omarasaker@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD72C61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 17:51:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.48757.1677001899787276403
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 09:51:39 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: mohamed.omarasaker@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5FE81650;
	Tue, 21 Feb 2023 09:52:21 -0800 (PST)
Received: from e126544.cambridge.arm.com (unknown [10.1.199.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 484B63F881;
	Tue, 21 Feb 2023 09:51:38 -0800 (PST)
From: mohamed.omarasaker@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
Subject: [PATCH 2/2] arm-bsp/trusted-firmware-m:corstone1000: Set SPM backend to IPC
Date: Tue, 21 Feb 2023 17:51:29 +0000
Message-Id: <20230221175129.308197-3-mohamed.omarasaker@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
References: <20230221175129.308197-1-mohamed.omarasaker@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 21 Feb 2023 17:51:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4435

From: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>

TF-M provides IPC as a SPM backend which gives SPM and each Secure Partit=
ion
it's own execution context. And provides higher isolation levels.

corstone1000 isolation level is 2. Hence, switching to IPC backend.

Signed-off-by: Mohamed Omar Asaker <mohamed.omarasaker@arm.com>
---
 .../trusted-firmware-m-1.7.0-corstone1000.inc                  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware=
-m-1.7.0-corstone1000.inc b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/t=
rusted-firmware-m-1.7.0-corstone1000.inc
index ee35a253..d89aca37 100644
--- a/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.=
0-corstone1000.inc
+++ b/meta-arm-bsp/recipes-bsp/trusted-firmware-m/trusted-firmware-m-1.7.=
0-corstone1000.inc
@@ -11,6 +11,9 @@ TFM_PLATFORM_IS_FVP ?=3D "FALSE"
 EXTRA_OECMAKE +=3D "-DPLATFORM_IS_FVP=3D${TFM_PLATFORM_IS_FVP}"
 EXTRA_OECMAKE +=3D "-DCC312_LEGACY_DRIVER_API_ENABLED=3DOFF"
=20
+## Setting SPM backend to IPC
+EXTRA_OECMAKE +=3D "-DCONFIG_TFM_SPM_BACKEND=3DIPC"
+
 # libmetal
 LICENSE +=3D "& BSD-3-Clause"
 LIC_FILES_CHKSUM +=3D "file://../libmetal/LICENSE.md;md5=3Dfe0b8a4beea8f=
0813b606d15a3df3d3c"
--=20
2.25.1


