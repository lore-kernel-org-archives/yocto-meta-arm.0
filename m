Return-Path: <ali.oezaslan@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A874C3ABBE
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:51:36 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.81298.1746550286981138785
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 06 May 2025 09:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ali.oezaslan@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4C0B1007;
	Tue,  6 May 2025 09:51:16 -0700 (PDT)
Received: from PW05BKJD.arm.com (unknown [10.1.36.171])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D36643F5A1;
	Tue,  6 May 2025 09:51:25 -0700 (PDT)
From: ali.oezaslan@arm.com
To: meta-arm@lists.yoctoproject.org
Cc: Ali Can Ozaslan <ali.oezaslan@arm.com>
Subject: [PATCH] Align PSA Crypto structs with TF-Mv2.1.1
Date: Tue,  6 May 2025 17:50:45 +0100
Message-Id: <20250506165045.509-2-ali.oezaslan@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250506165045.509-1-ali.oezaslan@arm.com>
References: <20250506165045.509-1-ali.oezaslan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 06 May 2025 16:51:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6487

From: Ali Can Ozaslan <ali.oezaslan@arm.com>

The psa_client_key_attributes_s struct had to be aligned with the
psa_key_attributes_s struct in TF-M.

Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
---
 components/service/crypto/include/psa/crypto_client_struct.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/components/service/crypto/include/psa/crypto_client_struct.h=
 b/components/service/crypto/include/psa/crypto_client_struct.h
index ebc4008..f0c8cad 100644
--- a/components/service/crypto/include/psa/crypto_client_struct.h
+++ b/components/service/crypto/include/psa/crypto_client_struct.h
@@ -38,7 +38,6 @@ struct psa_client_key_attributes_s
     uint32_t alg;
     uint32_t alg2;
     uint32_t id;
-    int32_t owner_id;
 };
=20
 #define PSA_CLIENT_KEY_ATTRIBUTES_INIT {0, 0, 0, 0, 0, 0}
--=20
2.34.1


