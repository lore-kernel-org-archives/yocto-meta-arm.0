Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8E1C4332F
	for <webhook@archiver.kernel.org>; Thu, 20 Oct 2022 14:02:56 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web12.9940.1666274566914133025
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Oct 2022 07:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACF9FED1
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Oct 2022 07:02:52 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 559DC3F67D
	for <meta-arm@lists.yoctoproject.org>; Thu, 20 Oct 2022 07:02:46 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: track langdale branch
Date: Thu, 20 Oct 2022 10:02:38 -0400
Message-Id: <20221020140238.6982-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Oct 2022 14:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3988

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/base.yml              | 2 +-
 ci/clang.yml             | 1 +
 ci/meta-openembedded.yml | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/ci/base.yml b/ci/base.yml
index 3619b8f2..49812656 100644
--- a/ci/base.yml
+++ b/ci/base.yml
@@ -5,7 +5,7 @@ distro: poky
 
 defaults:
   repos:
-    refspec: master
+    refspec: langdale
 
 repos:
   meta-arm:
diff --git a/ci/clang.yml b/ci/clang.yml
index a2063f19..e5e7dd5f 100644
--- a/ci/clang.yml
+++ b/ci/clang.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-clang:
     url: https://github.com/kraj/meta-clang
+    refspec: master
 
 local_conf_header:
   clang: |
diff --git a/ci/meta-openembedded.yml b/ci/meta-openembedded.yml
index bed338da..dd0f6633 100644
--- a/ci/meta-openembedded.yml
+++ b/ci/meta-openembedded.yml
@@ -4,6 +4,7 @@ header:
 repos:
   meta-openembedded:
     url: https://git.openembedded.org/meta-openembedded
+    refspec: master
     layers:
       meta-filesystems:
       meta-networking:
-- 
2.17.1


