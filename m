Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD67C00528
	for <webhook@archiver.kernel.org>; Wed, 19 Jul 2023 01:22:53 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.4386.1689729766572238324
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 18 Jul 2023 18:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F30D32F4;
	Tue, 18 Jul 2023 18:23:28 -0700 (PDT)
Received: from debian.lan?044arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7C8983F67D;
	Tue, 18 Jul 2023 18:22:45 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Ross Burton <ross.burton@arm.com>
Subject: [PATCH v2 1/8] CI: track master
Date: Tue, 18 Jul 2023 20:22:33 -0500
Message-Id: <20230719012240.3567881-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Jul 2023 01:22:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4896

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 38d8584f..4296d270 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
=20
 defaults:
   repos:
-    branch: mickledore
+    branch: master
=20
 repos:
   meta-arm:
--=20
2.30.2


