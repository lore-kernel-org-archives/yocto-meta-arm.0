Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE73C77B76
	for <webhook@archiver.kernel.org>; Thu, 20 Apr 2023 12:52:38 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.6970.1681995156602438311
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Apr 2023 05:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 05EFB1480;
	Thu, 20 Apr 2023 05:53:20 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B3D613F587;
	Thu, 20 Apr 2023 05:52:35 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: nd@arm.com
Subject: [PATCH 2/6] arm/trusted-firmware-m: clean up environment flags
Date: Thu, 20 Apr 2023 13:52:29 +0100
Message-Id: <20230420125233.1918925-2-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420125233.1918925-1-ross.burton@arm.com>
References: <20230420125233.1918925-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Apr 2023 12:52:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4594

We don't need to unset CFLAGS and LDFLAGS as the CMake file doesn't
respect them anyway.

Add CC to the unexport list for completeness, at least one of these is
needed for now as the build fails without the unexports.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc     | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.i=
nc b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
index a753a3da..09efaffa 100644
--- a/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
+++ b/meta-arm/recipes-bsp/trusted-firmware-m/trusted-firmware-m.inc
@@ -76,10 +76,8 @@ EXTRA_OECMAKE +=3D "-DMBEDCRYPTO_PATH=3D${S}/../mbedtl=
s -DTFM_TEST_REPO_PATH=3D${S}/..
=20
 export CMAKE_BUILD_PARALLEL_LEVEL =3D "${@oe.utils.parallel_make(d, Fals=
e)}"
=20
-# Let the Makefile handle setting up the CFLAGS and LDFLAGS as it is a s=
tandalone application
-CFLAGS[unexport] =3D "1"
-LDFLAGS[unexport] =3D "1"
 AS[unexport] =3D "1"
+CC[unexport] =3D "1"
 LD[unexport] =3D "1"
=20
 # python3-cryptography needs the legacy provider, so set OPENSSL_MODULES=
 to the
--=20
2.34.1


