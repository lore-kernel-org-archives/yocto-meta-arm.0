Return-Path: <frazer.carsley@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F07FCCD18E
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 15:49:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.47323.1760370578648604484
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 08:49:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: frazer.carsley@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13E3412FC;
	Mon, 13 Oct 2025 08:49:30 -0700 (PDT)
Received: from e138143.cambridge.arm.com (e138143.arm.com [10.1.29.180])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3378E3F66E;
	Mon, 13 Oct 2025 08:49:37 -0700 (PDT)
From: Frazer Carsley <frazer.carsley@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Frazer Carsley <frazer.carsley@arm.com>
Subject: [PATCH 1/2] arm-bsp/corstone1000:trusted-services: Fix psa-crypto-api-tests
Date: Mon, 13 Oct 2025 16:49:11 +0100
Message-ID: <20251013154912.55363-2-frazer.carsley@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251013154912.55363-1-frazer.carsley@arm.com>
References: <20251013154912.55363-1-frazer.carsley@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 13 Oct 2025 15:49:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6734

Re-adds a patch aligning the Trusted Services PSA Crypto
structure with its equivalent definition in TF-M v2.1.1.
The patch was previously removed during the upgrade to
Trusted Services v1.2, as it was believed to be included in that
version. However, the alignment is still required to maintain
consistency with TF-M v2.1.1.

Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
---
 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch | 40 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  2 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0013-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0013-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0013-Align-PSA-Crypto-structs-wi=
th-TF-Mv2.1.1.patch
new file mode 100644
index 00000000..4131cb63
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0013-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
@@ -0,0 +1,40 @@
+From 8802bad31a37ded724cf157e49b6491226654d35 Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Tue, 29 Apr 2025 07:52:14 +0000
+Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
+
+The psa_client_key_attributes_s struct had to be aligned with the
+psa_key_attributes_s struct in TF-M.
+
+Change-Id: Ia3b5e8f313bd79a321dda6a61357c1a5e5a17bc2
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Signed-off-by: Musa Antike <musa.antike@arm.com>
+Signed-off-by: Frazer Carsley <frazer.carsley@arm.com>
+
+Upstream-Status: Backport [8802bad31a37ded724cf157e49b6491226654d35 on i=
ntegration branch]
+---
+ components/service/crypto/include/psa/crypto_client_struct.h | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
+index 7e907faa..db2f9161 100644
+--- a/components/service/crypto/include/psa/crypto_client_struct.h
++++ b/components/service/crypto/include/psa/crypto_client_struct.h
+@@ -1,5 +1,5 @@
+ /*
+- * Copyright (c) 2020-2023, Arm Limited. All rights reserved.
++ * Copyright (c) 2020-2025, Arm Limited. All rights reserved.
+  *
+  * SPDX-License-Identifier: BSD-3-Clause
+  *
+@@ -38,7 +38,6 @@ struct psa_client_key_attributes_s
+     uint32_t alg;
+     uint32_t alg2;
+     uint32_t id;
+-    int32_t owner_id;
+ };
+=20
+ #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0}
+--=20
+2.43.0
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 092a2cb4..5ebb08dc 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -14,7 +14,9 @@ SRC_URI:append:corstone1000  =3D " \
     file://0010-Revert-Load-and-store-UEFI-variable-index-in-chunks.patc=
h \
     file://0011-Remove-PLATFORM_HAS_ATTEST_PK-define-from-IAT-test.patch=
 \
     file://0012-psa-crypto-fix-AEAD-block-cypher-support.patch \
+    file://0013-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
 "
+
 # The patches above introduce errors with GCC 14.1, silence them for now
 CFLAGS:append:corstone1000 =3D " -Wno-int-conversion -Wno-implicit-funct=
ion-declaration"
=20

