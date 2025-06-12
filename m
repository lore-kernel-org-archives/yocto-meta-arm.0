Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02F68C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 13:05:44 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.12690.1749733542936126277
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 06:05:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B942153B
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 06:05:22 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F7CF3F59E
	for <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 06:05:42 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI/fvp-base-ts: append the testcases
Date: Thu, 12 Jun 2025 09:05:40 -0400
Message-Id: <20250612130541.88191-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 12 Jun 2025 13:05:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6546

The test cases for fvp-base will not fully run because the trusted
servies ones are the only ones (instead of being appended to the list).
Correcting this issue so that all the tests can be run.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/fvp-base-ts.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/fvp-base-ts.yml b/ci/fvp-base-ts.yml
index 62d7995b004d..21757c6cf5d0 100644
--- a/ci/fvp-base-ts.yml
+++ b/ci/fvp-base-ts.yml
@@ -10,7 +10,7 @@ header:
 local_conf_header:
   trusted_services: |
     # Enable the needed test suites
-    TEST_SUITES =3D " ping ssh trusted_services"
+    TEST_SUITES:append =3D " trusted_services"
     # Include all Secure Partitions into the image
     MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
     MACHINE_FEATURES:append =3D " ts-attestation ts-smm-gateway optee-sp=
mc-test"
--=20
2.39.5 (Apple Git-154)


