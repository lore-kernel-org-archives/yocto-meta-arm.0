Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B98D5B16E
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 14:28:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49758.1765808882101292280
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Dec 2025 06:28:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 649BD497
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 06:27:54 -0800 (PST)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 611193F694
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 06:28:01 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] arm/trusted-firmware-m: update 2.1.x to latest hotfix release
Date: Mon, 15 Dec 2025 09:27:59 -0500
Message-ID: <20251215142800.93984-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Dec 2025 14:28:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6796

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ...-src.inc =3D> trusted-firmware-m-2.1.4-src.inc} | 16 ++++++++--------
 ...> trusted-firmware-m-scripts-native_2.1.4.bb} |  0
 ...re-m_2.1.1.bb =3D> trusted-firmware-m_2.1.4.bb} |  0
 3 files changed, 8 insertions(+), 8 deletions(-)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-2.1.1=
-src.inc =3D> trusted-firmware-m-2.1.4-src.inc} (91%)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m-scrip=
ts-native_2.1.1.bb =3D> trusted-firmware-m-scripts-native_2.1.4.bb} (100%=
)
 rename meta-arm/recipes-bsp/trusted-firmware-m/{trusted-firmware-m_2.1.1=
.bb =3D> trusted-firmware-m_2.1.4.bb} (100%)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2=
.1.1-src.inc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m=
-2.1.4-src.inc
similarity index 91%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.=
1.1-src.inc
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.=
4-src.inc
index 10a046e1353b..bae9b11d8c56 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.1-sr=
c.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-2.1.4-sr=
c.inc
@@ -27,21 +27,21 @@ SRC_URI  =3D "${SRC_URI_TRUSTED_FIRMWARE_M};branch=3D=
${SRCBRANCH_tfm};name=3Dtfm;dests
             "
=20
 # The required dependencies are documented in tf-m/config/config_base.cm=
ake
-# TF-Mv2.1.1
+# TF-Mv2.1.4
 SRCBRANCH_tfm ?=3D "release/2.1.x"
-SRCREV_tfm =3D "02bf279913439a07082dd581df033f370a8fbb92"
-# TF-Mv2.1.1
+SRCREV_tfm =3D "03d02d6feed02583c41acfe7147d1117678797a3"
+# TF-Mv2.1.4
 SRCBRANCH_tfm-extras ?=3D "release/2.1.x"
-SRCREV_tfm-extras =3D "95add8abb15879f48f1069a0952dd9abdffbc1f8"
-# TF-Mv2.1.1
+SRCREV_tfm-extras =3D "ef7814a8c95d7df4b150a66557c0073cddce6593"
+# TF-Mv2.1.4
 SRCBRANCH_tfm-tests ?=3D "release/2.1.x"
-SRCREV_tfm-tests =3D "6f642014a8c255e163ae0bc4d21e327de694d6a2"
+SRCREV_tfm-tests =3D "852c6f74c5b7ae61e140d1a46e981f95177aa40e"
 # CMSIS v6.0.0+ (intermediate SHA), CMSIS_TAG from lib/ext/cmsis/CMakeLi=
sts.txt
 SRCBRANCH_cmsis ?=3D "main"
 SRCREV_cmsis =3D "d0c460c1697d210b49a4b90998195831c0cd325c"
-# mbedtls-3.6.2, value from MBEDCRYPTO_VERSION
+# mbedtls-3.6.5, value from MBEDCRYPTO_VERSION
 SRCBRANCH_mbedtls ?=3D "mbedtls-3.6"
-SRCREV_mbedtls =3D "107ea89daaefb9867ea9121002fbbdf926780e98"
+SRCREV_mbedtls =3D "e185d7fd85499c8ce5ca2a54f5cf8fe7dbe3f8df"
 # mcuboot v2.1.0, value from MCUBOOT_VERSION
 SRCBRANCH_mcuboot ?=3D "main"
 SRCREV_mcuboot =3D "9c99326b9756dbcc35b524636d99ed5f3e6cb29b"
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-s=
cripts-native_2.1.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-=
firmware-m-scripts-native_2.1.4.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-sc=
ripts-native_2.1.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m-scri=
pts-native_2.1.4.bb
diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2=
.1.1.bb b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
4.bb
similarity index 100%
rename from meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.=
1.1.bb
rename to meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m_2.1.=
4.bb
--=20
2.50.1 (Apple Git-155)


