Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3E72C00140
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 16:52:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.9328.1658854369674588822
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 26 Jul 2022 09:52:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAB5D1FB
	for <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 09:52:49 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0E7A83F73B
	for <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 09:52:49 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] Revert "CI: add workaround for zephyr"
Date: Tue, 26 Jul 2022 12:52:42 -0400
Message-Id: <20220726165242.4404-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 26 Jul 2022 16:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3591

This reverts commit 0cdcb8eed4a80593d276bad7a37e1c38d5629b9b.
---
 ci/meta-zephyr.yml | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index 0aa50a7d..bdd0e2bb 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -9,9 +9,5 @@ repos:
     layers:
       meta-zephyr-core:
 
-local_conf_header:
-  gcc12bug: |
-    EXTRA_OECONF:append:pn-gcc-runtime = " ac_cv_func_fcntl=no  ac_cv_func_getexecname=no"
-
 target:
   - zephyr-kernel-test-all
-- 
2.17.1


