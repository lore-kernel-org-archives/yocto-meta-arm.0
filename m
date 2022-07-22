Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40487C433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9701.1658507008972001942
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 09:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 585761063
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 09:23:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF5173F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 09:23:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 1/3] ci/qemu-cortex-m3: remove common test
Date: Fri, 22 Jul 2022 12:23:21 -0400
Message-Id: <20220722162323.2508-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3586

The common test has a timing issue, causing it to intermittently fail.
Since it is not unique to our environment, remove it to prevent false
positive regressions.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/qemu-cortex-m3.yml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ci/qemu-cortex-m3.yml b/ci/qemu-cortex-m3.yml
index 6f892a9e..f45cb9e1 100644
--- a/ci/qemu-cortex-m3.yml
+++ b/ci/qemu-cortex-m3.yml
@@ -13,7 +13,7 @@ local_conf_header:
   tclibc: |
     TCLIBC = "newlib"
   nonbuilding_tests: |
-    ZEPHYRTESTS:remove = "context pending poll sleep"
+    ZEPHYRTESTS:remove = "common context pending poll sleep"
   qemu_opts: |
     QB_OPT_APPEND = "-icount shift=3,align=off,sleep=on -rtc clock=vm"
 
-- 
2.17.1


