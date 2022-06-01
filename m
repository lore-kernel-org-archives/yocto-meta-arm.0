Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF1AC43334
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 18:58:15 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web08.1992.1654109880360125937
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 01 Jun 2022 11:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 903C71063
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Jun 2022 11:57:59 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 702543F73D
	for <meta-arm@lists.yoctoproject.org>; Wed,  1 Jun 2022 11:57:59 -0700 (PDT)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 2/3] CI: add workaround for zephyr
Date: Wed,  1 Jun 2022 14:57:51 -0400
Message-Id: <20220601185752.31915-2-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220601185752.31915-1-jon.mason@arm.com>
References: <20220601185752.31915-1-jon.mason@arm.com>
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 01 Jun 2022 18:58:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3469

GCC 12 is causing problems in newlib, which is causing problems for
zephyr.  Add a workaround until those issues can be resolved.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 ci/meta-zephyr.yml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/ci/meta-zephyr.yml b/ci/meta-zephyr.yml
index bdd0e2bb..0aa50a7d 100644
--- a/ci/meta-zephyr.yml
+++ b/ci/meta-zephyr.yml
@@ -9,5 +9,9 @@ repos:
     layers:
       meta-zephyr-core:
 
+local_conf_header:
+  gcc12bug: |
+    EXTRA_OECONF:append:pn-gcc-runtime = " ac_cv_func_fcntl=no  ac_cv_func_getexecname=no"
+
 target:
   - zephyr-kernel-test-all
-- 
2.17.1


