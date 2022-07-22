Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43D28CCA48C
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 16:23:37 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.9919.1658507008836931036
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 22 Jul 2022 09:23:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81C80106F
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 09:23:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DAC883F73D
	for <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 09:23:27 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: use uboot instead of none for juno
Date: Fri, 22 Jul 2022 12:23:22 -0400
Message-Id: <20220722162323.2508-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220722162323.2508-1-jon.mason@arm.com>
References: <20220722162323.2508-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 22 Jul 2022 16:23:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3584

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index f3ca24d3..36cf61ac 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -67,6 +67,7 @@ update-repos:
 # Available options for building are
 #  TOOLCHAINS: [gcc, clang, armgcc, external-gccarm]
 #  TCLIBC: [glibc, musl]
+#  FIRMWARE: [uboot, edk2]
 #  VIRT: [none, xen]
 #  TESTING: testimage
 
@@ -134,7 +135,7 @@ juno:
   parallel:
     matrix:
       - TOOLCHAINS: [gcc, clang]
-        FIRMWARE: [none, edk2]
+        FIRMWARE: [uboot, edk2]
 
 microbit-v1:
   extends: .build_and_test
-- 
2.17.1


