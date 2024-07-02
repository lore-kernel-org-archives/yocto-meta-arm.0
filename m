Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B779C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 19:36:01 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.33379.1719948957997957651
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 02 Jul 2024 12:35:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40855339
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Jul 2024 12:36:20 -0700 (PDT)
Received: from H24V3P4C17.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E86E13F766
	for <meta-arm@lists.yoctoproject.org>; Tue,  2 Jul 2024 12:35:54 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: remove ts-smm-gateway for qemuarm64-secureboot-ts
Date: Tue,  2 Jul 2024 15:35:53 -0400
Message-Id: <20240702193553.34632-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 02 Jul 2024 19:36:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5860

uefi-test is failing on qemuarm64-secureboot with TS enabled with a "Bus
Error".  This regression is caused by the update of QEMU from v8.2.1 to
v9.0.0.  Temporarily disable this test (via disabling ts-smm-gateway) to
get CI green until it can be root caused.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemuarm64-secureboot-ts.yml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/ci/qemuarm64-secureboot-ts.yml b/ci/qemuarm64-secureboot-ts.=
yml
index adf1f2f8402d..87f0fa9ed888 100644
--- a/ci/qemuarm64-secureboot-ts.yml
+++ b/ci/qemuarm64-secureboot-ts.yml
@@ -8,8 +8,9 @@ header:
 local_conf_header:
   trusted_services: |
     TEST_SUITES:append =3D " trusted_services"
-    # Include TS Crypto, TS Protected Storage, TS Internal Trusted Stora=
ge and SMM-Gateway SPs into optee-os image
-    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its ts=
-smm-gateway"
+    # Include TS Crypto, TS Protected Storage, and TS Internal Trusted S=
torage and SPs into optee-os image
+    # FIXME - remove TS SMM Gateway due to QEMU v9.0.0 test failures
+    MACHINE_FEATURES:append =3D " arm-ffa ts-crypto ts-storage ts-its"
     # Include TS demo/test tools into image
     IMAGE_INSTALL:append =3D " packagegroup-ts-tests"
     # Include TS PSA Arch tests into image
--=20
2.39.3 (Apple Git-146)


