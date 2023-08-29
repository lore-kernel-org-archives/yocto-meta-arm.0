Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E330EC83F14
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 16:22:29 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.1302.1693326149085099251
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 29 Aug 2023 09:22:29 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A0FC1FEC;
	Tue, 29 Aug 2023 09:23:06 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AEEE13F738;
	Tue, 29 Aug 2023 09:22:26 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/2] arm-bsp/external-system: set PACKAGE_ARCH as this is machine-specific
Date: Tue, 29 Aug 2023 17:22:24 +0100
Message-Id: <20230829162224.2459115-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230829162224.2459115-1-ross.burton@arm.com>
References: <20230829162224.2459115-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 29 Aug 2023 16:22:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5002

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index e047d2a6..5bdad3b0 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -15,6 +15,7 @@ SRCREV =3D "8c9dca74b104ff6c9722fb0738ba93dd3719c080"
 PV .=3D "+git"
=20
 COMPATIBLE_MACHINE =3D "(corstone1000)"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
 # PRODUCT is passed to the Makefile to specify the platform to be used.
 PRODUCT =3D "corstone-1000"
--=20
2.34.1


