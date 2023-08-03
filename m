Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED7FEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 18:34:02 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.1924.1691087632665884834
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 11:33:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7E9A2113E;
	Thu,  3 Aug 2023 11:34:34 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F148B3F793;
	Thu,  3 Aug 2023 11:33:50 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 4/5] arm/trusted-firmware-m: explicitly use Arm GCC 11.2
Date: Thu,  3 Aug 2023 19:33:46 +0100
Message-Id: <20230803183347.3414946-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230803183347.3414946-1-ross.burton@arm.com>
References: <20230803183347.3414946-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 03 Aug 2023 18:34:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4933

From: Ross Burton <ross.burton@arm.com>

TF-M recommend using GCC 11.2 as 11.3 onwards currently has code
generation issues.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc    | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index 02acfb8b..eeb6135a 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -24,10 +24,13 @@ INHIBIT_DEFAULT_DEPS =3D "1"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
+# At present, TF-M needs GCC >10 but <11.3 so use 11.2:
+# https://git.trustedfirmware.org/TF-M/trusted-firmware-m.git/tree/docs/=
getting_started/tfm_getting_started.rst?h=3DTF-Mv1.8.0#n214
+#
 # See tools/requirements.txt for Python dependencies
 DEPENDS +=3D "cmake-native \
             ninja-native \
-            gcc-arm-none-eabi-native \
+            gcc-arm-none-eabi-11.2-native \
             python3-cbor2-native \
             python3-click-native \
             python3-cryptography-native \
--=20
2.34.1


