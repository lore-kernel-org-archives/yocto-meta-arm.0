Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBD9CCA473
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 18:58:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.1934.1654109880450369599
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 11:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 59BDFD6E
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Jun 2022 11:57:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 3A3F63F73D
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Jun 2022 11:57:59 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] CI: use upstream master branch
Date: Wed,  1 Jun 2022 14:57:50 -0400
Message-Id: <20220601185752.31915-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Jun 2022 18:58:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3468

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 6cb18589..4c997463 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
 
 defaults:
   repos:
-    refspec: kirkstone
+    refspec: master
 
 repos:
   meta-arm:
-- 
2.17.1


