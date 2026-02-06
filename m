Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD2CEE20AB
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 14:44:13 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12783.1770389047873950164
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 06 Feb 2026 06:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1506C339
	for <meta-arm@lists.yoctoproject.org>; Fri,  6 Feb 2026 06:44:01 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E5453F632
	for <meta-arm@lists.yoctoproject.org>; Fri,  6 Feb 2026 06:44:06 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] arm-bsp/external-system: remove redundant DEBUG_PREFIX_MAP fiddling
Date: Fri,  6 Feb 2026 14:44:02 +0000
Message-ID: <20260206144402.1583348-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 06 Feb 2026 14:44:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6888

We have a newer gcc-arm-none-eabi now, so this can be removed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/external-system/external-system_0.1.0.bb   | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1=
.0.bb b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
index d297c9d047..1d08817e78 100644
--- a/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
+++ b/meta-arm-bsp/recipes-bsp/external-system/external-system_0.1.0.bb
@@ -21,16 +21,13 @@ PRODUCT =3D "corstone-1000"
=20
 B =3D "${WORKDIR}/build"
=20
-# remove once arm-none-eabi-gcc updates to 13 or newer like poky
-DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
-
 LDFLAGS[unexport] =3D "1"
=20
 do_compile() {
     oe_runmake -C ${S} V=3Dy \
         BUILD_PATH=3D${B} \
-	PRODUCT=3D${PRODUCT} \
-	CROSS_COMPILE=3Darm-none-eabi- \
+        PRODUCT=3D${PRODUCT} \
+        CROSS_COMPILE=3Darm-none-eabi- \
         all
 }
=20
--=20
2.43.0


