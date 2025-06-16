Return-Path: <hugues.kambampiana@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1ABAC71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 05:56:21 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23969.1750053374124180741
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 15 Jun 2025 22:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: hugues.kambampiana@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 76304150C;
	Sun, 15 Jun 2025 22:55:52 -0700 (PDT)
Received: from e129527.arm.com (unknown [10.57.48.230])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEC133F66E;
	Sun, 15 Jun 2025 22:56:12 -0700 (PDT)
From: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: [PATCH] arm-bsp/trusted-services: corstone1000: Update PSA Crypto patch status to Backport
Date: Mon, 16 Jun 2025 06:56:05 +0100
Message-Id: <20250616055605.372335-1-hugues.kambampiana@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 16 Jun 2025 05:56:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6554

Modify the upstream status of the patch to align a PSA crypto struct with
TF-M from Pending to Backport as it is included in TS v1.2.0 release cand=
idate.


Signed-off-by: Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
---
 .../0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/=
0021-Align-PSA-Crypto-structs-with-TF-Mv2.1.1.patch b/meta-arm-bsp/recipe=
s-security/trusted-services/corstone1000/0021-Align-PSA-Crypto-structs-wi=
th-TF-Mv2.1.1.patch
index 352fe9ea..238037cd 100644
--- a/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
+++ b/meta-arm-bsp/recipes-security/trusted-services/corstone1000/0021-Al=
ign-PSA-Crypto-structs-with-TF-Mv2.1.1.patch
@@ -7,7 +7,7 @@ The psa_client_key_attributes_s struct had to be aligned =
with the
 psa_key_attributes_s struct in TF-M.
=20
 Signed-off-by: Ali Can Ozaslan <ali.oezaslan@arm.com>
-Upstream-Status: Pending
+Upstream-Status: Backport [Included in version v1.2.0]
 ---
  components/service/crypto/include/psa/crypto_client_struct.h | 1 -
  1 file changed, 1 deletion(-)

