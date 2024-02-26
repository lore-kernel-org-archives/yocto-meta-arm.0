Return-Path: <drew.reed@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF073C54E49
	for <webhook@archiver.kernel.org>; Mon, 26 Feb 2024 13:34:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.20334.1708954489866718562
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 26 Feb 2024 05:34:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: drew.reed@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25AB8DA7;
	Mon, 26 Feb 2024 05:35:28 -0800 (PST)
Received: from C02DP1BVML7H.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BD5063F762;
	Mon, 26 Feb 2024 05:34:48 -0800 (PST)
From: drew.reed@arm.com
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com
Cc: nd@arm.com,
	Drew Reed <Drew.Reed@arm.com>
Subject: [PATCH] ci: Ensure tests are in the Corstone-1000 flash image
Date: Mon, 26 Feb 2024 13:34:34 +0000
Message-ID: <20240226133434.6658-1-drew.reed@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 26 Feb 2024 13:34:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5399

From: Drew Reed <Drew.Reed@arm.com>

To ensure the psa and optee tests are included in the initramsfs based
rootfs included within the flash image so the tests can be run.

Signed-off-by: Drew Reed <Drew.Reed@arm.com>
---
 ci/corstone1000-common.yml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/ci/corstone1000-common.yml b/ci/corstone1000-common.yml
index 50327694..4c715176 100644
--- a/ci/corstone1000-common.yml
+++ b/ci/corstone1000-common.yml
@@ -38,10 +38,10 @@ local_conf_header:
     RRECOMMENDS:${KERNEL_PACKAGE_NAME}-base =3D ""
=20
     # all optee packages
-    IMAGE_INSTALL +=3D "optee-client"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "optee-client"
=20
     # TS PSA API tests commands for crypto, its, ps and iat
-    IMAGE_INSTALL +=3D "packagegroup-ts-tests-psa"
+    CORE_IMAGE_EXTRA_INSTALL +=3D "packagegroup-ts-tests-psa"
=20
 target:
   - core-image-minimal
--=20
2.43.0


