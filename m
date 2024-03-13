Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5883C54E66
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 20:13:48 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.6182.1710360824498850648
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 13:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4CA51063;
	Wed, 13 Mar 2024 13:14:20 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 828703F64C;
	Wed, 13 Mar 2024 13:13:43 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>,
	Emekcan Aras <emekcan.aras@arm.com>
Subject: [PATCH 3/3] arm/trusted-firmware-m: Change GNU Arm compiler version for TF-M 2.0
Date: Wed, 13 Mar 2024 20:13:25 +0000
Message-Id: <20240313201325.27043-4-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240313201325.27043-1-ali.oezaslan@arm.com>
References: <20240313201325.27043-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 20:13:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5436

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

GNU Arm compiler version greater and equal than *11.3.Rel1*
has a linker issue in syscall for TF-M 1.8.0. Let's bump to
TF-M 2.0 which contains the fix for the issue.

Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc   | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 1747c654..772366d9 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -22,13 +22,13 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-# At present, TF-M needs GCC >10 but <11.3 so use 11.2:
-# https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/docs/=
getting_started/tfm_getting_started.rst?h=3DTF-Mv1.8.0#n214
+# At present, TF-M Select other GNU Arm compiler versions instead of 11.=
2:
+# https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/docs/=
getting_started/tfm_getting_started.rst#n214
 #
 # See tools/requirements.txt for Python dependencies
 DEPENDS +=3D "cmake-native \
             ninja-native \
-            gcc-arm-none-eabi-11.2-native \
+            gcc-arm-none-eabi-native \
             python3-cbor2-native \
             python3-click-native \
             python3-cryptography-native \
--=20
2.34.1


