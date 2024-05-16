Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B87C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 15:48:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.17755.1715874534520356510
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 May 2024 08:48:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FEEADA7;
	Thu, 16 May 2024 08:49:18 -0700 (PDT)
Received: from PW05BKJD.arm.com (PW05BKJD.arm.com [10.1.35.164])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96CA83F7A6;
	Thu, 16 May 2024 08:48:53 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Bence Balogh <bence.balogh@arm.com>
Subject: [PATCH scarthgap 2/2] arm-bsp/trusted-services: corstone1000: fix IAT test
Date: Thu, 16 May 2024 16:48:43 +0100
Message-Id: <20240516154843.15843-3-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516154843.15843-1-ali.oezaslan@arm.com>
References: <20240516154843.15843-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 16 May 2024 15:48:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5727

From: Bence Balogh <bence.balogh@arm.com>

The psa-iat-api-test was failing because the PLATFORM_HAS_ATTEST_PK
flag was added to the build for Corstone1000.

Signed-off-by: Bence Balogh <bence.balogh@arm.com>
---
 ...M_HAS_ATTEST_PK-define-from-IAT-test.patch | 27 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch b/meta-arm-=
bsp/recipes-security/trusted-services/corstone1000/0010-Remove-PLATFORM_H=
AS_ATTEST_PK-define-from-IAT-test.patch
new file mode 100644
index 00000000..addf879f
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0010-Re=
move-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch
@@ -0,0 +1,27 @@
+From a94bcd8af80c42adf99a7114174afea4000e6647 Mon Sep 17 00:00:00 2001
+From: Bence Balogh <bence.balogh@arm.com>
+Date: Tue, 14 May 2024 15:58:15 +0200
+Subject: [PATCH] Remove PLATFORM_HAS_ATTEST_PK define from IAT test
+
+Signed-off-by: Bence Balogh <bence.balogh@arm.com>
+Upstream-Status: Inappropriate [Should remove the flag only for CS1000]
+---
+ deployments/psa-api-test/initial_attestation/iat-api-test.cmake | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/deployments/psa-api-test/initial_attestation/iat-api-test.c=
make b/deployments/psa-api-test/initial_attestation/iat-api-test.cmake
+index 4d1d2b1a9..eb4db223c 100644
+--- a/deployments/psa-api-test/initial_attestation/iat-api-test.cmake
++++ b/deployments/psa-api-test/initial_attestation/iat-api-test.cmake
+@@ -15,7 +15,7 @@ set(TS_ARCH_TEST_SUITE INITIAL_ATTESTATION CACHE STRIN=
G "Arch test suite")
+ #  Set additional defines needed for build.
+ #----------------------------------------------------------------------=
---------
+ list(APPEND PSA_ARCH_TEST_EXTERNAL_DEFS
+-	-DPSA_ALG_MD4=3D0x02000002 -DPLATFORM_HAS_ATTEST_PK)
++	-DPSA_ALG_MD4=3D0x02000002)
+=20
+ #----------------------------------------------------------------------=
---------
+ #  The arch test build system puts its build output under a test suite =
specific
+--=20
+2.25.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index a0071aa8..2612c411 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -11,6 +11,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0007-plat-corstone1000-Initialize-capsule-update-provider.pat=
ch \
     file://0008-plat-corstone1000-add-client_id-for-FMP-service.patch \
     file://0009-Remove-Werror-flag.patch \
+    file://0010-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
     "
=20
 COMPATIBLE_MACHINE:fvp-base =3D "fvp-base"
--=20
2.34.1


