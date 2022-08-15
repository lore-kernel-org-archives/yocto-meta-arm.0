Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36718C3F6B0
	for <webhook@archiver.kernel.org>; Mon, 15 Aug 2022 21:38:54 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web09.8481.1660599523850902188
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 15 Aug 2022 14:38:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 53895106F
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 14:38:44 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 5C4093F7B4
	for <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 14:38:43 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] atp/atp: drop package inherits
Date: Mon, 15 Aug 2022 09:39:47 -0400
Message-Id: <20220815133948.26528-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220815133948.26528-1-jon.mason@arm.com>
References: <20220815133948.26528-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 15 Aug 2022 21:38:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3688

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 meta-atp/recipes-kernel/atp/atp-test_3.1.bb | 1 -
 meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb | 1 -
 2 files changed, 2 deletions(-)

diff --git a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
index 5a3097e0..e98e13cd 100644
--- a/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-test_3.1.bb
@@ -1,5 +1,4 @@
 require recipes-devtools/atp/atp-source_3.1.inc
-inherit package
 
 SUMMARY = "End-to-end tests evaluating ATP kernel modules service correctness"
 SECTION = "kernel/userland"
diff --git a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb b/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
index 8c793a3d..140105f8 100644
--- a/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
+++ b/meta-atp/recipes-kernel/atp/atp-uapi_3.1.bb
@@ -1,5 +1,4 @@
 require recipes-devtools/atp/atp-source_3.1.inc
-inherit package
 
 SUMMARY = "User API for accessing services from ATP kernel modules"
 SECTION = "kernel/userland"
-- 
2.17.1


