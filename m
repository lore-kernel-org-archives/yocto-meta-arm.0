Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EDA8C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 16:41:03 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.139031.1671122455943080675
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 08:40:56 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DBD4D1063
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 08:41:35 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 183D23F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 08:40:55 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH v2] CI: define DEFAULT_TAG and CPU_REQUEST
Date: Thu, 15 Dec 2022 10:24:15 -0500
Message-Id: <20221215152415.6537-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 16:41:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4194

DEFAULT_TAG and CPU_REQUEST are being used to help with internal Gitlab
pipeline setups know which type of machines to run on, but has no value
outside of Arm Corp.  Gitlab CI allows for variables to be overridden
by default.  So, we can give it a default value of NULL/empty and have
everything work internally and externally by default.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6ee42315..cc5710c2 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -1,8 +1,10 @@
 image: ghcr.io/siemens/kas/kas:latest-release
 
-# These are needed as the k8s executor doesn't respect the container entrypoint
-# by default
 variables:
+  CPU_REQUEST: ""
+  DEFAULT_TAG: ""
+  # These are needed as the k8s executor doesn't respect the container entrypoint
+  # by default
   FF_USE_LEGACY_KUBERNETES_EXECUTION_STRATEGY: 0
   FF_KUBERNETES_HONOR_ENTRYPOINT: 1
 
-- 
2.17.1


