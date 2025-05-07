Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E743C3ABC0
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 17:39:45 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.2027.1746639577543496247
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 May 2025 10:39:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FDE11CC4;
	Wed,  7 May 2025 10:39:27 -0700 (PDT)
Received: from PW05BKJD.arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE42F3F5A1;
	Wed,  7 May 2025 10:39:36 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH walnascar 1/1] arm-bsp/trusted-services: corstone1000: Align PSA crypto structs with TF-M
Date: Wed,  7 May 2025 18:39:21 +0100
Message-Id: <20250507173921.754-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250507173921.754-1-ali.oezaslan@arm.com>
References: <20250507173921.754-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 07 May 2025 17:39:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6495

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

The TF-M was upgraded to v2.1.1 for the Corstone-1000. The TS had to be
aligned with it, to keep the Secure Enclave Proxy Secure Partition
compatible with TF-M.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 ...n-PSA-Crypto-structs-with-TF-Mv2.1.1.patch | 29 +++++++++++++++++++
 .../trusted-services/ts-arm-platforms.inc     |  1 +
 2 files changed, 30 insertions(+)
 create mode 100644 meta-arm-bsp/recipes-security/trusted-services/corsto=
ne1000/0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0021-Align-PSA-Crypto-structs-wi=
th-TF-Mv2.1.1.patch
new file mode 100644
index 00000000..352fe9ea
--- /dev/null
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
@@ -0,0 +1,29 @@
+From 71da6c0384fb241cadf052968e8dce9c357e4a33 Mon Sep 17 00:00:00 2001
+From: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Date: Tue, 29 Apr 2025 07:52:14 +0000
+Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
+
+The psa_client_key_attributes_s struct had to be aligned with the
+psa_key_attributes_s struct in TF-M.
+
+Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
+Upstream-Status: Pending
+---
+ components/service/crypto/include/psa/crypto_client_struct.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/components/service/crypto/include/psa/crypto_client_struct.=
h b/components/service/crypto/include/psa/crypto_client_struct.h
+index ebc4008..f0c8cad 100644
+--- a/components/service/crypto/include/psa/crypto_client_struct.h
++++ b/components/service/crypto/include/psa/crypto_client_struct.h
+@@ -38,7 +38,6 @@ struct psa_client_key_attributes_s
+     uint32_t alg;
+     uint32_t alg2;
+     uint32_t id;
+-    int32_t owner_id;
+ };
+=20
+ #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
+--=20
+2.34.1
+
diff --git a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platfo=
rms.inc b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms=
.inc
index 770c47ab..84f4c07f 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
+++ b/meta-arm-bsp/recipes-security/trusted-services/ts-arm-platforms.inc
@@ -22,6 +22,7 @@ SRC_URI:append:corstone1000  =3D " \
     file://0018-Make-RSS-and-MHU-sizes-compile-time-definitions-user.pat=
ch \
     file://0019-Align-PSA-Crypto-with-TF-Mv2.1.patch \
     file://0020-se-proxy-protobuf-change.patch \
+    file://0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch \
     "
=20
 # The patches above introduce errors with GCC 14.1, silence them for now
--=20
2.34.1


