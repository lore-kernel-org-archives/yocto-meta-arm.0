Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B921DC88CB6
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 14:57:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.61507.1686581822190494179
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 12 Jun 2023 07:57:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66CEE1FB;
	Mon, 12 Jun 2023 07:57:46 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D87573F5A1;
	Mon, 12 Jun 2023 07:57:00 -0700 (PDT)
From: ross.burton@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 1/4] arm/trusted-firmware-m: remove -fcanon-prefix-map from DEBUG_PREFIX_MAP
Date: Mon, 12 Jun 2023 15:56:56 +0100
Message-Id: <20230612145659.934478-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 12 Jun 2023 14:57:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4759

From: Ross Burton <ross.burton@arm.com>

This recipe uses the binary Arm compiler, which is based on GCC 12.
Remove this GCC 13-specific option until the next release.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index d0744423..02acfb8b 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -80,6 +80,9 @@ AS[unexport] =3D "1"
 CC[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
+# remove once arm-none-eabi-gcc updates to 13 or newer like poky
+DEBUG_PREFIX_MAP:remove =3D "-fcanon-prefix-map"
+
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
 # right path until this is relocated automatically.
 export OPENSSL_MODULES=3D"${STAGING_LIBDIR_NATIVE}/ossl-modules"
--=20
2.34.1


