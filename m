Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B40C3600B
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 17:54:10 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.2289.1742925244259473423
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 10:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A48F71756
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Mar 2025 10:54:09 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5F05F3F58B
	for <meta-arm@lists.yoctoproject.org>; Tue, 25 Mar 2025 10:54:03 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/2] CI: use DEFAULT_TAG as the default ACS_TAG
Date: Tue, 25 Mar 2025 17:53:57 +0000
Message-ID: <20250325175358.2562904-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Mar 2025 17:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6410

This stops the job being stuck if the runners will only take jobs that
have been tagged.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .gitlab-ci.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 48ce592f..f4b3262c 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -10,7 +10,7 @@ variables:
   # The default machine tag for the build jobs
   DEFAULT_TAG: ""
   # The machine tag for the ACS test jobs
-  ACS_TAG: ""
+  ACS_TAG: "$DEFAULT_TAG"
   # The directory to use as the persistent cache (the root for DL_DIR, S=
STATE_DIR, etc)
   CACHE_DIR: $CI_BUILDS_DIR/persist
   # The container mirror to use
--=20
2.43.0


