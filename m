Return-Path: <jon.mason@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6474C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 15:54:12 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.137648.1671119644801845790
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 15 Dec 2022 07:54:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: jon.mason@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFFB41063
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 07:54:44 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E88733F73B
	for <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 07:54:03 -0800 (PST)
From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH] CI: define DEFAULT_TAG
Date: Thu, 15 Dec 2022 10:19:27 -0500
Message-Id: <20221215151927.6340-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.17.1
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 15 Dec 2022 15:54:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4184

DEFAULT_TAG is being used to help with internal Gitlab pipeline setups
know which type of machines to run on, but has not value outside of Arm
Corp.  Gitlab CI allows for variables to be overridden by default.  So,
we can give it a default value of NULL/empty and have everything work
internally and externally by default.

Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .gitlab-ci.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6ee42315..80d2707e 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -25,6 +25,7 @@ stages:
     TOOLCHAIN_DIR: $CI_BUILDS_DIR/persist/toolchains
     IMAGE_DIR: $CI_PROJECT_DIR/work/build/tmp/deploy/images
     TOOLCHAIN_LINK_DIR: $CI_PROJECT_DIR/work/build/toolchains
+    DEFAULT_TAG: ""
   before_script:
     - echo KAS_WORK_DIR = $KAS_WORK_DIR
     - echo SSTATE_DIR = $SSTATE_DIR
-- 
2.17.1


